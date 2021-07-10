#ifndef NOTE_H
#define NOTE_H

#include <QString>

struct Task
{
    Task(QString name, QString text, QString place, QString time, QString importance, QString participants,
         QString money,int category);
    QString name;
    QString text;
    QString place;
    QString time;
    QString importance;
    QString participants;
    QString money;
    int category=0;
};

#endif
