#ifndef TASKUTILS_H
#define TASKUTILS_H

#include <QString>
#include "Task.h"

namespace utils
{

QString priorityToString(Task::Priority priority);
Task::Priority stringToPriority(const QString& priorityStr);

QString dateTimeToString(const QDateTime& dateTime);
QDateTime stringToDateTime(const QString& dateTimeStr);

}

#endif // TASKUTILS_H
