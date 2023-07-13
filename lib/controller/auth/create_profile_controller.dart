import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vinoteca_app/common/utils/utilities.dart';
import 'package:vinoteca_app/modal/auth/profile_agreement.dart';
import 'package:vinoteca_app/view/app_common_widgets/progress_dialog.dart';
import '../../database/app_database.dart';
import '../../modal/auth/login_modal.dart';
import '../../view/app_common_widgets/common_crop_image_widget.dart';
import '../../view/app_common_widgets/snackbar.dart';
import '../web_services/app_webservices.dart';
import '../web_services/webservices_constants.dart';

class CreateProfileController extends GetxController {
  /// TODO: EDITING_CONTROLLER_INITIALIZED
  Rx<TextEditingController> firstName = TextEditingController().obs;
  Rx<TextEditingController> lastName = TextEditingController().obs;
  Rx<TextEditingController> mobileNo = TextEditingController().obs;

  // Rx<TextEditingController> birthDate = TextEditingController().obs;
  // Rx<TextEditingController> birthMonth = TextEditingController().obs;
  Rx<String> imagePath = "".obs;

  List<ProfileAgreement> list = [];

  Rx<String> date = "".obs;
  Rx<String> month = "".obs;

  @override
  void onInit() {
    list.add(ProfileAgreement(
        title:
            "Yes, I want to receive emails for product specials, announcements and initiatives.",
        isAgree: false));
    list.add(ProfileAgreement(
        title:
            "Yes, I want to receive SMS messages for product specials, announcements and initiatives.",
        isAgree: false));
    list.add(ProfileAgreement(
        title:
            "By signing up, you agree to rewards and application Terms & Conditions, Privacy Policy and Cookie Policy.",
        isAgree: false));
    super.onInit();
  }

  /// TODO: UPDATE_DATA_MONTH
  updateDateMonth(DateTime dateTime) {
    date.value = dateTime.day.toString();
    month.value = dateTime.month.toString();
    update();
  }

  /// TODO: VALIDATE_CREATE_PROFILE
  String validateCreateProfile() {
    if (firstName.value.text.trim().isEmpty) {
      return "Enter First Name";
    } else if (lastName.value.text.trim().isEmpty) {
      return "Enter Last Name";
    } else if (mobileNo.value.text.trim().isEmpty) {
      return "Enter Mobile";
    } else if (validateMobile(mobileNo.value.text.trim())) {
      return "Enter Valid Mobile";
    } else if (date.value.isEmpty) {
      return "Enter Date";
    } else if (month.value.isEmpty) {
      return "Enter Month";
    } else if (imagePath.value.isEmpty) {
      return "Add Profile Image";
    } else {
      return "";
    }
  }

  /// TODO: CREATE_PROFILE_API_CALL
  onClickCreateProfile() {
    if (validateCreateProfile() == "") {
      ProgressDialog.showProgressDialog(Get.context!);
      callMultipartApi({
        "Userid": AppLocalStorage().userIdTemp.toString(),
        "Email": AppLocalStorage().userTempEmail.toString(),
        "FirstName": firstName.value.text,
        "LastName": lastName.value.text,
        "BirthDay": date.value,
        "BirthMonth": month.value,
        "PhoneNumber": mobileNo.value.text,
        "IsEmailForProduct": list[0].isAgree.toString(),
        "IsSmSForProduct": list[1].isAgree.toString(),
        "IsAgreeForRewards": list[2].isAgree.toString()
      }, "", imagePath.value, "profilePic", WebServicesConstant.createProfile)
          .then((value) {
        Navigator.of(Get.context!).pop();
        LoginModal modal = LoginModal.fromJson(value);
        //TODO use {usermodal} to get details of signned user
        if (modal.response == 1) {
          /// TODO: CHANGING_BOOL_VALUE
          AppLocalStorage().setIsLoginUser(true);
          AppLocalStorage().setIsProfileCreated(true);

          /// TODO: SAVING_DATA_TO_USER_MODEL_CANCEL
          AppLocalStorage().setUserData(modal.data!.loginModel!);
          Get.offAllNamed("/mainScreen");
          // Get.offAllNamed("/billingAddressView");
        } else {
          snackBarCommon("Sign Up", modal.errorMessage);
        }
      });
    } else {
      snackBarCommon("Sign Up", validateCreateProfile());
    }
  }

  /// TODO: PICK_IMAGE_TO_CAMERA
  pickImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    //imagePath.value = image!.path;

    Uint8List? _imageToCrop;
    if (image != null) {
      final imageBytes = await image.readAsBytes();

      _imageToCrop = imageBytes;
      Navigator.push(
        Get.context!,
        MaterialPageRoute(
            builder: (context) => CommonCropperScreen(
                  imageFile: _imageToCrop, type: "create_profile"

                )),
      );
    }
  }

  ///TODO:PICK_IMAGE_TO_GALLERY
  pickImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // imagePath.value = image!.path;

    Uint8List? _imageToCrop;
    if (image != null) {
      final imageBytes = await image.readAsBytes();

      _imageToCrop = imageBytes;
      Navigator.push(
        Get.context!,
        MaterialPageRoute(
            builder: (context) => CommonCropperScreen(
                imageFile: _imageToCrop, type: "create_profile")),
      );
    }
  }

  updatePath(imageFile) {
    imagePath.value = imageFile;
    update();
  }
}
