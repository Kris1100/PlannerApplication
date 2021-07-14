//Ready!
#ifndef DATASTORERTASK_H
#define DATASTORERTASK_H

#include <QList>
#include <QString>
#include <QUrl>
#include "task.h"

namespace DataStorerTask {
    QList<Task> readDataTask();
    void storeDataTask(QList<Task> &tasks);
    void deleteTask(int index);
    QList<Task> readTemplates (QUrl file);

};

#endif
