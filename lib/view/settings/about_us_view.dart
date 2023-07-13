


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_text_widget.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_toolbar.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CommonToolbar(toolText: "",),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(
                children: [
                  Stack(
                    fit: StackFit.loose,
                    children: [

                      Container(
                          padding: const EdgeInsets.only(top: 50.0,bottom: 20,right: 20,left: 20),
                          margin: const EdgeInsets.only(top: 80),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              border: Border.all(color: pinkFFE3D7,width: 1)
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 10.0,bottom: 10.0),
                                  child: CommonTextWidget(msg:"About the Vinoteca",textAlign: TextAlign.center,textSize: 22.0,font: dSansBold,color: black000000,),
                                ),
                                CommonTextWidget(msg: 'Vinoteca is a unique, self-serving wine experience located at American Dream in East Rutherford, NJ. Our cutting-edge, interactive wine and beer machines offer 64 wines and 4 self-serve beer taps. The wine experience offers dispensing options of a 1oz. sip, 3 oz. taste, or 5 oz. glass of carefully curated wines. Vinoteca also offers a variety of delicious Italian fare ranging from an authentic panini to artfully crafted charcuterie boards.',
                                  maxLine:100,font: dSansRegular,textSize: 16.0,color: black525252,),
                              ],
                            ),
                          )
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            padding: const EdgeInsets.all(20.0),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFFFAF6)
                            ),
                            child: SvgPicture.asset("asset/images/auth/img_logo_brown.svg"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
