import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Layouts 1.1
import QtQuick.Controls.Material 2.3
import "./sources"
Item {
    id:identification
    signal buttonCliked()
    Rectangle{
        id:conectFrame
        color:"#444"
        radius: 10
        anchors.centerIn: parent
        anchors.fill: parent
        anchors.leftMargin:5
        anchors.topMargin: 5
        anchors.rightMargin: 5
        anchors.bottomMargin: 5
        Rectangle {
            id:degrader
            anchors.top:cadreHautDegrader.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.bottomMargin:0
            width: parent.width
            height: 30
            color: "#3ac738"
            gradient: Gradient{
                GradientStop{
                    position: 0.0
                    color: "#444"
                    }
                GradientStop{
                    position: 1.0
                    color:"#3ac738"
                }
                }
            }
        Rectangle{
            id:cadreHautDegrader
            color:"#444"
            height: parent.height-(degrader.height+5)
            width:parent.width
            anchors.bottomMargin: 10
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            RowLayout{
                anchors.centerIn: parent
                anchors.fill: parent
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                anchors.leftMargin:0
                anchors.rightMargin:0
                height: parent.height
                width: parent.width
                Rectangle {
                    id: descriptions
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.leftMargin: 5
                    Layout.rightMargin: 20
                    Layout.topMargin: 25
                    height: parent.height-10
                    radius: 5
                    border.color: "#3ac738"
                    border.width: 5
                    children:Geead{
                        id:geeadPresent
                        anchors.centerIn: parent
                        anchors.top:parent.top
                        anchors.bottom: parent.bottom
                        anchors.left:parent.left
                        anchors.right: parent.right
                        }
                    }
                    Rectangle{
                    id:cadreId
                    height: parent.height
                    width:300
                    Layout.fillHeight: true
                    Layout.leftMargin: 90
                    color:"#444"
                    Layout.topMargin: 25
                    Text{
                        id:bienvenue
                        width: 140
                        height: 39
                        anchors.topMargin: 15
                        text:"BIENVENUE\nà GeeadActu...."
                        anchors.alignWhenCentered: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color:"white"
                        font.bold: true
                        font.pixelSize: 20
                        OpacityAnimator{
                            target: bienvenue
                            from:0.3
                            to:1
                            duration: 2000
                            running:true
                         }

                        ColorAnimation on color {
                        to: "#3ac738"
                        duration: 10000
                        }
                        }
                    Button{
                        id:photoUser
                        anchors.top: bienvenue.bottom
                        anchors.topMargin: 25
                        anchors.alignWhenCentered: true
                        anchors.horizontalCenter: bienvenue.horizontalCenter
                        background: Rectangle{
                            implicitHeight: 140
                            implicitWidth: 140
                            radius:180
                            border.color: "white"
                            border.width: 5
                            color:"#3ac738"

                        }
                        Image {
                            id: image
                            source: "./Images/user.png"
                            anchors.centerIn: parent
                        }
                        }
                    RowLayout{
                        id:userIdLayout
                        anchors.horizontalCenter: photoUser.horizontalCenter
                        anchors.alignWhenCentered: true
                        anchors.top:photoUser.bottom
                        anchors.topMargin: 20
                        spacing: 8
                        layoutDirection: Qt.LeftToRight
                        Label{
                            Layout.alignment: Qt.AlignLeft
                            text:qsTr("Nom d'utilisateur :")
                            color:"#3ac738"
                            font.pixelSize: 15
                            font.bold: true
                            font.weight: Font.Bold
                            font.preferShaping: true
                        }
                        TextField{
                            id:userName
                            color:"white"
                            placeholderText: "Wilfried Kouassi"
                            horizontalAlignment: Text.AlignHCenter
                            Layout.alignment: Qt.AlignRight
                            echoMode: TextInput.Normal
                            focus: userName.visible?true:false
                            font.pixelSize: 15
                            font.preferShaping: true
                            font.weight: Font.Thin
                            overwriteMode: true
                            maximumLength: 20
                            Material.accent: Material.color(Material.Green,Material.Shade700)

                        }
                    }
                    RowLayout{
                        id:userPassWordLayout
                        spacing: 45
                        anchors.topMargin: 15
                        anchors.horizontalCenter: userIdLayout.horizontalCenter
                        anchors.alignWhenCentered: true
                        anchors.top:userIdLayout.bottom
                        Label{
                            id:userPassWordLabel
                            Layout.alignment: Qt.AlignLeft
                            text:qsTr("Mot de Pass :")
                            color:"#3ac738"
                            font.pixelSize: 15
                            font.weight: Font.Bold
                            font.preferShaping: true
                        }
                        TextField{
                            id:userPassWord
                            color:"white"
                            Layout.alignment: Qt.AlignRight
                            echoMode:TextInput.Password
                            placeholderText: "*************"
                            font.pixelSize: 15
                            font.preferShaping: true
                            font.weight: Font.Thin
                            overwriteMode: true
                            maximumLength: 16
                            Material.accent: Material.color(Material.Green,Material.Shade500)

                        }
                    }
                    Button{
                        id:connexion
                        anchors.alignWhenCentered: true
                        anchors.horizontalCenter: userPassWordLayout.horizontalCenter
                        anchors.top: userPassWordLayout.bottom
                        anchors.topMargin: 20
                        width: 95
                        height: 45
                        Material.background: Material.color(Material.LightGreen,Material.Shade500)
                        highlighted: false
                        Material.elevation: 20
                        contentItem: Text{
                            anchors.centerIn: parent
                            text:"Connexion"
                            font.pixelSize: 15
                            font.weight: Font.Thin
                            color:"white"
                        }
                        onClicked: {

                            if(userName.getText(0,16)==="Kouassi" || userName.getText(0,16)==="" && userPassWord.getText(0,16)==="")
                            {
                            identification.buttonCliked()
                            }

                        }
                    }
                    Button{
                        id:motDepassOublier
                        anchors.alignWhenCentered: true
                        anchors.horizontalCenter: connexion.horizontalCenter
                        anchors.top:connexion.bottom
                        anchors.topMargin: 10
                        flat:true
                        background: Text{
                            text:"Mot de pass oublier"
                            color: "blue"
                            font.underline: true
                            font.pixelSize: 12
                            font.weight: Font.Thin
                        }
                        highlighted: false
                    }
                    }

                    }
            Rectangle{
                x:72
                y:6
                width:200
                height:51
                border.color: "#3ac738"
                border.width: 3
                radius: 19
                Text{
                    id:geead
                    x: 23
                    y: 0
                    width: 102
                    height: 39
                    color: "#3ac738"
                    text:"Geead"
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 30
                    font.underline: true
                    font.bold: true
                    font.italic: false
                    styleColor: "#d26123"
                    lineHeight: 1.1
                    fontSizeMode: Text.HorizontalFit
                    horizontalAlignment: Text.AlignHCenter

                }

                Text {
                    id: actu
                    x: 101
                    y: 8
                    width: 91
                    height: 39
                    color: "#444"
                    text: "Actu"
                    verticalAlignment: Text.AlignVCenter
                    font.underline: true
                    font.italic: true
                    font.bold: true
                    fontSizeMode: Text.HorizontalFit
                    lineHeight: 1.1
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 19
                    styleColor: "#1d140d"
                }

            }
             Rectangle{
                  x:72
                  y:6
                  width:200
                  height:51
                  color:"white"
                  border.color: "#3ac738"
                  border.width: 3
                  radius: 19
                  opacity:0.2
               }
        }
    }
}


/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
