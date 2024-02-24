import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelTestView extends StatelessWidget {
  const ModelTestView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Model Viewer"),
      ),
      body:Container(
        margin: const EdgeInsets.all(20),

        height: height*0.45,
        width: width,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: theme.colorScheme.secondary,

        ),
        child:const ModelViewer(
          src: 'assets/models/low_poly_male_body_base.glb',
          iosSrc: "https://modelviewer.dev/shared-assets/models/low_poly_male_body_base.glb",
          alt: "A 3D model",
          ar: true,
          autoRotate: true,
          autoRotateDelay: 0,
          cameraControls: true,
          exposure: 0.2,
          scale: '0.5',
          cameraOrbit: "auto",
          cameraTarget: "[30.0, 0.0, 0.0]",
          // backgroundColor: Color(0x00000000),
          shadowIntensity:1.0,
          shadowSoftness: 1.0,
          // loading: Loading.eager,
          backgroundColor: Colors.transparent,

          // touchAction: TouchAction.none,
          // enableZoom: false,
          // enablePan: false,
          // enableRotate: false,
          // enableTilt: false,
          // enableDamping: false,

        ),
      ),
    );
  }
}
