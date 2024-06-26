import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              Permission cameraPermission = Permission.camera;

              if (await cameraPermission.isDenied) {
                PermissionStatus result = await cameraPermission.request();

                if (result.isDenied) {
                  return;
                }
              }
              String? result = await scan();
              debugPrint("result: $result");
            },
            child: const Text("scan"),
          ),
        ),
      ),
    );
  }
}
