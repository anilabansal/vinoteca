




import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/payment/square_payment_controller.dart';
import 'package:vinoteca_app/controller/web_services/app_webservices.dart';
import 'package:vinoteca_app/controller/web_services/payment_webservices.dart';
import 'package:vinoteca_app/database/app_database.dart';
import 'package:vinoteca_app/modal/home/all_wines_list_modal.dart';
import 'package:vinoteca_app/view/app_common_widgets/progress_dialog.dart';
import 'package:vinoteca_app/view/app_common_widgets/snackbar.dart';

import '../../modal/orders/address_info_modal.dart';
import '../cart/cart_controller.dart';
import '../web_services/webservices_constants.dart';

class PaymentController extends GetxController{

  Rx<TextEditingController> firstNameEdt = TextEditingController().obs;
  Rx<TextEditingController> lastNameEdt = TextEditingController().obs;
  Rx<TextEditingController> mobileNoEdt = TextEditingController().obs;
  Rx<TextEditingController> streetAddressEdt = TextEditingController().obs;
  Rx<TextEditingController> apartmentEdt = TextEditingController().obs;
  Rx<TextEditingController> suitNoEdt = TextEditingController().obs;
  Rx<TextEditingController> countryEdt = TextEditingController().obs;
  Rx<TextEditingController> stateEdt = TextEditingController().obs;
  Rx<TextEditingController> cityEdt = TextEditingController().obs;
  Rx<TextEditingController> zipCodeEdt = TextEditingController().obs;

  BillingAddress? billingAddress;
  BillingAddress? shippingAddress;

  RxBool isShippingAddressSame=false.obs;
  @override
  onInit(){
    super.onInit();
    // firstNameEdt.value.text="Ramandeep";
    // lastNameEdt.value.text="Kaur";
    // mobileNoEdt.value.text="80545056079";
    update();
  }


  updateShipAddress(isShipSame){
    isShippingAddressSame.value= isShipSame;
    if(isShipSame){
     shippingAddress= billingAddress;
    }else{
      shippingAddress=null;
    }
    update();
  }


  String showAddressInfoInFeilds(modal){
    String address="";
    if(billingAddress!.streetAddress!=null){
      address= "${modal.firstName} ${modal.lastName}\n${modal.phoneNumber}\n${modal.streetAddress} ${modal.apartmentAddress} ${modal.suiteNumber} ${modal.country} ${modal.state} ${modal.city}\n${modal.zipCode}";
    }

    return address;
  }

  validateAddresses(){

    if(firstNameEdt.value.text.trim().isEmpty){
      snackBarCommon("Address", "Please enter first name");
      return false;
    }else if(lastNameEdt.value.text.trim().isEmpty){
      snackBarCommon("Address", "Please enter last name");
      return false;
    }else if(mobileNoEdt.value.text.trim().isEmpty){
      snackBarCommon("Address", "Please enter mobile number");
      return false;
    }else if(streetAddressEdt.value.text.trim().isEmpty){
      snackBarCommon("Address", "Please enter street address");
      return false;
    }else if(apartmentEdt.value.text.trim().isEmpty){
      snackBarCommon("Address", "Please enter apartment");
      return false;
    }else if(suitNoEdt.value.text.tr.isEmpty){
      snackBarCommon("Address", "Please enter suit number");
      return false;
    }else if(countryEdt.value.text.trim().isEmpty){
      snackBarCommon("Address", "Please enter country");
      return false;
    }else if(stateEdt.value.text.trim().isEmpty){
      snackBarCommon("Address", "Please enter state");
      return false;
    }else if(cityEdt.value.text.trim().isEmpty){
      snackBarCommon("Address", "Please enter city");
      return false;
    }else if(zipCodeEdt.value.text.trim().isEmpty){
      snackBarCommon("Address", "Please enter zipcode");
      return false;
    }else{
      return true;
    }
  }


  onClickAddressCheckout(){
   if(billingAddress==null || billingAddress!.streetAddress==null){
     snackBarCommon("Address","Add Billing address");

   }else if(shippingAddress==null || shippingAddress!.streetAddress==null){
     snackBarCommon("Address","Add Shipping address");
   }
   else{
     onSaveShipAddress(shippingAddress!);
   }
  }

  updateScreenType(screen){
    if(screen=="billing"){
      if(billingAddress!=null && billingAddress!.streetAddress!=null){
        firstNameEdt.value.text=billingAddress!.firstName!;
        lastNameEdt.value.text=billingAddress!.lastName!;
        mobileNoEdt.value.text=billingAddress!.phoneNumber!;
        streetAddressEdt.value.text=billingAddress!.streetAddress!;
        apartmentEdt.value.text=billingAddress!.apartmentAddress!;
        suitNoEdt.value.text=billingAddress!.suiteNumber!;
        countryEdt.value.text=billingAddress!.country!;
        stateEdt.value.text=billingAddress!.state!;
        cityEdt.value.text=billingAddress!.city!;
        zipCodeEdt.value.text=billingAddress!.zipCode!;
      }
    }
   // update();
  }

  onSaveBillAddress(){

   // billingAddress=BillingAddress(AppLocalStorage().userDetail!.userId!, apartmentEdt.value.text.trim(), cityEdt.value.text.trim(), stateEdt.value.text.trim(), streetAddressEdt.value.text.trim(), suitNoEdt.value.text.trim(), zipCodeEdt.value.text.trim(), "Kavish", "Arora", "7987100");
    if(validateAddresses()){
      billingAddress = BillingAddress(firstName:firstNameEdt.value.text,lastName: lastNameEdt.value.text,apartmentAddress:apartmentEdt.value.text,phoneNumber: mobileNoEdt.value.text,state: stateEdt.value.text,streetAddress: streetAddressEdt.value.text,suiteNumber: suitNoEdt.value.text,zipCode: zipCodeEdt.value.text,city: cityEdt.value.text,country: countryEdt.value.text);
      ProgressDialog.showProgressDialog(Get.context!);
      callPostApi({
        "Userid":AppLocalStorage().userDetail!.userId,
        "StreetAddress":streetAddressEdt.value.text.trim(),
        "ApartmentAddress":apartmentEdt.value.text.trim(),
        "SuiteNumber":suitNoEdt.value.text.trim(),
        "City":cityEdt.value.text.trim(),
        "ZipCode":zipCodeEdt.value.text.trim(),
        "State":stateEdt.value.text.trim()
      },token:AppLocalStorage().token, WebServicesConstant.billingAddress)
          .then((value) {
        print(value);
        Get.back();
        Get.back();
        clearTextFeilds();
        //Get.offAllNamed("/mainScreen");
      });

    }

    update();
  }

  saveShipment(){
    if(validateAddresses()){
      shippingAddress = BillingAddress(firstName:firstNameEdt.value.text,lastName: lastNameEdt.value.text,phoneNumber: mobileNoEdt.value.text,state: stateEdt.value.text,apartmentAddress:apartmentEdt.value.text,streetAddress: streetAddressEdt.value.text,suiteNumber: suitNoEdt.value.text,zipCode: zipCodeEdt.value.text,city: cityEdt.value.text,country: countryEdt.value.text);
      update();
      Get.back();
      clearTextFeilds();
    }
  }


  clearTextFeilds(){
    firstNameEdt.value.text="";
    lastNameEdt.value.text="";
    mobileNoEdt.value.text="";
    streetAddressEdt.value.text="";
    apartmentEdt.value.text="";
    countryEdt.value.text="";
    cityEdt.value.text="";
    stateEdt.value.text="";
    zipCodeEdt.value.text="";
    suitNoEdt.value.text="";
  }

  onSaveShipAddress(BillingAddress address){

      ProgressDialog.showProgressDialog(Get.context!);
      callPostApi({
        // "StreetAddress":streetAddressEdt.value.text.trim(),
        // "ApartmentAddress":apartmentEdt.value.text.trim(),
        // "SuiteNumber":suitNoEdt.value.text.trim(),
        // "City":cityEdt.value.text.trim(),
        // "ZipCode":zipCodeEdt.value.text.trim(),
        // "State":stateEdt.value.text.trim(),
        "StreetAddress":address.streetAddress,
        "ApartmentAddress":address.apartmentAddress,
        "SuiteNumber":address.suiteNumber,
        "City":address.city,
        "ZipCode":address.zipCode,
        "State":address.state,
        "Country": address.country,
        "FirstName":address.firstName,
        "LastName":address.lastName,
        "PhoneNumber":address.phoneNumber,
        "OrderId":Get.find<CartController>().checkoutOrderId
      },token:AppLocalStorage().token, WebServicesConstant.shippingAddress)
          .then((value) {
        Get.back();
        print(value);
        Get.find<SquarePaymentController>()
            .payWithAnyCardDetails();
      //  Get.toNamed('/paymentMethods',arguments: [{"call_from":"checkout"}]);
      });
  }

  getAllAddress() async{
    //ProgressDialog.showProgressDialog(Get.context!);
    AddressData? data=await PaymentWebservices.getAddressInfo();

    if(data!=null){
      billingAddress=data.billingAddress;
    //  shippingAddress=data.shippingAddress;
      update();
    }
  }

}