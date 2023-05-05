import QtQuick 2.0
import Sailfish.Silica 1.0
import Qt.labs.folderlistmodel 2.1
import ru.omp.amberpdf 1.0


// Страница просмотра pdf-файла
Page {

    objectName: "pdfPage"

    property string filePath
    property string fileName

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
            sourceSize { width: btnBack.width; height: btnBack.height }
        }

        onClicked: {pdfView.goToPage(1)
        }
    }


    // Создание PdfDocumentProvider с указанием пути к файлу
    PdfDocument {
        id: pdfiumProvider
        path: filePath
    }

    // Обработчик события открытия детальной информации о файле
    function openDetails() {
        console.log("Open details for file");
    }


}
