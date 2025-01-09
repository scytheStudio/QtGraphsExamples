import QtQuick
import QtGraphs

/*
  The application will be gradually slowing down as the points are appended infinitely.
  Simple removal of the elements on the left when out of sight is problematic due to reported bug
  to be found under https://bugreports.qt.io/browse/QTBUG-132402
*/

Window {
  width: 640
  height: 480
  visible: true
  visibility: Window.Maximized
  title: qsTr("Graphs 2D - Dynamic Spline")

  GraphsView {
    id: graphsView

    anchors.fill: parent

    axisX: ValueAxis { id: xAxis; tickInterval: 1; max: 20 }
    axisY: ValueAxis { id: yAxis; max: 19.5 }

    AnimatedSplineSeries {
      id: series1
      color: "#1dca9b"
    }

    AnimatedSplineSeries {
      id: series2
      color: "red"
    }

    AnimatedSplineSeries {
      id: series3
      color: "#6b41e2"
    }
  }

  Timer {
    interval: 1850
    running: true
    repeat: true
    onTriggered: {
      series1.append(series1.at(series1.count - 1).x + 1, Math.random() * 6 + 13.5)
      series2.append(series2.at(series2.count - 1).x + 1, Math.random() * 6 + 7)
      series3.append(series3.at(series3.count - 1).x + 1, Math.random() * 6 + 0.5)
    }
  }

  FrameAnimation {
    id: animation
    running: true
    onTriggered: {
      xAxis.max += frameTime / 2
      xAxis.min += frameTime / 2
    }
  }

  component AnimatedSplineSeries: SplineSeries {
    width: 6

    pointDelegate: Rectangle {
      property color pointColor
      height: 15
      width: 15
      radius: width / 2
      color: Qt.darker(pointColor)
      border {
        width: 3
        color: "white"
      }
    }

    GraphTransition {
      GraphPointAnimation { duration: 1850; easingCurve.type: Easing.OutCubic  }
      SplineControlAnimation { duration: 1850; easingCurve.type: Easing.OutCubic }
    }

    XYPoint { x: 13.0; y: 10 }
    XYPoint { x: 14.0; y: 10 }
    XYPoint { x: 15.0; y: 10 }
  }
}
