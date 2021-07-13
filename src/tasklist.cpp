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
    roles[Is_doRole]="is_do";
    return roles;
}

QVariant TaskList::data(const QModelIndex &index, int role) const {
    if(!index.isValid())
        return QVariant();
    auto filetedItemIndex = index.row();
    auto realItemIndex = current_tasks[filetedItemIndex];
    auto item = m_tasks[realItemIndex];
    switch(role) {
    case NameRole:
        return QVariant(item.name);
    case TextRole:
        return QVariant(item.text);
    case PlaceRole:
        return QVariant(item.place);
    case TimeRole:
        return QVariant(item.time);
    case ImportanceRole:
        return QVariant(item.importance);
    case ParticipantsRole:
        return QVariant(item.participants);
    case MoneyRole:
        return QVariant(item.money);
    case Is_doRole:
        return QVariant(item.is_do);
    default:
        return QVariant();
    }
}

void TaskList::addTask(QString name, QString text, QString place, QString time, QString importance, QString participants,
                       QString money, int category) {

    m_tasks.append(Task(name, text,place,time,importance,participants,money, category));
    auto tasksSize = current_tasks.size();
    beginInsertRows(QModelIndex(), tasksSize, tasksSize);
    current_tasks.append(m_tasks.size() - 1);
    endInsertRows();
    storeList();

}

void TaskList::edittask(int index, QString name, QString text, QString place, QString time, QString importance, QString participants,
                        QString money) {
    m_tasks[current_tasks[index]].name=name;
    m_tasks[current_tasks[index]].text=text;
    m_tasks[current_tasks[index]].place=place;
    m_tasks[current_tasks[index]].time=time;
    m_tasks[current_tasks[index]].importance=importance;
    m_tasks[current_tasks[index]].participants=participants;
    m_tasks[current_tasks[index]].money=money;

    beginInsertRows(QModelIndex(), index, index);
    current_tasks.append(index);
    endInsertRows();
    beginRemoveRows(QModelIndex(), index+1, index+1);
    endRemoveRows();
}
void TaskList::checkedtask(int index, bool is_do) {
    m_tasks[current_tasks[index]].is_do=is_do;
    beginInsertRows(QModelIndex(), index, index);
    current_tasks.append(index);
    endInsertRows();
    beginRemoveRows(QModelIndex(), index+1, index+1);
    endRemoveRows();
    storeList();
}

void TaskList::readList() {
    beginResetModel();
    m_tasks = DataStorerTask::readDataTask();
    endResetModel();
}

void TaskList::readList(int id) {
    beginResetModel();
    current_tasks.erase(current_tasks.begin(), current_tasks.end());
    for (int i=0;i<m_tasks.size();i++){
        if (m_tasks[i].category == id) current_tasks.append(i);
    }
    endResetModel();
}

void TaskList::deleteTask(int index) {
    beginRemoveRows(QModelIndex(), index, index);
    m_tasks.removeAt(current_tasks[index]);
    endRemoveRows();
}

void TaskList::deleteTask_id(int id) {
    int i =0;
    auto size = m_tasks.size();
    while (i < size){
        if (m_tasks[i].category == id){
            beginRemoveRows(QModelIndex(), i, i);
            m_tasks.removeAt(i);
            endRemoveRows();
            i--;
            size--;
        }
        i++;
    }
}

void TaskList::storeList() {
    DataStorerTask::storeDataTask(m_tasks);
}
