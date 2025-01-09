cmake_minimum_required(VERSION 3.16)

project(Scatter2D VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.8 COMPONENTS Quick REQUIRED)

qt_add_executable(appScatter2D
    main.cpp
)

qt_add_qml_module(appScatter2D
    URI Scatter2D
    VERSION 1.0
    QML_FILES main.qml
)

target_link_libraries(appScatter2D
    PRIVATE Qt6::Quick)
