


import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vinoteca_app/controller/wine_store/wine_detail_controller.dart';
import 'package:vinoteca_app/controller/wine_store/wine_store_list_controller.dart';
import 'package:vinoteca_app/database/app_database.dart';
import '../../modal/home/all_wines_list_modal.dart';
import '../web_services/app_webservices.dart';
import '../web_services/webservices_constants.dart';

class ScanController extends GetxController{
  Barcode? result;
  QRViewController? controller;

  Rx<String> barcodeData="".obs;

  bool? isScan=false;
  @override
  void onInit() {
    super.onInit();
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) {

        result = scanData;
        if(result!=null) {
          barcodeData.value=result!.code!;
          if(!isScan! && result!.code!=null &&result!.code!=""){
            isScan=true;
           // WineDetailController().updateWineId(int.parse(result!.code!));
            Get.offNamed("/wineDetail",arguments: [{"wineId":int.parse(result!.code!)},
            {"call_from":"scan_wine"}]);

          }


        }
    });
  }
}