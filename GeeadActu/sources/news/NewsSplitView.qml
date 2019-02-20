import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls 1.4 as Ctrl
import QtQuick.Layouts 1.3
import "./models"

Item {
    id:splitView
    property bool drawerDrag: true
    states: [
        State {
            name: "AvecIcon"
        }
    ]
    children:Ctrl.SplitView{
        id:newsSplit
        orientation:Qt.Horizontal
        anchors.fill: parent.Center
        width:parent.width
        height: parent.height
        handleDelegate: Component{
            Rectangle{
                width:3
                color: "#66ffff"
                }
            }
        Rectangle {
            id: newsListViewRect
            Layout.fillWidth: true
            Layout.minimumWidth: parent.width/3
            Layout.topMargin: 0
            Layout.leftMargin: 5
            Layout.rightMargin: 0
            ListView{
                id:newslistView
                highlightFollowsCurrentItem: true
                focus: true
                anchors.top:parent.top
                anchors.topMargin: 3
                model:NewModel{
                    id:newsModel
                     }
                currentIndex:-1
                width:parent.width
                height: parent.height
                anchors.centerIn: parent
                anchors.left:parent.left
                contentHeight: 15
                contentWidth: parent.width
                spacing: 2
                highlight:Rectangle{
                    radius:90
                    width:180
                    height: 180
                    color: "blue"
                    y:newslistView.currentItem.y
                    Behavior on y {
                                  SpringAnimation {
                                      spring: 3
                                      damping: 0.2
                                  }
                              }
                }
                highlightMoveDuration:1000
                delegate: ItemDelegate{
                                id:delegate
                                checkable: true
                                width:newslistView.width
                                highlighted: ListView.currentItem?true:false

                                Text{
                                    id:textT
                                    anchors.left: parent.left
                                    anchors.leftMargin: 6
                                    anchors.verticalCenter: parent.verticalCenter
                                    text:name + " : " + date
                                    }

                                onClicked: {
                                newsArticles.changeWidth()
                                newsArticles.text="   "+name
                                }
                                Rectangle{
                                    id:cercle
                                    anchors.right: delegate.right
                                    anchors.rightMargin: 5
                                    anchors.centerIn: delegate.Center
                                    anchors.top: delegate.top
                                    width:15
                                    height: 15
                                    radius: 90
                                    color: "blue"
                                    visible: false
                                }
                                states: [
                                    State {
                                        name: "affiche"
                                        when: delegate.checked

                                        PropertyChanges {
                                            target: cercle
                                            visible: true
                                        }
                                    }
                                ]

                            }
                ScrollBar.vertical: ScrollBar {
                    id:scroll
                    anchors.right:newslistView.right
                    anchors.rightMargin: 3
                    background: Rectangle{
                        id:scrollBg
                        color: "gray"
                        width:7
                        radius: 5
                    }
                    contentItem: Rectangle{
                        radius: 5
                        color: "#99ffff"
                        width:5
                        anchors.left: scroll.left;anchors.right: scroll.right
                        anchors.leftMargin: 2;anchors.rightMargin: 2

                    }
                    width:7
                                 }

                }
            }
        Item{
            id:newsArticles
            property string text: ""
            signal changeWidth()
            visible: false
            children:Image {
                id: geeadIm
                source: "../../Images/Geead.png"
                anchors.fill: newsArticles
                anchors.left: newsArticles.left
                anchors.right: newsArticles.right
                anchors.bottom: newsArticles.bottom
                anchors.top:newsArticles.top
                smooth: true
                opacity:0.6
            }
            ArticlesView{
                id:articleView
                visible: false
                anchors{fill: parent;margins: 0}
            }
            onChangeWidth:{
                newsArticles.width = parent.width-parent.width/3
                newsArticles.height = parent.height
                articleView.width = newsArticles.width-10
                articleView.height = newsArticles.height-2
                newsArticles.widthChanged()
                }
            onWidthChanged:{
                width<=150?visible=false:visible=true
                articleView.width = newsArticles.width-10
                articleView.height = newsArticles.height-2
                articleView.visible=newsArticles.visible?true:false
                splitView.drawerDrag=articleView.visible?false:true
               }

            }
        }
}
