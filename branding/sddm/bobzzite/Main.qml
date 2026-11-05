import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
    id: root
    width: 1920
    height: 1080
    color: "#0b0f19"

    Image {
        id: bgImage
        anchors.fill: parent
        source: config.background || "wallpaper.svg"
        fillMode: Image.PreserveAspectCrop
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 24

        Image {
            id: logo
            source: config.logo || "logo.svg"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 96
            Layout.preferredHeight: 96
            fillMode: Image.PreserveAspectFit
        }

        Text {
            text: config.headerText || "bobzzite"
            color: "#ffffff"
            font.pixelSize: 28
            font.bold: true
            font.family: "Noto Sans"
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
