import QtQuick
import QtGraphs
import QtQuick3D.Helpers
import QtQuick3D

Window {
  id: root
  width: 1280
  height: 960
  visible: true
  title: qsTr("Graphs 3D - Bar Graph")

  Bars3D {
    id: scatterGraph
    anchors.fill: parent
    cameraPreset: Graphs3D.CameraPreset.IsometricRight
    wrapCameraXRotation: true
    wrapCameraYRotation: true
    lightStrength: 5.0
    labelMargin: 0.2
    aspectRatio: 1.5
    selectionMode: Graphs3D.None

    environment: ExtendedSceneEnvironment {
      aoEnabled: true
      aoDither: true
      ditheringEnabled: true
      backgroundMode: SceneEnvironment.SkyBox

      lensFlareEnabled: true
      lensFlareGhostCount: 10
      lensFlareApplyStarburstTexture: true
      lensFlareBloomBias: 0.4

      lightProbe: Texture {
        textureData: ProceduralSkyTextureData {
          groundBottomColor: "black"
          skyTopColor: "white"
        }
      }
    }

    importScene: Node {
      Model {
        y: 1
        scale: Qt.vector3d(0.02, 0.02, 0.02)
        source: "#Sphere"
        castsReflections: false
        receivesReflections: true

        materials: [
          PrincipledMaterial {
            baseColor: "white"
            metalness: 0.0
            roughness: 0.0
            transmissionFactor: 1.0
            thicknessFactor: 50
          }
        ]
      }
    }

    theme: GraphsTheme {
      theme: GraphsTheme.Theme.UserDefined
      colorStyle: GraphsTheme.ColorStyle.RangeGradient
      labelsVisible: false
      plotAreaBackgroundVisible: false
      gridVisible: false
    }

    Bar3DSeries {
      id: scatterSeries
      baseGradient: Gradient {
        GradientStop { position: 1.0; color: "#270004" }
        GradientStop { position: 0.6; color: "red" }
        GradientStop { position: 0.5; color: "blue" }
        GradientStop { position: 0.4; color: "red" }
        GradientStop { position: 0.3; color: "yellow" }
        GradientStop { position: 0.2; color: "red" }
        GradientStop { position: 0.0; color: "blue" }
      }

      ItemModelBarDataProxy {
        itemModel: dataModel
        columnRole: "xPos"
        rowRole: "zPos"
        valueRole: "yPos"
      }
    }
  }

  ListModel {
    id: dataModel
    Component.onCompleted: {
      for (let i = -30; i <= 30; ++i) {
        for (let j = -30; j <= 30; ++j) {
          dataModel.append({"xPos": i, "yPos": (1 + i * i + j * j), "zPos": j})
        }
      }
    }
  }
}
