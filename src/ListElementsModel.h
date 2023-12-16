#ifndef LISTELEMENTSMODEL_H
#define LISTELEMENTSMODEL_H

#include <QAbstractListModel>
#include <vector>

#include "Task.h"

class ListElementsModel: public QAbstractListModel
{
    Q_OBJECT

    enum Roles
    {
        Name = Qt::UserRole + 1,
        Priority,
        CreationTime
    };

public:
    ListElementsModel(QObject* parent = Q_NULLPTR);

    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    bool setData(const QModelIndex &index, const QVariant &value, int role);
    QHash<int, QByteArray> roleNames() const;

private:
    std::vector<Task> tasks;

};

#endif // LISTELEMENTSMODEL_H
