//Ready
#ifndef CATEGORY_H
#define CATEGORY_H
#include <QString>


struct Category
{
    Category(QString name, int id);
    QString name;
    int id = 0;
};

#endif // CATEGORY_H


