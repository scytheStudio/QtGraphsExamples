import QtQuick
import QtGraphs

Window {
  id: root
  width: 960
  height: 720
  visible: true
  title: qsTr("Graphs 2D - Area Graph")

  GraphsView {
    id: graphsView

    readonly property var dataSets: [
      [Qt.point(2000, 1.0), Qt.point(2005, 21.0), Qt.point(2008, 43.8), Qt.point(2011, 53.1), Qt.point(2012, 142.3), Qt.point(2013, 285.5), Qt.point(2014, 330.4), Qt.point(2015, 480.8), Qt.point(2016, 539.4), Qt.point(2018, 726.6)],
      [Qt.point(1983, 0.8), Qt.point(1984, 5.8), Qt.point(1985, 22.6), Qt.point(1986, 53.0), Qt.point(1987, 102.1), Qt.point(1988, 149.7), Qt.point(1989, 207.2), Qt.point(1990, 286.5), Qt.point(1991, 333.3), Qt.point(1992, 407.5), Qt.point(1993, 495.4), Qt.point(1994, 662.1), Qt.point(1995, 722.9), Qt.point(1996, 778.9), Qt.point(1997, 753.1), Qt.point(1998, 847.0), Qt.point(1999, 938.9), Qt.point(2000, 942.5), Qt.point(2001, 881.9), Qt.point(2002, 803.3), Qt.point(2003, 746.0), Qt.point(2004, 767.0), Qt.point(2005, 705.4), Qt.point(2006, 619.7), Qt.point(2007, 499.7), Qt.point(2008, 368.4), Qt.point(2009, 296.6), Qt.point(2010, 253.0), Qt.point(2011, 240.8), Qt.point(2012, 198.2), Qt.point(2013, 173.8), Qt.point(2014, 138.7), Qt.point(2015, 117.1), Qt.point(2016, 97.6), Qt.point(2017, 87.7), Qt.point(2018, 52.0)],
      [Qt.point(1973, 15.00), Qt.point(1974, 15.30), Qt.point(1975, 16.20), Qt.point(1976, 21.80), Qt.point(1977, 36.90), Qt.point(1978, 61.30), Qt.point(1979, 78.50), Qt.point(1980, 99.00), Qt.point(1981, 124.00), Qt.point(1982, 183.20), Qt.point(1983, 236.80), Qt.point(1984, 332.00), Qt.point(1985, 339.10), Qt.point(1986, 344.50), Qt.point(1987, 410.00), Qt.point(1988, 450.10), Qt.point(1989, 446.20), Qt.point(1990, 442.20), Qt.point(1991, 360.10), Qt.point(1992, 366.40), Qt.point(1993, 339.50), Qt.point(1994, 345.40), Qt.point(1995, 272.60), Qt.point(1996, 225.30), Qt.point(1997, 172.60), Qt.point(1998, 158.50), Qt.point(1999, 123.60), Qt.point(2000, 76.00), Qt.point(2001, 45.00), Qt.point(2002, 31.10), Qt.point(2003, 17.20), Qt.point(2004, 5.20), Qt.point(2005, 2.50), Qt.point(2006, 0.70), Qt.point(2007, 0.40), Qt.point(2008, 0.10), Qt.point(2009, 0.0), Qt.point(2010, 0.0), Qt.point(2011, 0.0), Qt.point(2012, 0.0), Qt.point(2013, 0.0)],
      [Qt.point(1973, 428), Qt.point(1974, 404), Qt.point(1975, 364), Qt.point(1976, 290), Qt.point(1977, 290), Qt.point(1978, 290), Qt.point(1979, 312), Qt.point(1980, 257), Qt.point(1981, 154.7), Qt.point(1982, 137.2), Qt.point(1983, 124.8), Qt.point(1984, 131.5), Qt.point(1985, 120.7), Qt.point(1986, 93.9), Qt.point(1987, 82), Qt.point(1988, 65.6), Qt.point(1989, 36.6), Qt.point(1990, 27.6), Qt.point(1991, 22), Qt.point(1992, 19.8), Qt.point(1993, 15.1), Qt.point(1994, 11.7), Qt.point(1995, 10.2), Qt.point(1996, 10.1), Qt.point(1997, 7.5), Qt.point(1998, 5.4), Qt.point(1999, 5.3), Qt.point(2000, 4.8), Qt.point(2001, 5.5), Qt.point(2002, 4.4), Qt.point(2003, 3.8), Qt.point(2004, 3.5), Qt.point(2005, 2.3), Qt.point(2006, 1.5), Qt.point(2007, 0.6), Qt.point(2008, 0.4), Qt.point(2009, 0.3), Qt.point(2010, 0.3), Qt.point(2011, 0.4), Qt.point(2012, 0.4), Qt.point(2013, 0.3), Qt.point(2014, 0.5), Qt.point(2015, 0.5), Qt.point(2016, 0.4), Qt.point(2017, 0.4), Qt.point(2018, 0.3)],
      [Qt.point(1973, 91), Qt.point(1974, 96.7), Qt.point(1975, 94.6), Qt.point(1976, 106.1), Qt.point(1977, 127.3), Qt.point(1978, 133.6), Qt.point(1979, 102.3), Qt.point(1980, 85), Qt.point(1981, 50), Qt.point(1982, 13.7), Qt.point(1983, 0.0), Qt.point(1984, 0.0), Qt.point(1985, 0.0), Qt.point(1986, 0.0), Qt.point(1987, 0.0), Qt.point(1988, 0.0), Qt.point(1989, 0.0), Qt.point(1990, 0.0), Qt.point(1991, 0.0), Qt.point(1992, 0.0), Qt.point(1993, 0.0), Qt.point(1994, 0.0), Qt.point(1995, 0.0), Qt.point(1996, 0.0), Qt.point(1997, 0.0), Qt.point(1998, 0.0), Qt.point(1999, 0.0), Qt.point(2000, 0.0), Qt.point(2001, 0.0), Qt.point(2002, 0.0), Qt.point(2003, 0.0), Qt.point(2004, 0.0), Qt.point(2005, 0.0), Qt.point(2006, 0.0), Qt.point(2007, 0.0), Qt.point(2008, 0.0), Qt.point(2009, 0.0), Qt.point(2010, 0.0), Qt.point(2011, 0.0), Qt.point(2012, 0.0), Qt.point(2013, 0.0), Qt.point(2014, 0.0), Qt.point(2015, 0.0), Qt.point(2016, 0.0), Qt.point(2017, 0.0), Qt.point(2018, 0.0) ],
      [Qt.point(2000, 0.0), Qt.point(2003, 75.0), Qt.point(2005, 325.0), Qt.point(2006, 413.8), Qt.point(2007, 310.8), Qt.point(2008, 290.1), Qt.point(2009, 150.3), Qt.point(2010, 81.5), Qt.point(2011, 70.4), Qt.point(2012, 38.8), Qt.point(2013, 29.4), Qt.point(2014, 20.6), Qt.point(2015, 13.9), Qt.point(2016, 14.6), Qt.point(2017, 8.3), Qt.point(2018, 4.0)],
    ]

    Component.onCompleted: {
      let areaSeriesComp = Qt.createComponent("QtGraphs", "AreaSeries", Component.Synchronous, root)
      let splineSeriesComp = Qt.createComponent("QtGraphs", "SplineSeries", Component.Synchronous, root)

      for (let i = 0; i < dataSets.length; ++i) {
        let areaSeries = areaSeriesComp.createObject()
        let splineSeries = splineSeriesComp.createObject()
        splineSeries.append(graphsView.dataSets[i])
        areaSeries.upperSeries = splineSeries
        graphsView.addSeries(areaSeries)
      }
    }

    anchors.fill: parent

    marginLeft: 0
    marginTop: 50

    axisX: ValueAxis { min: 1973; max: 2018; subTickCount: 4}
    axisY: ValueAxis { max: 1000; subTickCount: 4 }

    theme: GraphsTheme {
      theme: GraphsTheme.Theme.UserDefined
      colorStyle: GraphsTheme.ColorStyle.Uniform
      seriesColors: ["#800067ff", "#8009ac48", "#8000a2b7", "#807734ec", "#804053f5", "#80ffbc00"]
      borderColors: ["white"]
      borderWidth: 2

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
  }
}
