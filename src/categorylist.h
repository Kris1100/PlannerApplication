#ifndef CATEGORYLIST_H
#define CATEGORYLIST_H

#include <QAbstractListModel>
#include <QList>
#include <QUrl>
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

    Q_INVOKABLE int addcategory(QString name); //добавить функцию добавления id
    Q_INVOKABLE void readList();
    Q_INVOKABLE void storeList();
    Q_INVOKABLE void deleteCategory(int index);
    Q_INVOKABLE void editcategory(int index, QString name);
    Q_INVOKABLE void readTemplates(QUrl file);


private:
    int count;
    QList<Category> m_categories;

};

#endif // categoryLIST_H
