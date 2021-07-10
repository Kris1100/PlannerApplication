#ifndef CATEGORYLIST_H
#define CATEGORYLIST_H

#include <QAbstractListModel>
#include <QList>
#include "category.h"


class CategoryList : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit CategoryList(QObject *parent=nullptr);

    // category list
    enum CategoryRoles {
        NameRole = Qt::UserRole + 1,
        IdRole
    };
    virtual int rowCount(const QModelIndex&) const { return m_categories.size(); }
    virtual QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE void addcategory(QString name); //добавить функцию добавления id
    Q_INVOKABLE void readList();
    Q_INVOKABLE void storeList();
private:
    int count;
    QList<Category> m_categories;
};

#endif // categoryLIST_H
