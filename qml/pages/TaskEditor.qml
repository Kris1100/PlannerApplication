import QtQuick 2.0
import Sailfish.Silica 1.0
Dialog {
    id: taskEditor
    property string name: ""
    property string text: ""
    property string place: ""
    property string time: ""
    property string importance: ""
    property string participants: ""
    property string money: ""

    DialogHeader {
        id: editorHeader
        acceptText: qsTr("Create")
        title: qsTr("New task")
    }
    SilicaFlickable{
        anchors{
            top: editorHeader.bottom
            bottom:parent.bottom
            left:parent.left
            right:parent.right
        }
        contentHeight: content.height
        clip: true
        Column {
            id: content
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                top: editorHeader.bottom
                leftMargin: Theme.horizontalPageMargin
                rightMargin: Theme.horizontalPageMargin
            }
            spacing: Theme.paddingMedium

            Label {
                text: qsTr("Task name:")
                font.pixelSize: Theme.fontSizeSmall
            }

            TextField {
                id: taskNameField
                width: parent.width
                placeholderText: qsTr("Task name")
            }
            Label {
                text: qsTr("Task description:")
                font.pixelSize: Theme.fontSizeSmall
            }

            TextArea {
                id: taskTextField
                width: parent.width
                placeholderText: qsTr("Description")
            }

            Label {
                text: qsTr("Location:")
                font.pixelSize: Theme.fontSizeSmall
            }

            TextArea {
                id: taskPlaceField
                width: parent.width
                placeholderText: qsTr("Location")
            }
            Label {
                text: qsTr("Time:")
                font.pixelSize: Theme.fontSizeSmall
            }

            TextArea {
                id: taskTimeField
                width: parent.width
                placeholderText: qsTr("Time")
            }
            ComboBox {
                id:taskImportanceField
                width: parent.width
                label: "Importance:"

                menu: ContextMenu {
                    MenuItem { text: "Low" }
                    MenuItem { text: "Average" }
                    MenuItem { text: "High" }
                }
            }
            Label {
                text: qsTr("Participants:")
                font.pixelSize: Theme.fontSizeSmall
            }

            TextArea {
                id: taskParticipantsField
                width: parent.width
                placeholderText: qsTr("Participants")
            }
            Label {
                text: qsTr("Money:")
                font.pixelSize: Theme.fontSizeSmall
            }

            TextArea {
                id: taskMoneyField
                width: parent.width
                placeholderText: qsTr("Money")
            }
        }
        VerticalScrollDecorator {}
    }
    onAccepted: {
        taskEditor.name = taskNameField.text
        taskEditor.text = taskTextField.text
        taskEditor.place = taskPlaceField.text
        taskEditor.time = taskTimeField.text
        taskEditor.importance = taskImportanceField.value
        taskEditor.participants = taskParticipantsField.text
        taskEditor.money = taskMoneyField.text
    }
}
