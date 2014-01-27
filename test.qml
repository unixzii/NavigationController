import QtQuick 2.0

Rectangle {
    width: 340
    height: 600

    color: "#222222"

    NavigationController {
        id: nc
        anchors.fill: parent
    }

    Component.onCompleted: {
        for (var i = 0; i < 10; i++)
        {
            var component = Qt.createComponent("Page.qml");
            if (component.status == Component.Ready)
            {
                var page = component.createObject(nc);
                page.setText(i + 1);
            }
        }
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            nc.next();
        }
    }
}
