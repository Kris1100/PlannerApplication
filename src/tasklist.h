#ifndef TASKLIST_H
#define TASKLIST_H

#include <QAbstractListModel>
#include <QList>
#include "task.h"

class TaskList : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit TaskList(QObject *parent=nullptr);

    // Note list
    enum TaskRoles {
        NameRole = Qt::UserRole + 1,
        TextRole,
        PlaceRole,
        TimeRole,
        ImportanceRole,
        ParticipantsRole,
        MoneyRole,
        CategoryRole
    };
    virtual int rowCount(const QModelIndex&) const { return m_tasks.size(); }
    virtual QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE void addTask(QString name, QString text, QString place, QString time, QString importance, QString participants,
                             QString money, int category);
    Q_INVOKABLE void readList();
    Q_INVOKABLE void storeList();
private:
    QList<Task> m_tasks;
};

#endif