import 'package:flutter/material.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/common/utils/common_font.dart';

import '../../../../modal/home/wine_fundamental_modal.dart';
import '../../../app_common_widgets/common_text_widget.dart';
import '../../../app_common_widgets/custom_expansion_tile.dart';

class WineFundamentalOption extends StatelessWidget {
  String? title;
  String? leadingPath;
  String? desc;

  WineFundamentalOption({Key? key, this.title, this.leadingPath, this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: CustomExpansionTile(
        title: title!,
        leading: Image.network(
          leadingPath!,
          width: 30,
          height: 30,
        ),
        children: <Widget>[
          CommonTextWidget(
            msg: desc,
            textAlign: TextAlign.start,
            font: dSansRegular,
            textSize: 14.0,
            maxLine: 50,
            color: black525252,
          )
        ],
      ),
    );
  }
}

class WineFundamentalDispenser extends StatelessWidget {
  String? title;
  String? leadingPath;
  String? desc;

  List<SubWineFundamentals>? list = [];

  WineFundamentalDispenser(
      {Key? key, this.title, this.leadingPath, this.list, this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: CustomExpansionTile(
          title: title!,
          leading: Image.network(
            leadingPath!,
            width: 30,
            height: 30,
          ),
          //  leading: SvgPicture.asset(leadingPath!,width: 30,height: 30,),
          children: <Widget>[
            CommonTextWidget(
              msg: desc,
              font: dSansRegular,
              textSize: 14.0,
              color: black525252,
            ),
            Wrap(children: [
              ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 15, right: 15, bottom: 15),
                    child:
                        commonDispenser(list![index].image, list![index].title),
                  );
                },
                itemCount: list!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              )
            ])
          ],
        ));
  }

  Widget commonDispenser(image, title) {
    return Row(
      children: [
        Container(
          //padding: const EdgeInsets.all(10.0),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              //border: Border.all(color: greyD8D8D8, width: 1),
              shape: BoxShape.circle),
          child: Image.network(image),
        ),
        const SizedBox(width: 8),
        Expanded(
            child: CommonTextWidget(
          msg: title,
          font: dSansRegular,
          textSize: 14.0,
          color: black525252,
        ))
      ],
    );
  }
}
