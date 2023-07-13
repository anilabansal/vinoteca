import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/profile/profile_controller.dart';
import 'package:vinoteca_app/controller/web_services/webservices_constants.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_all_widget.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_image_widget.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_text_widget.dart';
import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../../modal/home/all_user_rated_review_modal.dart';
import '../bottom_bar/home/wine_store/wine_detail_helper.dart';


class AllReviewList extends StatelessWidget {
  const AllReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshReviews,
      child: SingleChildScrollView(
        child: GetBuilder<ProfileController>(
            builder: (controller) {
              return controller.isLoadingReview! ? Center(
                child:  CircularProgress(),
              )  : controller.dataReviewList!.isNotEmpty? ListView.builder(
                shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return  listItem(index);
                //  return Text("jcgdhjfv");
                },
                itemCount: controller.dataReviewList!.length,
              ):Center(
                child: CommonTextWidget(
                  msg: "No review or rating you given...",
                  textSize: 12.0,
                  font: dSansMedium,
                  color: Colors.black,
                ),
              );
            }
        ),
      ),
    );
  }
  Future<dynamic> _refreshReviews() async{
    print('refreshing stocks...');
    Get.find<ProfileController>().getAllReviewList();

  }
  Widget  listItem(index){
    return InkWell(
      onTap: (){
        showModalBottomSheet(
            context: Get.context!,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => Container(
            // height: MediaQuery.of(context).size.height * 0.75,
            decoration:  const BoxDecoration(
              color: Colors.white,
              borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child:  Wrap(
              children:  [
                ReviewDetail(data:Get.find<ProfileController>().dataReviewList![index]),
              ],
            ),),

        );
        // Get.toNamed("/reviewDetail");
      },
      child: Padding(
        padding: const EdgeInsets.only(left:20.0,right: 20,top: 10,bottom: 10.0),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RatingCustomView(rating: Get.find<ProfileController>().dataReviewList![index].rating!.toString(),ratingUserCount: Get.find<ProfileController>().dataReviewList![index].rating!.toString(),),
                      CommonTextWidget(msg:Get.find<ProfileController>().dataReviewList![index].review!,textSize: 14.0,font: dSansRegular,color: black000000,),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today,color: orangeDC571F,size: 16,),
                          const SizedBox(width: 8,),
                          CommonTextWidget(msg:Get.find<ProfileController>().dataReviewList![index].ratedOn,textSize: 13.0,font: dSansRegular,color: black525252,),
                        ],
                      )
                    ],
                  )),
                  const SizedBox(width: 10,),
                  Get.find<ProfileController>().dataReviewList![index].bannerImage!=null? WineImageReview(bgImageWidth: 125,bgImageHeight: 125,bannerImage:WebServicesConstant.imageBaseUrl+ Get.find<ProfileController>().dataReviewList![index].bannerImage!,imageList: Get.find<ProfileController>().dataReviewList![index].wineImagesList!,):SizedBox()
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(height: 1,color: greyD8D8D8,width: double.infinity,)
          ],
        ),
      )
    );
  }


  Widget get  reviewWineImage{
    List<String> imageList=["asset/images/dummy/img_wine_review1.png","asset/images/dummy/img_wine_review1.png","asset/images/dummy/img_wine_review1.png","asset/images/dummy/img_wine_review1.png"];
    return Container(height: 120,width: 120,decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10))
    ),child: Stack(
      fit: StackFit.expand,
      children: [

        Image.asset("asset/images/dummy/img_wine_review1.png",fit: BoxFit.fill,),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: imageList.map((e) => images(e)).toList(),
            ),
          ),
        )
      ],
    ),);
  }
  
  Widget  images(imagePath){
    return Container(height: 20,width: 20,
      decoration:  BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(2)),
        border: Border.all(color: Colors.white,width: 1)

    ),child: Image.asset("asset/images/dummy/img_wine_review1.png",fit: BoxFit.fill,),);
  }
}

class WineImageReview extends StatelessWidget {

  double? bgImageWidth;
  double? bgImageHeight;
  String? bannerImage;
  WineImageReview({Key? key,this.bgImageHeight,this.bannerImage,this
  .bgImageWidth,this.imageList}) : super(key: key);

  List<String>? imageList=[];
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: bgImageWidth!,maxHeight: bgImageHeight!),
      decoration:  const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10))
       ),child: Stack(
      fit: StackFit.expand,
       children: [
         SizedBox(width:bgImageWidth,height: bgImageHeight,child: bannerImage!=null ? CommonImageView(borderRadius:BorderRadius.circular(10.0),image: bannerImage):Image.asset("asset/images/dummy/img_wine_review1.png",fit: BoxFit.fill,width: bgImageWidth!,height: bgImageHeight!)),
         imageList!.isNotEmpty?Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: bgImageWidth!,
            height: 30,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5.0,left: 5.0,right: 5.0),
              child: ListView.builder(itemBuilder: (context,index){
                return images(imageList![index],index);
              },itemCount: imageList!.length,shrinkWrap:true,physics: const NeverScrollableScrollPhysics(),scrollDirection: Axis.horizontal,),

            )
          )
        ): const SizedBox()
      ],
    ),);
  }

   Widget  images(imagePath,index){
     return
       index==3 ? Container(
         height: 25,
         width: 25,
       alignment: Alignment.center,
       decoration:  BoxDecoration(
           color:  Colors.white,
           borderRadius: const BorderRadius.all(Radius.circular(4)),
           border: Border.all(color: Colors.white,width: 1)

       ),child: CommonTextWidget(msg:"+2",textSize: 14.0,font: dSansMedium,color: black000000,),)
         :
     Container(
         height: 25,
         width: 25,
         margin: const EdgeInsets.only(right: 5),
       decoration:  BoxDecoration(
           borderRadius: const BorderRadius.all(Radius.circular(4)),
           border: Border.all(color: Colors.white,width: 1)

       ),child: ClipRect(
           child: Image.asset("asset/images/dummy/img_wine_review1.png",fit: BoxFit.fill,),
         ));
   }
}


class ReviewDetail extends StatelessWidget {
  DataReview? data;
  List<String>? wineImages;
  ReviewDetail({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Align(alignment:Alignment.center,child: CommonTextWidget(msg:"Review Detail",textSize: 22.0,font: dSansBold,color: black000000,)),
               Align(
                alignment: Alignment.topRight,
                child: CloseButtonCommon(width: 30,height: 30,)
              ),
            ],
          ),
          const SizedBox(height: 20,),
          WineImageReview(bgImageWidth: MediaQuery.of(context).size.width,bgImageHeight: 200,bannerImage:WebServicesConstant.imageBaseUrl+ data!.bannerImage!,imageList: data!.wineImagesList,),
          const SizedBox(height: 20,),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children:  [
              RatingCustomView(rating: data!.rating.toString(),ratingUserCount: data!.rating.toString(),),
              Row(
               children: [
                 const Icon(Icons.calendar_today,color: orangeDC571F,size: 16,),
                 const SizedBox(width: 8,),
                 CommonTextWidget(msg:data!.ratedOn.toString(),textSize: 13.0,font: dSansRegular,color: black525252,),
               ],
             )
            ],
          ),
          const SizedBox(height: 20,),
          CommonTextWidget(msg:data!.review.toString(),textSize: 14.0,font: dSansRegular,color: orange432821,),

          const SizedBox(height: 50,),
        ],
      ),
    );
  }

}