import QtQuick 2.0
import Sailfish.Silica 1.0
import Qt.labs.folderlistmodel 2.1
import QtQml.Models 2.2


// Страница просмотра списка pdf-файлов
Page {

    objectName: "aboutPage"
    allowedOrientations: Orientation.All

    // Директория для получения списка файлов
    property string documentsDirectory:  "/home/defaultuser/Documents/"


    // Delegate для элементов отображения элементов списка
    Text {
        id: titleView

        text: "Список PDF файлов"
        font.bold: true
        font.pointSize: 40
        anchors.top: parent.top
        anchors.margins: 40
        anchors.horizontalCenter: parent.horizontalCenter
    }



    // Delegate для элементов отображения элементов списка
    Component {
        id: pdfFileDelegate

        Rectangle{
            id: rectagle
            width: presentationList.width - border.width
            height: listItem.height + border.width
            radius: 20
            border{
                width: 5
                color: "gray"
            }

            ListItem {

                Label {
                    id: listItem
                    width: rectagle.width
                    text: fileName
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    font{
                        weight: Font.Light
                        pixelSize: 50
                    }
                    leftPadding: 40
                    topPadding: 20
                    bottomPadding: 20
                }
                onClicked: navigateToPdfViewerPage(filePath, fileName)
            }
        }
    }

    // Переход на страницу просмотра pdf
    function navigateToPdfViewerPage(filePath, fileName) {
        console.log(documentsDirectory)
        var pdfViewerPage = Qt.resolvedUrl("PdfViewerPage.qml")
        pageStack.push(pdfViewerPage, { filePath: filePath, fileName: fileName })
    }

    // Модель для получения списка pdf-файлов
    FolderListModel {
        id: folderModel

        folder: documentsDirectory
        nameFilters: ["*[e]*.pdf"] // выбираем только файлы с расширением pdf
    }

    TextField {
        id: searchInput
        placeholderText: "Search"
        width: parent.width

        anchors{
            top: titleView.bottom
            topMargin: 40
        }
        height: 150
        font.pixelSize: 50

        onTextChanged: {
            folderModel.nameFilters = [
                        "*" + text.trim() +"*.pdf",
                        "*" + text.toLowerCase().trim() +"*.pdf"
                    ]
        }
    }



    // Список для отображения доступных pdf-файлов
    SilicaListView {
        id: presentationList

        width: parent.width - leftMargin - rightMargin
        spacing: 30

        leftMargin: 30
        rightMargin: 30

        anchors{
            top: searchInput.bottom
            left: parent.left
            bottom: parent.bottom
        }

        model: folderModel
        delegate: pdfFileDelegate
    }
}

