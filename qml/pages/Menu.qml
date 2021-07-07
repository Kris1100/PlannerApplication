import QtQuick 2.0
import Sailfish.Silica 1.0
import ".."
Page{}
//Page {
//    id: page

//    SilicaListView {
//        id: notesView //change
//        anchors.fill: parent
//        model: noteListStorage //change
//        header: PageHeader {
//            title: qsTr("My Plans")
//        }
//        PullDownMenu {
//            MenuItem {
//                text: qsTr("Add new category")
//                onClicked: {
//                    var dialog = pageStack.push(Qt.resolvedUrl("CategoryEditor.qml")); //функция создания новой категории
//                    dialog.accepted.connect(function() {
//                        noteListStorage.addNote(dialog.name, dialog.text); //change!!!!
//                    });
//                }
//            }
//            MenuItem {
//                text: qsTr("Choose existing category")
//                onClicked: {
//                    var dialog = pageStack.push(Qt.resolvedUrl("FixedCategoryEditor.qml")); //!!!функция создания фикс. категории(МЕРОПРИЯТИЯ)
//                    dialog.accepted.connect(function() {
//                        noteListStorage.addNote(dialog.name, dialog.text); //change!
//                    });
//                }
//            }
//        }
////        delegate: BackgroundItem {
////            Label {
////                anchors {
////                    left: parent.left
////                    right: parent.right
////                    verticalCenter: parent.verticalCenter
////                    leftMargin: Theme.horizontalPageMargin
////                    rightMargin: Theme.horizontalPageMargin
////                }
////                text: model.name
////            }

////            Component {
////                id: categoryViewPage //change!
////                CategoryViewPage {}
////            }

////            onClicked: {
////                pageStack.push(categoryViewPage, {
////                                   categoryName: model.name,
////                                   //добавить список!!!
////                               });
////            }
////        }
//         VerticalScrollDecorator {}
//    }
//}
