import QtQuick 2.0
import Sailfish.Silica 1.0
import Qt.labs.folderlistmodel 2.1
import ru.omp.amberpdf 1.0


// Страница просмотра pdf-файла
Page {

    objectName: "pdfPage"
    id: root

    property string filePath
    property string fileName


    readonly property var pdfStatesNames: ["default", "loadingfullscreen"]
    state: pdfStatesNames[0]

    // Title страницы
    Text {
        id: titleView
        text: fileName

        font{
            bold: true
            pointSize: 40
        }
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        anchors{
            top: parent.top
            right: parent.right
            left: parent.left
            margins: 40
        }

        horizontalAlignment: Text.AlignHCenter
    }

    // Переход в полноэкранный режим отображения pdf
    function toFullSceen(){
        pdfPagesView.anchors.bottom = root.bottom
        pdfPagesView.anchors.top = root.top
        pdfPagesView.anchors.bottomMargin = 0
        pdfPagesView.anchors.topMargin = 0

        pdfPagesView.border.width = 0

        pdfPagesView.width = root.width

        titleView.visible = false
        btnBack.visible = false
        changeScreenType.visible = false

    }

    // Создание элемента PdfView для отображения PDF контента
    Rectangle{
        id: pdfPagesView
        width: parent.width - 100

        border{
            width: 5
            color: "#000000"
        }

        anchors{
            top: titleView.bottom
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 40
            topMargin: 40
        }

        PdfView {
            id: pdfView

            anchors{
                fill: pdfPagesView
                margins: pdfPagesView.border.width
            }

            documentProvider: pdfiumProvider
            clip: true
            color: "black"
            annotationsPaint: true
            notesPaint: true
        }
    }

    IconButton{
        id: btnBack
        width: 150
        height: 150

        anchors{
            bottom: pdfPagesView.bottom
            right: pdfPagesView.right
            margins: 30
        }

        icon{
            source: Qt.resolvedUrl("../icons/up_icon.svg")
            color: "#146C94"
            sourceSize {
                width: btnBack.width;
                height: btnBack.height }
        }

        onClicked: {
            pdfView.goToPage(1)
        }
    }

    IconButton{
        id: changeScreenType
        width: 150
        height: 150

        anchors{
            bottom: pdfPagesView.bottom
            left: pdfPagesView.left
            margins: 30
        }

        icon{
            source: Qt.resolvedUrl("../icons/share_icon.svg")
            color: "#146C94"
            sourceSize {
                width: changeScreenType.width;
                height: changeScreenType.height
            }
        }

        onClicked: {
            toFullSceen()
        }
    }


    // Создание PdfDocumentProvider с указанием пути к файлу
    PdfDocument {
        id: pdfiumProvider
        path: filePath
    }
}
