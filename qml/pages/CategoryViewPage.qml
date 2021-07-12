import QtQuick 2.0
import Sailfish.Silica 1.0
Page {
    id: categorypageview //page
    property int category:categoryview.model.id
    SilicaListView {
        id: categoryview
        anchors.fill: parent
        model: taskListStorage
        header: PageHeader {
            title: qsTr("My Tasks")
        }

        PullDownMenu {
            MenuItem {
                text: qsTr("Add new task")
                onClicked: {
                    var dialog = pageStack.push(Qt.resolvedUrl("TaskEditor.qml"));
                    dialog.accepted.connect(function() {
                        taskListStorage.addTask(dialog.name, dialog.text, dialog.place, dialog.time, dialog.importance,dialog.participants,
                                                dialog.money, model.id); //добавить поле категория
                    });
                }
            }
        }
        delegate: BackgroundItem {
           //if(taskListStorage[index].category==categorypageview.category) хотим фильтр, if не работает
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
                id: taskViewPage
                TaskViewPage {}
            }

            onClicked: {
                pageStack.push(Qt.resolvedUrl("TaskViewPage.qml"), {
                                   taskName: model.name,
                                   taskText: model.text,
                                   taskPlace: model.place,
                                   taskTime: model.time,
                                   taskImportance: model.importance,
                                   taskParticipants: model.participants,
                                   taskMoney: model.money,
                                   taskIndex: index

                               });
            }
        }
         VerticalScrollDecorator {}
    }
}
