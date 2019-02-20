import QtQuick 2.0
import QtQml.Models 2.3
ObjectModel{
    id:articleModel
    property int childWidh
    signal childWidhChange()
    onChildWidhChanged: {
        t.width=childWidh
    }

    Rectangle{
        id:t
        width:parent.childWidh
        height: 250
        color: "#3ac738"
        border.color: "white"
        Text{
            id:text
            anchors.centerIn: parent.Center
            anchors.fill: parent
            anchors.margins: 50
            text:"Cette partie doit provenir d'une base de données\n Il serait donc intéressante de la gérer avec du C++."
            color: "red"
        }
        onWidthChanged:
        {
            text.width=t.width-10
        }
    }
    Rectangle{
        id:flyerP
        width: t.width
        height: t.height
        color: "#333"
        border.color: "blue"
        children: Image {
            id: flyer
            source: "./images/Artboard 10.png"
            anchors.fill: parent
            anchors.centerIn: parent.Center
        }
    }
    Rectangle{
        width: 300
        height: 150
        radius: 10
        color: "red"
        border.color: "#3ac738"
    }
    Rectangle{
        width: 300
        height: 150
        color: "blue"
        border.color: "#333"
    }
    Rectangle{
        width: 300
        height: 150
        radius: 10
        color: "#3ac738"
        border.color: "#333"
    }
    Rectangle{
        width: 300
        height: 150
        color: "white"
        border.color: "blue"
    }
    Rectangle{
        width: 300
        height: 150
        radius: 10
        color: "red"
        border.color: "#333"
    }
    Rectangle{
        width: 300
        height: 150
        color: "#333"
        border.color: "#3ac738"
    }
    Rectangle{
        width: 300
        height: 150
        radius: 10
        color: "red"
        border.color: "#333"
    }
    Rectangle{
        width: 300
        height: 150
        color: "#333"
        border.color: "blue"
        BorderImage {
            id: test
            source: "../../../icons/search_48.png"
            width: 100; height: 100
            border.left: 5; border.top: 5
            border.right: 5; border.bottom: 5
        }
    }
}
