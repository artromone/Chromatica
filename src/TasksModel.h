#ifndef TASKSMODEL_H
#define TASKSMODEL_H

#include <QAbstractListModel>
#include <vector>

#include "Task.h"

class TasksModel: public QAbstractListModel
{
    Q_OBJECT

    enum Roles
    {
        TaskName = Qt::UserRole + 1,
        FileName,
        Priority,
        CreationTime
    };

public:
    TasksModel(QObject* parent = Q_NULLPTR);

    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    bool setData(const QModelIndex &index, const QVariant &value, int role);
    QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE void addTask(const QString& taskName);
    Q_INVOKABLE void removeTask(const QString& taskName);
    Q_INVOKABLE void openTask(const QString& fileHash);

    void loadTasks();
    void saveTasks();

private:
    std::vector<Task> tasks;

};

#endif // TASKSMODEL_H
