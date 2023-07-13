



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_toolbar.dart';

import '../../../controller/wine_store/scan_controller.dart';

class ScanCodeView extends StatefulWidget {
  const ScanCodeView({Key? key}) : super(key: key);

  @override
  State<ScanCodeView> createState() => _ScanCodeViewState();
}

class _ScanCodeViewState extends State<ScanCodeView> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');


  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      //    ScanController().controller!.pauseCamera();
    } else if (Platform.isIOS) {
      ScanController().controller!.resumeCamera();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CommonToolbar(toolText: "Scan Qr Code"),
            Expanded(
                child:
                _buildQrView(context)
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    ScanController().controller?.dispose();
    super.dispose();
  }


  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery
        .of(context)
        .size
        .width < 400 ||
        MediaQuery
            .of(context)
            .size
            .height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: Get
          .find<ScanController>()
          .onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      //onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

}