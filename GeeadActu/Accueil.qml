import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls 1.4 as Ctrl
import QtQuick.Layouts 1.3
import QtQuick.Window 2.11
import QtQuick.Controls.Material 2.3
import "./sources/news/models"
import './sources/news'

Item {
    id:itemParent
    // Les signaux
    signal deconnect()
    signal helpEvent()
    signal aboutEvent()
    signal annuaireEvent()
    signal monProfilEvent()
    signal updateEvent()
    states: [
        State {
            name: "drawerNclip"
            when: newView.drawerDrag===false
            PropertyChanges {
                target: drawer
                dragMargin:0
            }
        }
    ]
    ColumnLayout{
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        anchors.fill: parent.Center
        layoutDirection:Qt.LeftToRight
        spacing:5
        Rectangle{
            id:header
            width:parent.width
            height:50
            radius: 5
            border.color: "#fff"
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.bottomMargin:2
            color:"#3ac738"
            Layout.topMargin: 5
            signal buttonClicked()
            Row{
                width:parent.width-20
                height: parent.height
                leftPadding: 10
                rightPadding: 10
                anchors.centerIn: parent
                anchors.fill: parent.Center
                Label{
                    id:logoGeeadLbel
                    height:parent.height
                    width:parent.height+25
                    opacity: 0.8
                    Image {
                        id: logoGeeadImage
                        width:parent.width
                        height:parent.height
                        anchors.centerIn: parent
                        anchors.fill: parent
                        anchors.topMargin: 2
                        anchors.bottomMargin: 2
                        source: "qrc:/Images/Geead.png"
                        }
                     }
                Item{
                    width: parent.width-(parent.height+logoGeeadLbel.width)
                    height: parent.height
                    Text{
                        id:geead
                        anchors.centerIn: parent
                        anchors.leftMargin: -5
                        color: "#fff"
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
                        //width: 91
                        id:actu
                        y: 8
                        height: parent.height
                        anchors.left:geead.right
                        anchors.leftMargin: -10
                        color: "#444"
                        text: "Actu"
                        font.underline: true
                        font.italic: true
                        font.bold: true
                        fontSizeMode: Text.HorizontalFit
                        lineHeight: 1.1
                        font.pixelSize: 30
                        styleColor: "#1d140d"
                        }
                    }
                ToolButton{
                    id:menuButon
                    width:parent.height
                    height:parent.height
                    icon.color: "white"
                    icon.height:menuButon.height
                    icon.width: menuButon.width
                    icon.source:"qrc:/icons/menu_32.png"
                    onClicked: menu.open()
                    Menu{
                        id:menu
                        y:menuButon.height/2
                        x:500
                        MenuItem{
                            id:monProfil
                            display: AbstractButton.TextBesideIcon
                            text:"Mon Profil"
                            icon.source:"qrc:/icons/MonProfil_32.png"
                            onClicked: itemParent.monProfilEvent()
                        }
                        MenuItem{
                            id:search
                            display: AbstractButton.TextBesideIcon
                            text:"Recherche"
                            icon.source:"qrc:/icons/Search_32.png"
                            onClicked: drawer.open()
                        }
                        MenuItem{
                            id:contacts
                            display: AbstractButton.TextBesideIcon
                            text:"Annuaires"
                            icon.source:"qrc:/icons/Contacts_32.png"
                            onClicked: itemParent.annuaireEvent()
                        }

                        MenuItem{
                            id:help
                            display: AbstractButton.TextBesideIcon
                            text:"Help"
                            icon.source:"qrc:/icons/Help_32.png"
                            onClicked: itemParent.helpEvent()
                        }
                        MenuItem{
                            id:about
                            display: AbstractButton.TextBesideIcon
                            text:"A propos de nous"
                            icon.source:"qrc:/icons/About_32.png"
                            onClicked: itemParent.aboutEvent()
                        }
                        MenuItem{
                            id:update
                            display: AbstractButton.TextBesideIcon
                            text:"Mises à jour"
                            icon.source:"qrc:/icons/update_32.png"
                            onClicked: itemParent.updateEvent()
                        }
                        MenuItem{
                            id:deconnect
                            display: AbstractButton.TextBesideIcon
                            text:"Se déconnecter"
                            icon.source:"qrc:/icons/deconect_32.png"
                            icon.color: "blue"
                            onClicked: itemParent.deconnect()
                        }
                    }
                }
                }
               }
       Item{
            id:vue
            Layout.fillHeight: true
            Layout.fillWidth: true
            width:parent.width
            height:parent.height-50
            Layout.margins: 0
            ColumnLayout{
                width: parent.width
                height: parent.height
                anchors.centerIn: parent
                anchors.fill: parent.Center
                anchors.margins: 0
                layoutDirection:Qt.LeftToRight
                spacing:0
                TabBar{
                    id:bar
                    width: parent.width
                    height: 15
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.topMargin: 0
                    Layout.rightMargin: 0
                    Layout.bottomMargin: 0
                    Material.accent: "#3ac738"
                    currentIndex: pageIndictor.currentIndex
                    TabButton{
                        id:newsButton
                        height: bar.height
                        bottomPadding: 0
                        Item{
                            id:newsButtonBg
                            property string text: "News"
                            height: newsButton.height
                            anchors.centerIn: parent
                            children:Text{
                                color: "#555"
                                anchors.centerIn: parent
                                text:newsButtonBg.text
                                font.bold: true
                                styleColor: "#5a6c4f"
                                style: Text.Normal
                                font.capitalization: Font.Capitalize
                                font.pixelSize: 15
                            }
                        }
                        onClicked:{
                            }
                    }
                    TabButton{
                        id:eventsButton
                        height: newsButton.height
                        bottomPadding: 0
                        Item{
                            id:eventsButtonBg
                            property string text: "Events"
                            height: newsButton.height
                            anchors.centerIn: parent
                            children:Text{
                                color: "#555"
                                anchors.centerIn: parent
                                text:eventsButtonBg.text
                                font.bold: true
                                font.letterSpacing: 0.7
                                styleColor: "#5a6c4f"
                                style: Text.Normal
                                font.pixelSize: 15
                            }
                        }
                        onClicked:{
                        }
                    }
                    TabButton{
                        id:mediasButton
                        height: newsButton.height
                        bottomPadding: 0
                        Item{
                            id:mediaButtonBg
                            property string text: "Médias"
                            height: newsButton.height
                            anchors.centerIn: parent
                            children:Text{
                                color: "#555"
                                anchors.centerIn: parent
                                text:mediaButtonBg.text
                                font.bold: true
                                styleColor: "#5a6c4f"
                                style: Text.Normal
                                font.pixelSize: 15
                            }
                        }
                        onClicked: {
                        }
                    }
                    TabButton{
                        id:weekButton
                        height: newsButton.height
                        bottomPadding: 0
                        Item{
                            id:weekButtonBg
                            property string text: "Week"
                            height: newsButton.height
                            anchors.centerIn: parent
                            children:Text{
                                color: "#555"
                                anchors.centerIn: parent
                                text:weekButtonBg.text
                                font.bold: true
                                styleColor: "#5a6c4f"
                                style: Text.Normal
                                font.pixelSize: 15
                            }
                        }
                        onClicked: {
                        }
                    }
                    TabButton{
                        id:annuairButton
                        height: newsButton.height
                        Item{
                            id:annuairButtonBg
                            property string text: "Geeadistes"
                            height: newsButton.height
                            anchors.centerIn: parent
                            children:Text{
                                color: "#555"
                                anchors.centerIn: parent
                                text:annuairButtonBg.text
                                font.bold: true
                                styleColor: "#5a6c4f"
                                style: Text.Normal
                                font.pixelSize: 15
                            }
                        }

                        onClicked: {
                        }
                    }
                }
                SwipeView{
                    id:view
                    orientation: Qt.Horizontal
                    width: parent.width
                    height: parent.height
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.leftMargin: 0
                    Layout.rightMargin: 0
                    Layout.bottomMargin: 0
                    currentIndex: bar.currentIndex
                    NewsSplitView{
                        id:newView
                    }
                    Rectangle{
                        id:eventView
                       Text {
                            id: evenenment
                            anchors.centerIn: parent
                            anchors.fill:parent.Center
                            text: qsTr("EVENEMENTS .....")
                            font.pixelSize: 30
                            color: "#3ac738"
                            font.weight: Font.Thin
                            XAnimator {
                                target:evenenment
                                from:eventView.width
                                to: 0
                                duration: 15000
                                easing.type: Easing.InOutElastic
                                running: true
                            }

                        }


                    }
                    Rectangle{
                        id:mediasView
                        Text {
                            id: medias
                            anchors.centerIn: parent
                            anchors.fill:parent.Center
                            text: qsTr("PHOTOS, EXTRAIT DE VIDEOS, VIDEOS.....")
                            font.pixelSize: 18
                            font.italic: true
                            font.weight: Font.Thin
                        }
                    }
                    Rectangle{
                        id:weekView
                        Text {
                            id: semaine
                            anchors.centerIn: parent
                            anchors.fill:parent.Center
                            text: qsTr("ACTUALITES DE LA SEMAINE.....")
                            font.pixelSize: 18
                            font.italic: true
                            font.weight: Font.Thin
                            opacity: 0.5
                        }
                    }
                    Rectangle{
                        id:annuairVie
                        Text {
                            anchors.centerIn: parent
                            anchors.fill:parent.Center
                            text: qsTr("GEEAD PLUS Q'UNE FAMMILE, CONTACTS.....")
                            font.pixelSize: 18
                            font.italic: true
                            color: "blue"
                            font.weight: Font.Thin
                        }
                    }

              }

            }
        }
        PageIndicator{
            id:pageIndictor
            interactive: true
            count:bar.count
            Layout.fillHeight: true
            Layout.fillWidth: true
            width: parent.width
            leftPadding:parent.width/2
            background: Rectangle{
                color: "#3ac738"
            }
            currentIndex: view.currentIndex
            Material.accent: "#fff"
            Layout.alignment: Qt.AlignHCenter
            }
        }
    Rectangle{
        color: "#3ac738"
        radius:360
        opacity: 0.99
        x:parent.width-88
        y:parent.height-93
        width:55
        height:55
        visible: drawer.visible ?false:true
        ToolButton{
            id:searchButon
            anchors.centerIn: parent
            anchors.fill: parent.Center
            visible: drawer.visible ?false:true
            width:80
            height:80
            display: AbstractButton.IconOnly
            icon.color: "white"//"#3ac738"
            icon.source:"qrc:/icons/search_48.png"
            onClicked: drawer.open()
        }
    }
   Drawer{
        id:drawer
        width: 300
        position: 0.0
        height:parent.height-22
        edge:Qt.RightEdge
        dragMargin: 20
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
                   text:"Cette partie doit venir d'une base de \n données donc l'ideal serait de la gérer avec du \n C++"
                   color:"red"
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

}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
