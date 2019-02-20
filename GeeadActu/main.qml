import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.3

Window{
    id:accueil
    title:"GeeadActu"
    minimumHeight: 500
    minimumWidth: 800
    visible:true
    //flags: Qt.Sheet
    StackView{
        id:view
        anchors.fill: parent.Center
        anchors.centerIn: parent
        width:parent.width
        height:parent.height
        pushEnter: Transition {
                  XAnimator {
                      from:view.width
                      to: 0
                      duration: 2600
                      easing.type: Easing.InOutElastic
                  }
              }
       pushExit: Transition {
            XAnimator{
                from:0
                to:view.width
                duration: 2900
                easing.type: Easing.OutSine
            }
        }
        initialItem: Identifiant{
            id:identification
            width:parent.width
            height: parent.height
            onButtonCliked:{
                view.push(component)
                accueil.color="#66ffff"
             }

        }
     }
    Component{
        id:component
        Accueil{
            id:accueilComponent
            width:visible?parent.width:0
            height: visible ?parent.height:0
            onDeconnect: {
                view.pop()
                accueil.color="gray"
            }
               }
            }
}
