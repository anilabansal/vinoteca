



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vinoteca_app/database/app_database.dart';
import 'package:vinoteca_app/modal/common/common_modal.dart';

import '../../modal/auth/login_modal.dart';
import '../../modal/auth/profile_modal.dart';
import '../../modal/home/all_user_rated_review_modal.dart';
import '../../modal/rating/reward_points_modal.dart';
import '../../view/app_common_widgets/common_crop_image_widget.dart';
import '../../view/app_common_widgets/progress_dialog.dart';
import '../../view/app_common_widgets/snackbar.dart';
import '../web_services/app_webservices.dart';
import '../web_services/webservices_constants.dart';


class ProfileController extends GetxController{

  Rx<TextEditingController> name=TextEditingController().obs;
  Rx<TextEditingController> mobileNo=TextEditingController().obs;
  Rx<String> imagePath="".obs;
  Rx<String> imageUrl="".obs;
  Rx<bool> isLocalImage=false.obs;
  Rx<String> date="".obs;
  Rx<String> month="".obs;
  List<DataReview>? dataReviewList=[];
  bool? isLoadingReview=true;

  List<ListDataReward>? rewardList=[];
  double rewardPointstotal=0.0;
  @override
  void onInit() {
    super.onInit();

    print("user_Detail${AppLocalStorage().userDetail!.userId.toString()}");

    name.value.text="${AppLocalStorage().userDetail!.firstName!} ${AppLocalStorage().userDetail!.lastName!}";
    mobileNo.value.text=AppLocalStorage().userDetail!.phoneNumber!;
    date.value=AppLocalStorage().userDetail!.bithday!;
    month.value=AppLocalStorage().userDetail!.birthmonth!;;
    if(AppLocalStorage().userDetail!.profilePic!=""){
      isLocalImage.value=false;
      imageUrl.value=AppLocalStorage().userDetail!.profilePic!;
    }

    getProfileApi();
  }

  updateDateMonth(DateTime dateTime){
    date.value=dateTime.day.toString();
    month.value=dateTime.month.toString();
    update();
  }
  String validateUpdateProfile() {
    if(name.value.text.trim().isEmpty){
      return "Enter First Name";
    }else if(mobileNo.value.text.trim().isEmpty){
      return "Enter Mobile Name";
    }else if(AppLocalStorage().userDetail!.profilePic==""){
      if(imagePath.value.isEmpty){
        return "Add Profile Image";
      }else
      return "";
    }else
    {
      return "";
    }
  }

  onClickUpdateProfile(){
    if(validateUpdateProfile()==""){
      ProgressDialog.showProgressDialog(Get.context!);
      callMultipartApi({
        "Userid": AppLocalStorage().userDetail!.userId.toString(),
        "FirstName": name.value.text.trim().split(" ")[0],
        "LastName": name.value.text.trim().split(" ")[1] ?? "",
        "BirthDay": month.value,
        "BirthMonth": date.value,
        "PhoneNumber": mobileNo.value.text,

      },AppLocalStorage().token, imagePath.value, "profilePic", WebServicesConstant.updateProfile)
          .then((value) {
        Navigator.of(Get.context!).pop();
        CommonModal modal = CommonModal.fromJson(value);
        //TODO use {usermodal} to get details of signned user
        if (modal.response == 1) {
          getProfileApi();
          Get.back();
        } else {
          snackBarCommon("Sign Up", modal.errorMessage);
        }
      });
    }else {
      snackBarCommon("Edit Profile",validateUpdateProfile());
    }
  }

  updatePath(imageFile){
    isLocalImage.value=true;
    imagePath.value=imageFile;
    update();
  }

  pickImageFromCamera() async{
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    Uint8List? _imageToCrop;
    if (image != null) {
      final imageBytes = await image.readAsBytes();

      _imageToCrop = imageBytes;
      Navigator.push(
        Get.context!,
        MaterialPageRoute(builder: (context) =>  CommonCropperScreen(imageFile: _imageToCrop,)),
      );
    }

  }


  pickImageFromGallery() async{
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    //imagePath.value=image!.path;

    Uint8List? _imageToCrop;
    if (image != null) {
      final imageBytes = await image.readAsBytes();

        _imageToCrop = imageBytes;
      Navigator.push(
        Get.context!,
        MaterialPageRoute(builder: (context) =>  CommonCropperScreen(imageFile: _imageToCrop,)),
      );
    }

  }

  getProfileApi(){
    callPostApi({
    },token:AppLocalStorage().token, WebServicesConstant.profile)
        .then((value) {
      ProfileModal modal= ProfileModal.fromJson(value);
      if(modal.response==1){

        AppLocalStorage().setUserData(LoginDetail(isLoyaltySignUp:modal.data!.isLoyaltySignUp,reviewCount:modal.data!.reviewCount!,firstName: modal.data!.firstName,lastName: modal.data!.lastName,
            totalRewardPoints:0.0, phoneNumber: modal.data!.phoneNo,profilePic: modal.data!.profilePic,birthmonth: modal.data!.birthMonth,bithday: modal.data!.birthDay));

        rewardPointsList();
      }

    });
  }


  getAllReviewList(){
    callPostApi({
    },token:AppLocalStorage().token, WebServicesConstant.allUserRatedReviews)
        .then((value) {
      UserRatedReviewsModal modal=UserRatedReviewsModal.fromJson(value);
      if(modal.data!.isNotEmpty){
        dataReviewList!.clear();
        dataReviewList=modal.data;
      }

      isLoadingReview=false;
      update();
          print(value);
    });
  }


  rewardPointsList(){
    callPostApi({
    }, token:AppLocalStorage().token,WebServicesConstant.rewardPointList)
        .then((value) {
      rewardList!.clear();
      RewardPointsModal modal=RewardPointsModal.fromJson(value);
      if(modal.response==1){
        rewardList=modal.listData;
      }

      if(rewardList!.isNotEmpty){
       rewardPointstotal= rewardList!.fold(0.0, (previousValue, element) => previousValue + element.points!);
      }

      LoginDetail mdata=AppLocalStorage().userDetail!;
      AppLocalStorage().setUserData(LoginDetail(isLoyaltySignUp:mdata.isLoyaltySignUp,reviewCount:mdata.reviewCount!,firstName: mdata.firstName,lastName: mdata.lastName,
          totalRewardPoints:rewardPointstotal, phoneNumber:mdata.phoneNumber,profilePic: mdata.profilePic,birthmonth: mdata.birthmonth,bithday:mdata.bithday));

      print(rewardPointstotal);
      update();
    });
  }
}