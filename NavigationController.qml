import QtQuick 2.0

Item {
    id: root

    property int currentIndex: 0
    property variant targetEnter;
    property variant targetExit;

    SequentialAnimation {
        id: enterAnim

        ParallelAnimation {
            NumberAnimation { target: targetEnter; property: "opacity"; to:1 ; duration: 400 }
            NumberAnimation { target: targetEnter; property: "anchors.rightMargin"; to: 0 ; duration: 600; easing.type: Easing.OutQuart }
        }

        ScriptAction {
            script: {
                targetExit = targetEnter;
            }
        }
    }

    SequentialAnimation {
        id: exitAnim

        ParallelAnimation {
            NumberAnimation { target: targetExit; property: "anchors.rightMargin"; to: root.width ; duration: 500; easing.type: Easing.OutQuart }
            NumberAnimation { target: targetExit; property: "opacity"; to:0 ; duration: 400 }
        }
    }

    Component.onCompleted: {
        for(var i = 0; i < root.children.length; i++)
        {
            var child = root.children[i];

            if(i != 0)
            {
                child.opacity = 0;
            } else {
                targetExit = child;
            }

            child.anchors.fill = root;
        }
    }

    function next()
    {
        if (enterAnim.running || exitAnim.running)
            return;

        if (currentIndex + 1 < root.children.length)
        {
            currentIndex += 1;
            targetEnter = root.children[currentIndex];
            targetEnter.anchors.rightMargin = root.width;
            beginTransation();
        }
    }

    function beginTransation()
    {
        enterAnim.start();
        exitAnim.start();
    }
}

