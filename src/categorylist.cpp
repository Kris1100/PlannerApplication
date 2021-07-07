//Ready!:)
#include "categorylist.h"
#include <QVariant>
#include "datastorer.h"
#include <QDebug>

CategoryList::CategoryList(QObject* parent) : QAbstractListModel(parent), m_categories()
{

}

QHash<int, QByteArray> CategoryList::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[IdRole] = "id";
    return roles;
}

QVariant CategoryList::data(const QModelIndex &index, int role) const {
    if(!index.isValid())
        return QVariant();
    switch(role) {
    case NameRole:
        return QVariant(m_categories[index.row()].name);
    case IdRole:
        return QVariant(m_categories[index.row()].id);
    default:
        return QVariant();
    }
}

void CategoryList::addcategory(QString name, int id) {
    auto categorysSize = m_categories.size();
    beginInsertRows(QModelIndex(), categorysSize, categorysSize);
    m_categories.append(Category(name, id));
    endInsertRows();
}

void CategoryList::readList() {
    beginResetModel();
    m_categories = DataStorer::readData();
    endResetModel();
}

void CategoryList::storeList() {
    DataStorer::storeData(m_categories);
}
