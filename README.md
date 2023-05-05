# Чтение презентаций в формате PDF из локальной файловой системы

Чтение презентаций в формате PDF из локальной файловой системы

The source code of the project is provided under
[the license](LICENSE.BSD-3-CLAUSE.md),
that allows it to be used in third-party applications.

## Project Structure

The project has a common structure
of an application based on C++ and QML for Aurora OS.

* **[ru.auroraos.PresentaionReaderPDF.pro](ru.auroraos.PresentaionReaderPDF.pro)** file
  describes the project structure for the qmake build system.
* **[icons](icons)** directory contains application icons for different screen resolutions.
* **[qml](qml)** directory contains the QML source code and the UI resources.
  * **[cover](qml/cover)** directory contains the application cover implementations.
  * **[icons](qml/icons)** directory contains the custom UI icons.
  * **[pages](qml/pages)** directory contains the application pages.
  * **[PresentaionReaderPDF.qml](qml/PresentaionReaderPDF.qml)** file
    provides the application window implementation.
* **[rpm](rpm)** directory contains the rpm-package build settings.
  **[ru.auroraos.PresentaionReaderPDF.spec](rpm/ru.auroraos.PresentaionReaderPDF.spec)** file is used by rpmbuild tool.
  It is generated from **[ru.auroraos.PresentaionReaderPDF.yaml](rpm/ru.auroraos.PresentaionReaderPDF.yaml)** file.
* **[src](src)** directory contains the C++ source code.
  * **[main.cpp](src/main.cpp)** file is the application entry point.
* **[translations](translations)** directory contains the UI translation files.
* **[ru.auroraos.PresentaionReaderPDF.desktop](ru.auroraos.PresentaionReaderPDF.desktop)** file
  defines the display and parameters for launching the application.