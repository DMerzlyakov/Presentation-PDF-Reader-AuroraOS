Name:       ru.auroraos.PresentaionReaderPDF

Summary:    Чтение презентаций в формате PDF из локальной файловой системы
Version:    0.1
Release:    1
Group:      Qt/Qt
License:    BSD-3-Clause
URL:        https://auroraos.ru
Source0:    %{name}-%{version}.tar.bz2

Requires:   sailfishsilica-qt5 >= 0.10.9
Requires:   amberpdf-qml-plugin >= 1.0.0
BuildRequires:  pkgconfig(auroraapp)
BuildRequires:  pkgconfig(Qt5Core)
BuildRequires:  pkgconfig(amberpdf)
BuildRequires:  pkgconfig(Qt5Qml)
BuildRequires:  pkgconfig(Qt5Quick)
BuildRequires:  desktop-file-utils


%description
Чтение презентаций в формате PDF из локальной файловой системы

%prep
%setup -q -n %{name}-%{version}

%build
%qmake5
%make_build

%install
rm -rf %{buildroot}
%qmake5_install

desktop-file-install --delete-original         --dir %{buildroot}%{_datadir}/applications                %{buildroot}%{_datadir}/applications/*.desktop

%files
%defattr(-,root,root,-)
%{_bindir}
%defattr(644,root,root,-)
%{_datadir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png
