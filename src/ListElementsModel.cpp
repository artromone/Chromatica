#include "ListElementsModel.h"

namespace
{
// QString dateToString(QDateTime& dateTime)
// {
//     return dateTime.toString("yyyy-MM-dd hh:mm:ss");
// }
}

ListElementsModel::ListElementsModel(QObject* parent) {

    QDateTime dateTime = QDateTime::currentDateTime();
    //auto time = dateToString(dateTime);

    tasks.push_back(Task{"Feed the cat", Task::Priority::Default, dateTime});
    tasks.push_back(Task{"Feed the dog", Task::Priority::Default, dateTime});
    tasks.push_back(Task{"Feed the pet", Task::Priority::Default, dateTime});
}

int ListElementsModel::rowCount(const QModelIndex &parent) const
{
    return tasks.size();
}

QVariant ListElementsModel::data(const QModelIndex &index, int role) const
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

bool ListElementsModel::setData(const QModelIndex &index, const QVariant &value, int role)
{

}

QHash<int, QByteArray> ListElementsModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();

    roles[Roles::Name] = "name";
    roles[Roles::Priority] = "priority";
    roles[Roles::CreationTime] = "creation_date";

    return roles;
}
