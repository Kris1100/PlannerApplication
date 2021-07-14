import QtQuick 2.0
import Sailfish.Silica 1.0
//import ".."

Page {
    id: fixedcategoryeditor
    property int category: 0
    property int i: 0

    SilicaListView {
        id: fixedcategoryview
        anchors.fill: parent
        model: fixedCategoryListStorage
        header: PageHeader {
            title: qsTr("Fixed categories")
        }
        delegate: BackgroundItem {
            Label {
                anchors.verticalCenter: parent.verticalCenter
                id: textLabel
                text: model.name
            }

            onClicked: {
                // функция добавления задач в общий список по id выбранной категории
                category = categoryListStorage.addcategory(model.name);
               taskListStorage.addFixed(model.id, category);
                pageStack.pop()
            }
        }
        VerticalScrollDecorator {}
    }
}
