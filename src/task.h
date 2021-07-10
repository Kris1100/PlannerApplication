#ifndef NOTE_H
#define NOTE_H

#include <QString>

struct Task
{
    Task(QString name, QString text, QString place, QString time, QString importance, QString participants,
         QString money,int category, bool is_do=false);
    QString name;
    QString text;
    QString place;
    QString time;
    QString importance;
    QString participants;
    QString money;
    bool is_do;
    int category=0;
};

#endif
