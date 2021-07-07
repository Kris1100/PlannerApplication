//Ready
#include <QtQuick>
#include <sailfishapp.h>
#include "categorylist.h"

int main(int argc, char *argv[])
{
    qmlRegisterType<CategoryList>("ProjectPlannerApplication", 1, 0, "CategoryList");
    return SailfishApp::main(argc, argv);
}
