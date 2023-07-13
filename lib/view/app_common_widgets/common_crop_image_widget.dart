

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/common/utils/common_font.dart';
import 'package:vinoteca_app/controller/auth/create_profile_controller.dart';
import 'package:vinoteca_app/controller/profile/profile_controller.dart';

import 'croper_widget.dart';

class CommonCropperScreen extends StatefulWidget {

  final Uint8List? imageFile;
  final String? type;
  const CommonCropperScreen({Key? key,this.imageFile,this.type}) : super(key: key);

  @override
  State<CommonCropperScreen> createState() => _CropperScreenState();
}

class _CropperScreenState extends State<CommonCropperScreen> {

  final GlobalKey _cropperKey = GlobalKey(debugLabel: 'cropperKey');
  Uint8List? _croppedImage;
  OverlayType _overlayType = OverlayType.rectangle;
  //int _rotationTurns = 0;

  String tapText="Cancel";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
             // height: 500,
              child: Container(
                margin: EdgeInsets.only(left:30,right: 30),
                child: widget.imageFile != null
                    ? Cropper(
                  cropperKey: _cropperKey,
                  overlayType: _overlayType,
                 // rotationTurns: _rotationTurns,
                  image: Image.memory(widget.imageFile!),
                  onScaleStart: (details) {
                    // todo: define started action.
                  },
                  onScaleUpdate: (details) {
                    // todo: define updated action.
                  },
                  onScaleEnd: (details) {
                    // todo: define ended action.
                  },
                )
                    : const ColoredBox(color: Colors.grey),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                //height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    commonButton("Cancel"),
                    commonButton("Done")

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  commonButton(text){
    return InkWell(
      onTap: () async {
        setState(() {
          tapText=text;
        });

        if(text=="Done") {
          final imageBytes = await Cropper.crop(
            cropperKey: _cropperKey,
          );

          if (imageBytes != null) {
            setState(() {
              _croppedImage = imageBytes;
            });
            getImageFile();
          }
        }else{
          Get.back();
        }
        },
      child: Container(
        padding: EdgeInsets.only(left:50,right: 50,top: 15,bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color:tapText==text? orangeDC571F : Colors.transparent
        ),
        child: Text(text,style: TextStyle(color: tapText==text ?Colors.white : orangeDC571F,fontFamily: dSansMedium,fontSize: 15.0),),
      ),
    );
  }

  getImageFile() async{
    final tempDir = await getTemporaryDirectory();
    var imagename=DateTime.now().millisecond;
    File file = await File('${tempDir.path}/$imagename.png').create();
    file.writeAsBytesSync(_croppedImage!);
    if(widget.type=="create_profile"){
      Get.find<CreateProfileController>().updatePath(file.path);
    }else{
      Get.find<ProfileController>().updatePath(file.path);
    }

    Get.back();
  }
}
