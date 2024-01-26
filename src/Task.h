#ifndef TASK_H
#define TASK_H

#include <QString>
#include <QDateTime>

struct Task // TODO более правильный интерфейс
{
    enum Priority
    {
        High = 1,
        Medium,
        Low,
        Default
    };

    QString taskName;
    QString fileHash;

    Priority priority;
    QDateTime creationDate;

    bool isNote = false;
};

#endif // TASK_H
