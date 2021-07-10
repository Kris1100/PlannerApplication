//Ready
#include <QtQuick>
#include <sailfishapp.h>
#include "categorylist.h"
#include "tasklist.h"

int main(int argc, char *argv[])
{
    qmlRegisterType<CategoryList>("ProjectPlannerApplication", 1, 0, "CategoryList");
    qmlRegisterType<TaskList>("ProjectPlannerApplication", 1, 0, "TaskList");
    return SailfishApp::main(argc, argv);
}
