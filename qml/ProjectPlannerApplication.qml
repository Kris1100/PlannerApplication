import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import ProjectPlannerApplication 1.0

ApplicationWindow
{
    initialPage: Component { Menu { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
    CategoryList {
        id: categoryListStorage
    }
    CategoryList {
        id: fixedCategoryListStorage
    }
    TaskList{
        id: taskListStorage
    }

    Component.onCompleted:{
        categoryListStorage.readList()
        taskListStorage.readList()
        fixedCategoryListStorage.readTemplates(Qt.resolvedUrl("project_templates/fixed_categories.json"))
        taskListStorage.readTemplates(Qt.resolvedUrl("project_templates/fixed_tasks.json"))

    }
    Component.onDestruction:{
        categoryListStorage.storeList()
        taskListStorage.storeList()
        }
}
