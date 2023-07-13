


import 'package:flutter/material.dart';
import 'package:vinoteca_app/common/utils/common_font.dart';

import '../../common/utils/common_colors.dart';

class CommonTextWidget extends StatelessWidget {
  String? msg;
  String? font;
  double? textSize;
  Color? color;
  int? maxLine;
  TextAlign? textAlign;
  CommonTextWidget({Key? key,this.msg,this.font,this.textSize,this.color,this.textAlign,this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(msg!,maxLines:maxLine ?? 5,textAlign:textAlign==null ? TextAlign.start: TextAlign.center,style: TextStyle(fontFamily:font,fontSize:textSize,color: color ),);
  }
}

class CommonRichTextWidget extends StatelessWidget {
  String? msg;
  String? font;
  double? textSize;
  Color? color;
  int? maxLines;
  List<TextSpan>? textSpanList;
  CommonRichTextWidget({Key? key,this.msg,this.textSpanList,this.maxLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
        child: RichText(
          maxLines: maxLines ?? 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          text: TextSpan(
            children: textSpanList!
                .map(
                  (data) => data,
            )
                .toList(),
          ),
        )
    );
  }
}


class CommonTextFieldWidget extends StatelessWidget {
  String? msg;
  String? font;
  double? textSize;
  String? title;
  TextInputType? inputType;
  bool? enable;
  TextEditingController? textEditController;

  CommonTextFieldWidget({Key? key,this.inputType,this.title,this.msg,this.font,this.textSize,this.textEditController,this.enable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(msg:title,textSize: 14,font: dSansRegular,color: black525252,),
        TextField(
          enabled: enable ?? true,
          controller: textEditController,
          keyboardType:inputType ?? TextInputType.text,
          style: TextStyle(fontFamily:font,fontSize:textSize,color: orange432821,fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            hintText: msg!,
            hintStyle: TextStyle(fontFamily:font,fontSize:textSize,fontWeight: FontWeight.w500,color: black000045),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: greyD8D8D8),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: orangeDC571F),
            ),
          ),
        )
      ],
    );
  }
}



class CommonDatePickWidget extends StatelessWidget {

  String? msg;
  String? font;
  double? textSize;
  String? title;
  String? hint;
  VoidCallback? callback;

  CommonDatePickWidget({Key? key,this.title,this.msg,this.font,this.textSize,this.callback,this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(msg:title,textSize: 14,font: dSansRegular,color: black525252),
        InkWell(
          onTap: (){
            callback!();
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: 40,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: greyD8D8D8),
              )
            ),
            child: Text(msg==null || msg=="" ? hint! : msg!,style: TextStyle(color: msg==null || msg=="" ? black000045 : Colors.black ),),
          )
        )
      ],
    );
  }
}


class CommonTextFieldPass extends StatelessWidget {
  String? msg;
  String? font;
  double? textSize;
  String? title;
  bool isPassVisible=false;
  VoidCallback callback;
  TextEditingController? textEditController;
  CommonTextFieldPass({Key? key,this.title,this.msg,this.font,this.textSize,required this.isPassVisible,required this.callback,this.textEditController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(msg:title,textSize: 14,font: dSansRegular,color: black525252,),
        TextField(
          controller: textEditController,
          obscureText: isPassVisible,
          style: TextStyle(fontFamily:font,fontSize:textSize,color: orange432821,fontWeight: FontWeight.w500),
          decoration: InputDecoration(
              hintText: msg!,
              hintStyle: TextStyle(fontFamily:font,fontSize:textSize,fontWeight: FontWeight.w500,color:black000045 ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: greyD8D8D8),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: orangeDC571F),
              ),
              suffixIcon: IconButton(
                onPressed: (){
                  callback();
                },
                icon: Icon(isPassVisible ?  Icons.visibility_off_outlined:Icons.visibility,color:black525252),
              )
          ),
        )
      ],
    );
  }
}



