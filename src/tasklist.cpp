#include "tasklist.h"
#include <QVariant>
#include "datastorertask.h"
#include <QDebug>

TaskList::TaskList(QObject* parent) : QAbstractListModel(parent), m_tasks()
{

}

QHash<int, QByteArray> TaskList::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[TextRole] = "text";
    roles[PlaceRole] = "place";
    roles[TimeRole] = "time";
    roles[ImportanceRole] = "importance";
    roles[ParticipantsRole] = "participants";
    roles[MoneyRole] = "money";
    roles[CategoryRole]="category";
    return roles;
}

QVariant TaskList::data(const QModelIndex &index, int role) const {
    if(!index.isValid())
        return QVariant();
    switch(role) {
    case NameRole:
        return QVariant(m_tasks[index.row()].name);
    case TextRole:
        return QVariant(m_tasks[index.row()].text);
    case PlaceRole:
        return QVariant(m_tasks[index.row()].place);
    case TimeRole:
        return QVariant(m_tasks[index.row()].time);
    case ImportanceRole:
        return QVariant(m_tasks[index.row()].importance);
    case ParticipantsRole:
        return QVariant(m_tasks[index.row()].participants);
    case MoneyRole:
        return QVariant(m_tasks[index.row()].money);
    default:
        return QVariant();
    }
}

void TaskList::addTask(QString name, QString text, QString place, QString time, QString importance, QString participants,
                       QString money, int category) {
    auto tasksSize = m_tasks.size();
    beginInsertRows(QModelIndex(), tasksSize, tasksSize);
    m_tasks.append(Task(name, text,place,time,importance,participants,money, category));
    endInsertRows();
}

void TaskList::readList() {
    beginResetModel();
    m_tasks = DataStorerTask::readDataTask();
    endResetModel();
}

void TaskList::storeList() {
    DataStorerTask::storeDataTask(m_tasks);
}
