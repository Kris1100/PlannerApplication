import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id:page
    property alias taskName: taskNameLabel.text
    property alias taskText: taskTextLabel.text
    property alias taskPlace:taskPlaceLabel.text
    property alias taskTime: taskTimeLabel.text
    property alias taskImportance: taskImportanceLabel.text
    property alias taskParticipants: taskParticipantsLabel.text
    property alias taskMoney: taskMoneyLabel.text
    property int index: 0
    property alias taskIndex: page.index



    SilicaListView {
        anchors.fill: parent
        model: taskListStorage
        contentHeight: content.height
        //
        id:first
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
                    dialog.accepted.connect(function() {
                        taskListStorage.edittask(page.index, dialog.name, dialog.text, dialog.place, dialog.time, dialog.importance,dialog.participants,
                                                 dialog.money);

                    });
                    taskListStorage.readList();



                }
            }
            MenuItem {
                text: qsTr("Delete task")
                onClicked: {
                    taskListStorage.deleteTask(page.index);
                    taskListStorage.readList();
                    pageStack.pop();


                    }
            }
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
