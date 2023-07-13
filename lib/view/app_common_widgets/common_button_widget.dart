

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import 'common_text_widget.dart';

class CommonButton extends StatelessWidget {
  String? msg;
  VoidCallback? callback;
  CommonButton({Key? key,this.msg,this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(foregroundColor: greyD8D8D8,backgroundColor: orangeDC571F),
        onPressed: (){
          callback!();
        },
        child: CommonTextWidget(msg:msg,textSize: 18.0,font: dSansBold,color: whiteffffff,),
      ),
    );
  }
}


class CommonButtonIcon extends StatelessWidget {
  String? msg;
  VoidCallback? callback;
  String? image;
  CommonButtonIcon({Key? key,this.msg,this.callback,this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(foregroundColor: greyD8D8D8,backgroundColor: orangeDC571F),
        onPressed: (){
          callback!();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(image!),
            const SizedBox(width: 10,),
            CommonTextWidget(msg:msg,textSize: 18.0,font: dSansBold,color: whiteffffff,),
          ],
        ),
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  String? msg;
  VoidCallback? callback;
  CancelButton({Key? key,this.msg,this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(foregroundColor: greyD8D8D8,backgroundColor: Colors.white),
        onPressed: (){
          callback!();
        },
        child: CommonTextWidget(msg:msg,textSize: 18.0,font: dSansBold,color: black525252,),
      ),
    );
  }
}


class CommonTextButton extends StatelessWidget {
  String? msg;
  VoidCallback? callback;
  CommonTextButton({Key? key,this.msg,this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 50,
      child: InkWell(
        onTap: (){
          callback!();
        },
        child: CommonTextWidget(msg:msg,textSize: 18.0,font: dSansBold,color: black525252,),
      ),
    );
  }
}

