import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: categorypageview
    property string category_name: ""

    property alias categoryName: categorypageview.category_name
    property int category: 0
    property alias categoryId: categorypageview.category

    property int index: 0
    property alias categoryIndex: categorypageview.index

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
                    var dialog = pageStack.push(Qt.resolvedUrl(
                                                    "TaskEditor.qml"))
                    dialog.accepted.connect(function () {
                        taskListStorage.addTask(
                                    dialog.name, dialog.text, dialog.place,
                                    dialog.time, dialog.importance,
                                    dialog.participants, dialog.money,
                                    category) //добавить поле категория
                    })
                }
            }
            MenuItem {
                text: qsTr("Edit category")
                onClicked: {
                    var dialog = pageStack.push("CategoryEditor.qml", {
                                                    "categoryName": categoryName
                                                })
                    dialog.accepted.connect(function () {
                        categoryListStorage.editcategory(page.index,
                                                         dialog.name)
                    })
                }
            }
            MenuItem {
                text: qsTr("Delete category")
                onClicked: {
                    categoryListStorage.deleteCategory(categorypageview.index)
                    pageStack.pop()
                }
            }
        }
        delegate: BackgroundItem {
            Row {
                anchors {
                    left: parent.left
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }

                IconTextSwitch {
                    id: checkbox
                    width: Theme.itemSizeMedium
                    onCheckedChanged: if (model.is_do)
                                          model.is_do = false
                                      else
                                          model.is_do = true
                }
                Label {
                    anchors.verticalCenter: parent.verticalCenter

                    id: textLabel
                    text: model.name
                }
            }

            onClicked: {
                pageStack.push(Qt.resolvedUrl("TaskViewPage.qml"), {
                                   "taskName": model.name,
                                   "taskText": model.text,
                                   "taskPlace": model.place,
                                   "taskTime": model.time,
                                   "taskImportance": model.importance,
                                   "taskParticipants": model.participants,
                                   "taskMoney": model.money,
                                   "taskIndex": index
                               })
            }
        }
        VerticalScrollDecorator {}
    }
}
