import QtQuick 2.4
import Ubuntu.Components 1.2

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "textfield.liu-xiao-guo"

    width: units.gu(60)
    height: units.gu(85)

    Page {
        id: page
        title: i18n.tr("TextField Input")

        Connections {
            target: Qt.inputMethod
            onVisibleChanged: console.log("OSK visible: " + visible)
        }

        property var model: [
            "Qt.ImhHiddenText",
            "Qt.ImhSensitiveData",
            "Qt.ImhNoAutoUppercase",
            "Qt.ImhPreferNumbers",
            "Qt.ImhPreferUppercase",
            "Qt.ImhPreferLowercase",
            "Qt.ImhNoPredictiveText",
            "Qt.ImhDate",
            "Qt.ImhTime",
            "Qt.ImhDigitsOnly",
            "Qt.ImhFormattedNumbersOnly",
            "Qt.ImhUppercaseOnly",
            "Qt.ImhLowercaseOnly",
            "Qt.ImhDialableCharactersOnly",
            "Qt.ImhEmailCharactersOnly",
            "Qt.ImhUrlCharactersOnly"
        ]

        property var inputMethods: [
            Qt.ImhHiddenText,
            Qt.ImhSensitiveData,
            Qt.ImhNoAutoUppercase,
            Qt.ImhPreferNumbers,
            Qt.ImhPreferUppercase,
            Qt.ImhPreferLowercase,
            Qt.ImhNoPredictiveText,
            Qt.ImhDate,
            Qt.ImhTime,
            Qt.ImhDigitsOnly,
            Qt.ImhFormattedNumbersOnly,
            Qt.ImhUppercaseOnly,
            Qt.ImhLowercaseOnly,
            Qt.ImhDialableCharactersOnly,
            Qt.ImhEmailCharactersOnly,
            Qt.ImhUrlCharactersOnly
        ]

        Flickable {
            anchors.fill: parent
            contentHeight: layout.childrenRect.height + units.gu(2)

            Column {
                id: layout
                width: parent.width

                OptionSelector {
                    id: option
                    text: page.model[selectedIndex]
                    model: page.model

                    // update the text
                    onSelectedIndexChanged: {
                        console.log("selectedIndex: " + selectedIndex )
                        text = page.model[selectedIndex]
                        textField.inputMethodHints = page.inputMethods[selectedIndex]
                    }
                }

                TextField {
                    id: textField
                    width:page.width*.7
                    placeholderText: "Please input something"
                }

                TextField {
                    id: textField1
                    width:page.width*.7
                    placeholderText: "Please input a password"
                    echoMode: TextInput.Password
                }
            }
        }
    }
}

