import QtQuick
import QtGraphs

Window {
  width: 640
  height: 480
  visible: true
  title: qsTr("Graphs 2D - Scatter Graph")

  GraphsView {
    anchors.fill: parent

    axisX: ValueAxis {}
    axisY: ValueAxis {}

    ScatterSeries {
      id: scatterSeries

      selectable: true
      selectedColor: "red"
      color: "#3065b3"

      pointDelegate: Rectangle {
        id: pointDelegate

        property bool pointSelected
        property color pointColor
        property color pointSelectedColor
        property real	pointValueX
        property real pointValueY

        height: 25
        width: height
        radius: height / 2
        color: pointSelected ? pointSelectedColor : pointColor
        border {
          width: 3
          color: Qt.darker(pointDelegate.color)
        }

        Rectangle {
          anchors.centerIn: parent
          width: parent.width * 2
          height: width
          radius: width / 2
          color: Qt.darker(pointDelegate.color)
          opacity: 0.3
          visible: pointDelegate.pointSelected
        }

        Text {
          id: pointLabel
          anchors {
            bottom: pointDelegate.top
            horizontalCenter: pointDelegate.horizontalCenter
          }
          color: "white"
          text: "(%1, %2)".arg(pointDelegate.pointValueX).arg(pointDelegate.pointValueY)
          font.bold: pointDelegate.pointSelected
        }
      }

      XYPoint { x: 1.0; y: 4.0 }
      XYPoint { x: 2.0; y: 6.0 }
      XYPoint { x: 3.0; y: 2.0 }
      XYPoint { x: 4.0; y: 7.5 }
      XYPoint { x: 5.0; y: 2.2 }
      XYPoint { x: 6.0; y: 6.1 }
      XYPoint { x: 7.0; y: 1.6 }
      XYPoint { x: 8.0; y: 8.4 }
      XYPoint { x: 9.0; y: 3.8 }
    }
  }
}
