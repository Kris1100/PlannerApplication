#include "task.h"

Task::Task(QString name, QString text, QString place, QString time, QString importance, QString participants,
           QString money, int category)
{
    this->name = name;
    this->text = text;
    this->place=place;
    this->time=time;
    this->importance=importance;
    this->participants=participants;
    this->money=money;
    this->category=category;
}
