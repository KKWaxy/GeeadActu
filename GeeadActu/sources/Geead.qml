import QtQuick 2.0
import QtQuick.Controls 2.4

Item {
    id:geead
    TextEdit {
        id: textArea
        readOnly:true
        width:parent.width
        height: parent.height
        anchors.centerIn: parent
        anchors.top:parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        textFormat:TextEdit.PlainText
        verticalAlignment:TextEdit.AlignJustify
        text:"Présentation du GEEAD"
        color: "red"
    }
}
