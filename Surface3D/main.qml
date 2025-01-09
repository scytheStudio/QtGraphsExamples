import QtQuick
import QtGraphs
import QtQuick3D
import QtQuick3D.Helpers

Window {
  id: root
  width: 1280
  height: 960
  visible: true
  title: qsTr("Graphs 3D - Surface Graph")

  Surface3D {
    id: surfaceGraph
    anchors.fill: parent

    cameraPreset: Graphs3D.CameraPreset.IsometricRight
    lightStrength: 5.0
    wrapCameraXRotation: true
    wrapCameraYRotation: true

    environment: ExtendedSceneEnvironment {
      clearColor: theme.backgroundColor
      tonemapMode: ExtendedSceneEnvironment.TonemapModeNone
      glowEnabled: true
      glowStrength: 1.1
      glowIntensity: 2
      glowBloom: 2
      glowUseBicubicUpscale: true
      glowLevel: ExtendedSceneEnvironment.GlowLevel.One
                 | ExtendedSceneEnvironment.GlowLevel.Two
                 | ExtendedSceneEnvironment.GlowLevel.Three
                 | ExtendedSceneEnvironment.GlowLevel.Four
                 | ExtendedSceneEnvironment.GlowLevel.Five

      aoEnabled: true
      aoDither: true
      ditheringEnabled: true
      backgroundMode: SceneEnvironment.Color
      lightProbe: Texture {
        textureData: ProceduralSkyTextureData {
          groundBottomColor: "black"
          skyTopColor: "black"
        }
      }
    }

    axisX: Value3DAxis {
      labelAutoAngle: 90
      title: "X Axis"
      titleVisible: true
      segmentCount: 5
      subSegmentCount: 2
    }

    axisY: Value3DAxis {
      labelAutoAngle: 90
      title: "Y Axis"
      titleVisible: true
      segmentCount: 5
      subSegmentCount: 2
    }

    axisZ: Value3DAxis {
      labelAutoAngle: 90
      title: "Z Axis"
      titleVisible: true
      segmentCount: 5
      subSegmentCount: 2
    }


    theme: GraphsTheme {
      id: theme
      theme: GraphsTheme.Theme.UserDefined
      plotAreaBackgroundColor: "#00221d"
      backgroundVisible: true
      labelFont.family: "Roboto"
      labelFont.pointSize: 25
      labelBackgroundColor: "black"
      labelBackgroundVisible: true
      gridVisible: true
      grid.mainColor: "#1dca9b"
      grid.subColor: "#0e362f"

      axisY {
        labelTextColor: "#1dca9b"
      }
      axisX {
        labelTextColor: "#1dca9b"
      }
      axisZ {
        labelTextColor: "#1dca9b"
      }
    }

    Surface3DSeries {
      id: surfaceSeries
      name: "Series 1"
      itemLabelFormat: "@seriesName - @xLabel, @zLabel: @yLabel"
      wireframeColor: "#00414A"
      colorStyle: GraphsTheme.ColorStyle.RangeGradient
      baseGradient: Gradient {
        GradientStop { id: gradient1Yellow; position: 1.0; color: "yellow" }
        GradientStop { id: gradient1Red; position: 0.66; color: "red" }
        GradientStop { id: gradient1Blue; position: 0.33; color: "blue" }
        GradientStop { id: gradient1Green; position: 0.0; color: "green" }
      }

      ItemModelSurfaceDataProxy {
        itemModel: dataModel
        columnRole: "xPos"
        yPosRole: "yPos"
        rowRole: "zPos"
      }
    }
  }

  ListModel {
    id: dataModel
    Component.onCompleted: {
      for (let i = -50; i <= 50; ++i) {
        for (let j = -50; j <= 50; ++j) {
          dataModel.append({"xPos": i, "yPos": Math.sin(i / 12) * Math.sin(j / 12), "zPos": j})
        }
      }
    }
  }
}
