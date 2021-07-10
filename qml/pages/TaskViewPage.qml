import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property alias taskName: taskNameLabel.text
    property alias taskText: taskTextLabel.text
    property alias taskPlace:taskPlaceLabel.text
    property alias taskTime: taskTimeLabel.text
    property alias taskImportance: taskImportanceLabel.text
    property alias taskParticipants: taskParticipantsLabel.text
    property alias taskMoney: taskMoneyLabel.text

    SilicaListView {
        anchors.fill: parent
        contentHeight: content.height
        //
        PullDownMenu {
            MenuItem {
                text: qsTr("Edit task")
                onClicked: {
                    var dialog = pageStack.push("TaskEditor.qml",{
                                                                   taskName: taskName,
                                                                   taskText: taskText,
                                                                   taskPlace: taskPlace,
                                                                   taskTime: taskTime,
                                                                   taskImportance: taskImportance,
                                                                   taskParticipants: taskParticipants,
                                                                   taskMoney: taskMoney

                                                               });
                    /*dialog.accepted.connect(function() {
                        taskListStorage.edittask(task , dialog.name, dialog.text, dialog.place, dialog.time, dialog.importance,dialog.participants,
                                                 dialog.money);
                    });
*/
                }
            }
           /* MenuItem {
                text: qsTr("Delete task")
                onClicked: {
                    var dialog = pageStack.push(Qt.resolvedUrl("FixedCategoryEditor.qml"));
                    dialog.accepted.connect(function() {
                        categoryListStorage.addcategory(dialog.name);
                    });
                }
            }
            */
        }
        //
        Column {
            id: content
            anchors {
                left: parent.left
                right: parent.right
                leftMargin: Theme.horizontalPageMargin
                rightMargin: Theme.horizontalPageMargin
            }
            spacing: Theme.paddingMedium

            PageHeader {
                title: qsTr("Task information")
            }

            Label {
                text: qsTr("Task name:")
                font.pixelSize: Theme.fontSizeSmall
            }

            Label {
                id: taskNameLabel
                color: Theme.highlightColor
            }

            Label {
                text: qsTr("Task description:")
                font.pixelSize: Theme.fontSizeSmall
            }

            Label {
                id: taskTextLabel
                color: Theme.highlightColor
            }
            Label {
                text: qsTr("Location:")
                font.pixelSize: Theme.fontSizeSmall
            }

            Label {
                id: taskPlaceLabel
                color: Theme.highlightColor
            }

            Label {
                text: qsTr("Time:")
                font.pixelSize: Theme.fontSizeSmall
            }

            Label {
                id: taskTimeLabel
                color: Theme.highlightColor
            }

            Label {
                text: qsTr("Importance:")
                font.pixelSize: Theme.fontSizeSmall
            }

            Label {
                id: taskImportanceLabel
                color: Theme.highlightColor
            }
            Label {
                text: qsTr("Participants:")
                font.pixelSize: Theme.fontSizeSmall
            }

            Label {
                id: taskParticipantsLabel
                color: Theme.highlightColor
            }
            Label {
                text: qsTr("Money:")
                font.pixelSize: Theme.fontSizeSmall
            }

            Label {
                id: taskMoneyLabel
                color: Theme.highlightColor
            }
        }
        VerticalScrollDecorator {}
    }
}
