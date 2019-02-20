import QtQuick 2.0
import QtQuick.Controls 2.4

Drawer{
    id:drawer
    width: 300
    position: 0.0
    height:parent.height-22
    edge:Qt.RightEdge
    dragMargin: -10
    background:drawerRect
    bottomMargin: 20
    leftMargin: 50
    clip:true
    TextField{
        id:searchBar
        width: parent.width
        height: 45
        echoMode: TextInput.Normal
        color: "#444"
        focus:drawer.visible?true:false
        anchors.leftMargin:10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.top:parent.top
        anchors.topMargin: 10
        placeholderText:"Events, News..."
        autoScroll:true
        bottomPadding:5
        leftPadding:5
        rightPadding: 5
        cursorDelegate:Component{
            Rectangle{
                width:2
                color:"#555"
            }
        }

        background: Rectangle{
            radius: 2
            color: "white"
            width:searchBar.width
            height: searchBar.height
        }
    }
    Item{
           width:parent.width
           height: parent.height-(retourItem.width+searchBar.width)
           anchors.bottom:retourItem.top
           anchors.top: searchBar.bottom
           anchors.left: parent.left
           anchors.right: parent.right
           children:Text{
               anchors.centerIn: parent
               anchors.fill: parent.Center
               text:"Writting...."
               color: "red"
           }
    }
    Item{
        id:retourItem
        width: parent.width
        height: 65
        anchors.bottom: parent.bottom
        ToolButton{
            id:retourButton
            width: parent.height
            height: parent.height
            anchors.centerIn: parent
            display: AbstractButton.IconOnly
            icon.width: retourButton.width
            icon.height: retourButton.height
            icon.color:"white"
            icon.source: "qrc:/icons/Left_32.png"
            onClicked: drawer.close()
        }
    }

    Rectangle{
        id:drawerRect
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        color:"#3ac738"
        radius:3
        border.color: "#fff"
        border.width: 3
    }
}

