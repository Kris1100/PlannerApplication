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
    Component.onCompleted: categoryListStorage.readList()
    Component.onDestruction: categoryListStorage.storeList()
}
