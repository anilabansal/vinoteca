

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CommonAuthBgTop extends StatelessWidget {
  String? imagePath;
   CommonAuthBgTop({Key? key,this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.5,
      child: Stack(
        children: [
          Image.asset("asset/images/auth/img_auth_bg.png", fit: BoxFit.fill),
          Container(
            height:MediaQuery.of(context).size.height / 2.7 ,
            alignment: Alignment.center,
            child: SvgPicture.asset(imagePath!),
          ),

        ],
      ),
    );
  }
}


class CommonAuthBgBtm extends StatelessWidget {

  Widget? childWidget;
   CommonAuthBgBtm({Key? key,this.childWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top:MediaQuery.of(context).size.height / 3),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft:Radius.circular(30.0),topRight: Radius.circular(30.0))
      ),
      child: childWidget,
    );
  }
}
