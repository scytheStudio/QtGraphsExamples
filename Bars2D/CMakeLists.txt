cmake_minimum_required(VERSION 3.16)

project(Bars2D VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.8 COMPONENTS Quick REQUIRED)

qt_add_executable(appBars2D
    main.cpp
)

qt_add_qml_module(appBars2D
    URI Bars2D
    VERSION 1.0
    QML_FILES main.qml
)

target_link_libraries(appBars2D
    PRIVATE Qt6::Quick)
