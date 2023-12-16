#include "TaskUtils.h"

QString utils::priorityToString(Task::Priority priority)
{
    switch(priority)
    {
        case Task::Priority::High: return "high";
        case Task::Priority::Medium: return "medium";
        case Task::Priority::Low: return "low";
        default: return "default";
    }
}

Task::Priority utils::stringToPriority(const QString& priorityStr)
{
    if (priorityStr == "high")
    {
        return Task::Priority::High;
    }
    else if (priorityStr == "medium")
    {
        return Task::Priority::Medium;
    }
    else if (priorityStr == "low")
    {
        return Task::Priority::Low;
    }
    else
    {
        return Task::Priority::Default;
    }
}

QString utils::dateTimeToString(const QDateTime& dateTime)
{
    return dateTime.toString(Qt::ISODate);
}

QDateTime utils::stringToDateTime(const QString& dateTimeStr)
{
    return QDateTime::fromString(dateTimeStr, Qt::ISODate);
}
