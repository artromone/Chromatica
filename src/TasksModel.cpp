#include <QStandardPaths>
#include <QDesktopServices>
#include <QFile>
#include <QDir>
#include <QUrl>
#include <QJsonDocument>
#include <QJsonValue>
#include <QJsonObject>

#include "TasksModel.h"
#include "TaskUtils.h"

namespace
{
QString notesDirPath() {

    QString dirPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/notes";

    QDir dir(dirPath);
    if (!dir.exists())
    {
        dir.mkpath(dirPath);
    }

    return dirPath;
}
}

TasksModel::TasksModel(QObject* parent)
{
    loadTasks();
}

int TasksModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return tasks.size();
}

QVariant TasksModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() >= tasks.size())
    {
        return {};
    }

    if (Name == role)
    {
        return tasks.at(index.row()).name;
    }
    if (Priority == role)
    {
        return tasks.at(index.row()).priority;
    }
    if (CreationTime == role)
    {
        return tasks.at(index.row()).creationDate;
    }

    return {};
}

bool TasksModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
}

QHash<int, QByteArray> TasksModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();

    roles[Roles::Name] = "name";
    roles[Roles::Priority] = "priority";
    roles[Roles::CreationTime] = "creation_date";

    return roles;
}

void TasksModel::addTask(const QString &taskName)
{
    int n = tasks.size();

    beginInsertRows(QModelIndex(), n, n);
    tasks.push_back(Task{taskName, Task::Priority::Default, QDateTime::currentDateTime()});
    endInsertRows();

    saveTasks();
}

void TasksModel::removeTask(const QString &taskName)
{
    auto it = std::find_if(tasks.begin(), tasks.end(), [taskName](const Task& task){return task.name == taskName;});

    int i = std::distance(tasks.begin(), it);
    beginRemoveRows(QModelIndex(), i, i);
    tasks.erase(it);
    endRemoveRows();

    saveTasks();
}

void TasksModel::openTask(const QString &taskName)
{
    QString filename = notesDirPath() + "/" + taskName + ".json";
    // qDebug() << filename;
    QDesktopServices::openUrl(QUrl::fromLocalFile(filename));
}

void TasksModel::saveTasks()
{
    QDir notesDir(notesDirPath());
    notesDir.setNameFilters(QStringList() << "*.json");
    notesDir.setFilter(QDir::Files);
    foreach (QString dirFile, notesDir.entryList()) {
        notesDir.remove(dirFile);
    }

    for (auto& task : tasks) {

        QString filename = notesDirPath() + "/" + task.name + ".json";

        QJsonObject jsonObj;
        jsonObj["name"] = task.name;
        jsonObj["priority"] = utils::priorityToString(task.priority);
        jsonObj["date"] = utils::dateTimeToString(task.creationDate);

        QJsonDocument doc(jsonObj);
        QFile jsonFile(filename);

        if (jsonFile.open(QFile::WriteOnly)) {

            jsonFile.write(doc.toJson());
            jsonFile.close();
        }
    }
}

void TasksModel::loadTasks()
{
    QDir dir(notesDirPath());

    auto fileInfoList = dir.entryInfoList(QDir::Files);
    for(auto& fileInfo : fileInfoList) {

        if(fileInfo.completeSuffix() == "json") {

            QFile jsonFile(fileInfo.absoluteFilePath());

            if (!jsonFile.open(QIODevice::ReadOnly)) {
                qDebug() << "Couldn't open " << fileInfo.fileName();
                continue;
            }

            QJsonDocument doc = QJsonDocument::fromJson(jsonFile.readAll());
            if (!doc.isNull() && doc.isObject()) {

                QJsonObject jsonObj = doc.object();

                QString name = jsonObj["name"].toString();
                Task::Priority priority = utils::stringToPriority(jsonObj["priority"].toString());
                QDateTime dateTime = utils::stringToDateTime(jsonObj["date"].toString());

                tasks.push_back(Task{name, priority, dateTime});
            }
        }
    }
}
