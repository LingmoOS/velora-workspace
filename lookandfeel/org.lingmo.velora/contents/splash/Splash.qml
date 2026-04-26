/*
    SPDX-FileCopyrightText: 2026 Lingmo OS Team <team@lingmo.org>

    SPDX-License-Identifier: GPL-2.0-or-later
*/

import QtQuick
import org.kde.kirigami 2 as Kirigami
import org.kde.plasma.components 3 as PlasmaComponents3

Rectangle {
    id: root
    color: "black"

    property int stage

    onStageChanged: {
        if (stage == 2) {
            introAnimation.running = true;
        } else if (stage == 5) {
            introAnimation.target = progressBar;
            introAnimation.from = 1;
            introAnimation.to = 0;
            introAnimation.running = true;
            progressAnim.running = false;
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0

        Image {
            id: logo
            //match SDDM/lockscreen avatar positioning
            readonly property real size: Kirigami.Units.gridUnit * 8

            anchors.centerIn: parent

            asynchronous: true
            source: "images/logo.svg"

            sourceSize.width: 300
        }

        PlasmaComponents3.ProgressBar {
            id: progressBar
            y: parent.height - (parent.height - logo.y) / 2 - height/2
            anchors.horizontalCenter: parent.horizontalCenter
            from: 0
            to: 100
            value: 0
            width: Kirigami.Units.gridUnit * 12
            height: Kirigami.Units.gridUnit
            NumberAnimation on value {
                id: progressAnim
                from: 0
                to: 100
                duration: 2000
                loops: Animation.Infinite
                running: Kirigami.Units.longDuration > 1
            }
        }
        Row {
            visible: false
            spacing: Kirigami.Units.largeSpacing
            anchors {
                bottom: parent.bottom
                right: parent.right
                margins: Kirigami.Units.gridUnit
            }
            Text {
                color: "#eff0f1"
                anchors.verticalCenter: parent.verticalCenter
                text: i18ndc("plasma_lookandfeel_org.kde.lookandfeel", "This is the first text the user sees while starting in the splash screen, should be translated as something short, is a form that can be seen on a product. Plasma is the project name so shouldn't be translated.", "Plasma made by KDE")
                Accessible.name: text
                Accessible.role: Accessible.StaticText
            }
            Image {
                asynchronous: true
                source: "images/kde.svgz"
                sourceSize.height: Kirigami.Units.gridUnit * 2
                sourceSize.width: Kirigami.Units.gridUnit * 2
            }
        }
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: Kirigami.Units.veryLongDuration * 2
        easing.type: Easing.InOutQuad
    }
}
