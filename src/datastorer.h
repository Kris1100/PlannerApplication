//Ready!
#ifndef DATASTORER_H
#define DATASTORER_H

#include <QList>
#include <QString>
#include <QUrl>
#include "category.h"


namespace DataStorer {
    QList<Category> readData();
    void storeData(QList<Category> &categories);
    void deleteCategory(int index);
    QList<Category> readTemplates (QUrl file);
};

#endif // DATASTORER_H
