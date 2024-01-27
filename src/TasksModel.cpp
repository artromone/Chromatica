#include <QStandardPaths>
#include <QDesktopServices>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include <QFile>
#include <QDir>
#include <QUrl>

#include <QCryptographicHash>
#include <QRegularExpression>

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
QString generateFileNameHash(const QString& str)
{
    QCryptographicHash hash(QCryptographicHash::Sha256);
    hash.addData(str.toUtf8());
    hash.addData(QString::number(QDateTime::currentDateTime().toMSecsSinceEpoch()).toUtf8());
    return QString(hash.result().toHex());
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

    if (TaskName == role)
    {
        return tasks.at(index.row()).taskName;
    }
    if (FileName == role)
    {
        return tasks.at(index.row()).fileHash;
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
    if (!index.isValid() || index.row() >= tasks.size())
    {
        return false;
    }

    if (TaskName == role)
    {
        qDebug() << value.toString();
        tasks.at(index.row()).taskName = value.toString();
        saveTasks();
        return true;
    }

    return false;
}

QHash<int, QByteArray> TasksModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();

    roles[Roles::TaskName] = "task_name";
    roles[Roles::FileName] = "file_name";
    roles[Roles::Priority] = "priority";
    roles[Roles::CreationTime] = "creation_date";

    return roles;
}

void TasksModel::addTask(const QString &taskName)
{
    int n = tasks.size();
    auto dt = QDateTime::currentDateTime();

    qDebug() << dt.toString("MM.dd.yyyy,hh:mm:ss.zzz") << generateFileNameHash(taskName);

    beginInsertRows(QModelIndex(), n, n);
    tasks.push_back(Task{taskName, generateFileNameHash(taskName), Task::Priority::Default, dt});
    endInsertRows();

    saveTasks();
}

void TasksModel::removeTask(const QString &taskName)
{
    auto it = std::find_if(tasks.begin(), tasks.end(), [taskName](const Task& task){return task.taskName == taskName;});

    int i = std::distance(tasks.begin(), it);
    beginRemoveRows(QModelIndex(), i, i);
    tasks.erase(it);
    endRemoveRows();

    saveTasks();
}

void TasksModel::openTask(const QString &fileHash)
{
    QString fileName = notesDirPath() + "/" + fileHash + ".json";
    QDesktopServices::openUrl(QUrl::fromLocalFile(fileName));
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

        QString fileName = notesDirPath() + "/" + task.fileHash + ".json";

        QJsonObject jsonObj;
        jsonObj["name"] = task.taskName;
        jsonObj["priority"] = utils::priorityToString(task.priority);
        jsonObj["date"] = utils::dateTimeToString(task.creationDate);

        QJsonDocument doc(jsonObj);
        QFile jsonFile(fileName);

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

                tasks.push_back(Task{name, QFileInfo(jsonFile).baseName(), priority, dateTime});
            }
        }
    }
}
