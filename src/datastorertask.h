//Ready!
#ifndef DATASTORERTASK_H
#define DATASTORERTASK_H

#include <QList>
#include <QString>
#include "task.h"

namespace DataStorerTask {
    QList<Task> readDataTask();
    void storeDataTask(QList<Task> &tasks);
    void deleteTask(int index);
};

#endif
