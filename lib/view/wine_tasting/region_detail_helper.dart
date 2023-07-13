



import 'package:flutter/material.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../../controller/web_services/webservices_constants.dart';
import '../../modal/home/region_detail_modal.dart';
import '../app_common_widgets/common_all_widget.dart';
import '../app_common_widgets/common_image_widget.dart';
import '../app_common_widgets/common_text_widget.dart';

class RegionImageView extends StatelessWidget {
  final String? image;
  const RegionImageView({Key? key,this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: image==null ?Image.asset("asset/images/dummy/img_region_yellow.png",fit: BoxFit.fill,):  CommonImageView(borderRadius: BorderRadius.circular(20.0),dummyImage:"asset/images/dummy/img_region_yellow.png",image:image!)
    );
  }

}



class RegionsWinesList extends StatelessWidget {
  final List<WineList>? wineList;
  const RegionsWinesList({Key? key,this.wineList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(itemBuilder: (context,index){
        return InkWell(
          onTap: () {

          },
          child: Container(
            height: 200,
            width: 150,
            //color: Colors.green,
            margin: const EdgeInsets.only(right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: [
                      wineList![index].bannerImage!=null &&  wineList![index].bannerImage!.isNotEmpty ?
                      Padding(padding: const EdgeInsets.only(bottom: 10),
                        child: CommonImageView(borderRadius: BorderRadius.circular(10.0),image: WebServicesConstant.imageBaseUrl+wineList![index].bannerImage.toString(),),) :
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                  color: pinkFDF3EF,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(100),
                                      topRight: Radius.circular(100))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Image.asset(
                                "asset/images/wine_store/img_bottle_glass.png"),
                          )
                        ],
                      ),
                      // const Positioned(
                      //     right: 5, bottom: 50, child: FavoriteButton(isLike: true)),
                      //Visibility(visible:showAddToCart!,child: Positioned(right:5,bottom:0,child: CartItemAddSub(width: 30,height: 30,backgroundColor: Colors.white,borderColor:Colors.white,unactiveColor: Colors.white,activeColor: greyD8D8D8,wineData: wineData!,)))
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                CommonTextWidget(
                  msg:wineList![index].wineName,
                  font: dSansBold,
                  textSize: 18,
                  maxLine: 2,
                  color: black000000,
                ),
                // Row(
                //   children: [
                //     CommonTextWidget(
                //       msg: "750 ML for ",
                //       font: dSansRegular,
                //       textSize: 14,
                //       color: black525252,
                //     ),
                //     CommonTextWidget(
                //       msg: " \$ ${"kjhbjhb"} ",
                //       font: dSansBold,
                //       textSize: 14,
                //       color: orangeDC571F,
                //     ),
                //   ],
                // )
              ],
            ),

          ),
        );
      },itemCount: wineList!.length,scrollDirection: Axis.horizontal,),
    );
  }

}