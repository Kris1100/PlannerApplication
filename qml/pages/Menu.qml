import QtQuick 2.0
import Sailfish.Silica 1.0
import ".."
Page {
    id: menu //page

    SilicaListView {
        id: categoriesView
        anchors.fill: parent
        model: categoryListStorage
        header: PageHeader {
            title: qsTr("My Categories")
        }
        PullDownMenu {
            MenuItem {
                text: qsTr("Add new category")
                onClicked: {
                    var dialog = pageStack.push(Qt.resolvedUrl("CategoryEditor.qml"));
                    dialog.accepted.connect(function() {
                        categoryListStorage.addcategory(dialog.name);
                    });
                }
            }
            MenuItem {
                text: qsTr("Choose existing category")
                onClicked: {
                    var dialog = pageStack.push(Qt.resolvedUrl("FixedCategoryEditor.qml")); //!!!функция создания фикс. категории(МЕРОПРИЯТИЯ)
                    dialog.accepted.connect(function() {
                        categoryListStorage.addcategory(dialog.name);

                    });
                }
            }
        }
        delegate: BackgroundItem {
            Label {
                anchors {
                    left: parent.left
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    leftMargin: Theme.horizontalPageMargin
                    rightMargin: Theme.horizontalPageMargin
                }
                text: model.name
            }

            Component {
                id: categoryViewPage //change!
                CategoryViewPage {}
            }

            onClicked: {
//                console.log(model.id)
                taskListStorage.readList(model.id);
                pageStack.push(Qt.resolvedUrl("CategoryViewPage.qml"), {
                                   categoryIndex: index,
                                   categoryId: model.id,
                                   categoryName: model.name
                                  //добавить список!!!
                               });
            }
        }
         VerticalScrollDecorator {}
    }
}
