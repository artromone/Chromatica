#ifndef TASK_H
#define TASK_H

#include <QString>
#include <QDateTime>

struct Task
{
    enum Priority
    {
        High = 1,
        Medium,
        Low,
        Default
    };


    QString name;
    Priority priority;
    QDateTime creationDate;

    bool isNote = false;
};

#endif // TASK_H
