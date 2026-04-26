/*
    SPDX-FileCopyrightText: 2016 Marco Martin <mart@kde.org>

    SPDX-License-Identifier: GPL-2.0-or-later
*/

import QtQuick 2.2
import QtQuick.Layouts 1.2

import org.kde.kirigami 2.20 as Kirigami

import org.lingmo.velora.components
import "timer.js" as AutoTriggerTimer

ActionButton {
    Layout.alignment: Qt.AlignTop

    icon.width: Kirigami.Units.iconSizes.large
    icon.height: Kirigami.Units.iconSizes.large

    font.underline: false // See https://phabricator.kde.org/D9452
    opacity: activeFocus || hovered ? 1 : 0.75

    Keys.onPressed: {
        AutoTriggerTimer.cancelAutoTrigger();
    }
}
