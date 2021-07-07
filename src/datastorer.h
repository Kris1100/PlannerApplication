//Ready!
#ifndef DATASTORER_H
#define DATASTORER_H

#include <QList>
#include <QString>
#include "category.h"

namespace DataStorer {
    QList<Category> readData();
    void storeData(QList<Category> &notes);
};

#endif // DATASTORER_H
