import QtQuick 2.0

Rectangle {
    width: 100
    height: 62

    Text {
        id: label
        font.family: "Arial Black"
        font.pointSize: 72
        color: "white"

        anchors.centerIn: parent;
    }

    function setText(text)
    {
        label.text = text;
    }

    Component.onCompleted: {
        color = Qt.rgba(Math.random(125), Math.random(125), Math.random(125), 255);
    }
}
