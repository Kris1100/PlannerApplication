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
    TaskList{
        id: taskListStorage
    }
    Component.onCompleted:{
        categoryListStorage.readList()
        taskListStorage.readList()
        //storage.readTemplates(Qt.resolvedUrl("project_templates/first.json"))
    }
    Component.onDestruction:{
        categoryListStorage.storeList()
        taskListStorage.storeList()
        }
}
