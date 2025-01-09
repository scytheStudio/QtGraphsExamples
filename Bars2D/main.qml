import QtQuick
import QtGraphs

Window {
  visibility: Window.Maximized
  visible: true
  title: qsTr("Graphs 2D - Bar Graph")

  GraphsView {
    anchors.fill: parent

    marginBottom: 20

    theme: GraphsTheme {
      theme: GraphsTheme.Theme.UserDefined
      colorStyle: GraphsTheme.ColorStyle.Uniform

      seriesColors: ["#01b662", "#0068ab", "#cdb0ff", "#27138b", "#ffa615", "#5f002d", "#d9f720"]
      borderColors: ["white"]
      borderWidth: 2
      singleHighlightColor: "darkRed"

      grid {
        mainColor: "#999999"
        mainWidth: 1
        subColor: "#404040"
        subWidth: 1
      }

      axisX {
        labelTextColor: "grey"
        mainColor: "grey"
        mainWidth: 1
        subColor: "#404040"
        subWidth: 1
      }

      axisY {
        labelTextColor: "grey"
        mainColor: "grey"
        mainWidth: 2
        subColor: "#404040"
        subWidth: 1
      }

      axisXLabelFont: Qt.font({
                                "pixelSize" : 14,
                                "family" : "Lucida Handwriting",
                                "weight" : Font.Medium
                              })
      axisYLabelFont: axisXLabelFont
    }

    axisX: BarCategoryAxis {
      categories: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", 'November', "December"]
      labelsAngle: 25
      subGridVisible: false
    }

    axisY: ValueAxis {
      min: 0
      max: 10
      subTickCount: 0
    }

    BarSeries {
      id: barSeries

      barWidth: 0.75

      barDelegate: Rectangle {
        id: customBarDelegate

        property color barColor
        property color barBorderColor
        property real barBorderWidth
        property real barValue
        property string barLabel
        property bool barSelected

        radius: 5
        color: barColor

        border {
          width: barBorderWidth + (barSelected ? 2 : 0)
          color: barBorderColor
        }

        Text {
          id: labelValue
          anchors.centerIn: parent
          text: customBarDelegate.barLabel + ": " + customBarDelegate.barValue.toFixed(2) + (customBarDelegate.barSelected ? " - <strong>LOSS</strong>" : "")
          textFormat: Text.RichText
          color: "white"
          rotation: -90
          font.pixelSize: 22

          NumberAnimation on opacity { from: 0; to: 1.0; duration: 1000; easing.type: Easing.InOutQuad }
        }
      }

      NumberAnimation on valuesMultiplier { from: 0; to: 1.0; duration: 1000; easing.type: Easing.InOutQuad }

      BarSet {
        id: barSet1
        values: [5.01, 9.51, 7.82, 5, 3.3, 3.1, 4, 9.1, 6.8, 5, 2.5, 7.8]
        label: "Income"
      }

      BarSet {
        id: barSet2
        values: [3, 3.34, 5.6, 4.1, 3.6, 2.7, 3, 2.51, 5.65, 7, 3.55, 9.7]
        label: "Outcome"
      }

      Component.onCompleted: {
        for (let i = 0; i < barSet1.values.length; ++i) {
          if (barSet2.values[i] > barSet1.values[i]) {
            barSet2.selectBar(i)
          }
        }
      }
    }
  }
}
