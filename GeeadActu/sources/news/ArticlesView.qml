import QtQuick 2.0
import QtQuick.Controls 2.4
import "./models"
Item{
    id:articleRect
    ArticleModel{
        id:model
    }
    ListView{
        id:lisView
        model:model
        spacing: 15
        anchors { fill: parent; margins: 5 }
        preferredHighlightBegin: 0
        preferredHighlightEnd: 0
        highlightRangeMode: ListView.StrictlyEnforceRange
        orientation: ListView.Vertical
        flickDeceleration: 2000
        cacheBuffer: 200
        anchors.right: articleRect.right
        anchors.left: articleRect.left
        anchors.bottom: articleRect.bottom;anchors.top: articleRect.top
        ScrollBar.vertical: ScrollBar{
            id:scrollB
            background: Rectangle{
                radius: 5
                width: 8
                opacity: 0.5
            }
            contentItem: Rectangle{
                radius: 5
                color: "#66ffff"
            }
            width:8
        }
              }
    onWidthChanged: {
        lisView.width=articleRect.width
        lisView.height=articleRect.height
        model.childWidh=lisView.width

    }

    }

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
