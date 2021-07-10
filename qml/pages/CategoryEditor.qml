import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    id: categoryEditor
    property string name: ""

    DialogHeader {
        id: editorHeader
        acceptText: qsTr("Create")
        title: qsTr("New category")
    }

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
            text: qsTr("Category name:")
            font.pixelSize: Theme.fontSizeSmall
        }

        TextField {
            id: categoryNameField
            width: parent.width
            placeholderText: qsTr("Category name")
        }
    }
    onAccepted: {
        categoryEditor.name = categoryNameField.text
    }
}
