cmake_minimum_required(VERSION 3.16)

project(Surface3D VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.8 COMPONENTS Quick REQUIRED)

qt_add_executable(appSurface3D
    main.cpp
)

qt_add_qml_module(appSurface3D
    URI Surface3D
    VERSION 1.0
    QML_FILES main.qml
)

target_link_libraries(appSurface3D
    PRIVATE Qt6::Quick)
