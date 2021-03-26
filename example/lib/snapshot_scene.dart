import 'dart:math' as math;
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class SnapshotScenePage extends StatefulWidget {
  @override
  _SnapshotScenePageState createState() => _SnapshotScenePageState();
}

class _SnapshotScenePageState extends State<SnapshotScenePage> {
  ARKitController arkitController;

  @override
  void dispose() {
    arkitController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Snapshot'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            final image = await arkitController.snapshot();
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SnapshotPreview(
                  imageProvider: image,
                ),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
      ),
      body: Container(
        child: ARKitSceneView(onARKitViewCreated: onARKitViewCreated),
      ));

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.add(_createSphere());
  }

  ARKitNode _createSphere() => ARKitNode(
        geometry:
            ARKitSphere(materials: _createRandomColorMaterial(), radius: 0.04),
        position: vector.Vector3(-0.1, -0.1, -0.5),
      );

  List<ARKitMaterial> _createRandomColorMaterial() {
    return [
      ARKitMaterial(
        lightingModelName: ARKitLightingModel.physicallyBased,
        diffuse: ARKitMaterialProperty(
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
              .withOpacity(1.0),
        ),
      )
    ];
  }
}

class SnapshotPreview extends StatelessWidget {
  const SnapshotPreview({Key key, this.imageProvider}) : super(key: key);
  final ImageProvider imageProvider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Preview'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(image: imageProvider),
        ],
      ),
    );
  }
}
