cmake_minimum_required(VERSION 3.1)

project(Chromatica LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_compile_definitions(QT_DISABLE_DEPRECATED_BEFORE=0x050F00)

find_package(Qt6 COMPONENTS Core Quick REQUIRED)

add_executable(${PROJECT_NAME} "src/main.cpp" "src/qml.qrc")

target_link_libraries(${PROJECT_NAME} Qt6::Core Qt6::Quick)
