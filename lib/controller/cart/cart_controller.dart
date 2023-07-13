
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/database/app_database.dart';
import 'package:vinoteca_app/modal/home/all_wines_list_modal.dart';
import 'package:vinoteca_app/view/app_common_widgets/dialog_common.dart';
import 'package:vinoteca_app/view/app_common_widgets/progress_dialog.dart';
import 'package:vinoteca_app/view/app_common_widgets/snackbar.dart';

import '../../modal/home/cart_modal.dart';
import '../../modal/home/cart_response.dart';
import '../../modal/orders/checkout_final.dart';
import '../../view/app_common_widgets/delete_items_cart_dialog.dart';
import '../../view/cart/add_wine_from_fav.dart';
import '../web_services/cart_webservices.dart';

class CartController extends GetxController{

  List<WineData> cartList=[];
  List<ListCart> serverCartList=[];
  final Rx<int> _cartLength=0.obs;
  CheckoutModal?  checkoutModal;
  List<int> outOfCartWineIdList=[];

  Rx<int> get cartLenght => _cartLength;

  RxBool isUseRewardPoints=false.obs;

  int? checkoutOrderId=0;
  bool isCartLoading=true;

  FocusNode focus = FocusNode();

  Rx<TextEditingController> instructionCart=TextEditingController().obs;

  RxInt quantity=0.obs;
  RxDouble rewardPoints=0.0.obs;
  Rx<double> rewardPointsPrice=0.00.obs;

  //TODO price including delivery + reward price + cart procut prices
  Rx<double> totalOrderPrice=0.00.obs;
 // Rx<double> deliveryPrice=0.0.obs;
  Rx<double> deliveryPrice=10.00.obs;
  //TODO price of product in cart
  Rx<double> allProductTotalPrice=0.00.obs;

  @override
  void onInit() {
    super.onInit();

    cartList=AppLocalStorage().getCartList();
    totalOrderPrice.value=AppLocalStorage().getOrderPrice();
    //totalOrderPrice.value=1200.0;
    allProductTotalPrice.value=AppLocalStorage().getAllTotalPrice();
    rewardPoints.value=AppLocalStorage().userDetail!.totalRewardPoints!;
    serverListCart();
    setLength(cartList.length);
    update();

  }


  clearAllData(){
    cartList.clear();
    AppLocalStorage().saveCartList(cartList);
    AppLocalStorage().saveOrderPrice(0.00);
    AppLocalStorage().saveAllProductPrice(0.00);
    setLength(cartList.length);
    update();

  }
  void setLength(int value) {
    assert(cartLenght >= 0);
    _cartLength.value = value;
  }
  updateOrderId(int orderId){
    checkoutOrderId=orderId;
  }

  getProductPrice(int buyCount,int price){
    return buyCount*price;

  }


  serverListCart(){
    var tempCartList=AppLocalStorage().getCartList();
    for(var data in tempCartList){
     serverCartList.add(ListCart(productId:data.wineId,productName: data.wineName,quantity: data.buyQuantity,userId:AppLocalStorage().userDetail!.userId,price: data.price,orderId: 0));
    }
  }


  ///TODO: ON_CLICK_TO_CART_CHECKOUT
  onClickCartCheckout(){

    if(validateInstruction()){
      ProgressDialog.showProgressDialog(Get.context!);
      getCartFromServer("checkout_to_fav");
    }

  }

  ///TODO: MANAGE_REPOSNSE_FROM_API
  manageCartResponse(CartResponseModal modal){
    if(modal.response==1){
      if(modal.data!.outOfStockWines!.isNotEmpty){
        var tempCartList=AppLocalStorage().getCartList();
        for(var stockData in modal.data!.outOfStockWines!){

          Iterable data=tempCartList.where((element) => element.wineId==stockData.wineId);
          if(data.isNotEmpty){

            WineData wineData = data.first;
            wineData.stock=stockData.stock;
            if(wineData.stock!=0)
            {
              if(wineData.buyQuantity!>wineData.stock!){
                wineData.showStock=true;
              }
            }else{
              //TODO if the wine is out of stock and present in cart show the message out of stock
              //TODO with deduct the price from the allproduct price
              //TODO with deduct the price from the from total price
              var priceData=double.parse(wineData.price!) * wineData.buyQuantity!;

              if(allProductTotalPrice.value>=priceData){
                allProductTotalPrice.value=allProductTotalPrice.value-priceData;
                totalOrderPrice.value= totalOrderPrice.value - allProductTotalPrice.value;
                outOfCartWineIdList.add(wineData.wineId!);

              }

            }
            cartList[cartList.indexWhere((element) => element.wineId==stockData.wineId)] = wineData;
            AppLocalStorage().saveCartList(cartList);
          }

        }

      }

    }
    isCartLoading=false;
    update();
  }


  checkOutButtonClick(){

    checkoutModal=CheckoutModal(isRewardPointAdded :isUseRewardPoints.value,rewardPoints: rewardPointsPrice.value.toString(),deliveryFree: deliveryPrice.value.toString(),orderAmount:allProductTotalPrice.value.toString(),orderTotalAmount: totalOrderPrice.value.toString(),specialInstaruction: instructionCart.value.text,orderId: checkoutOrderId!);
    Get.toNamed('/adressInformation',arguments: [{"call_from":"checkout"}]);

  }


  orderSummary(){
    totalOrderPrice.value=allProductTotalPrice.value+rewardPointsPrice.value+deliveryPrice.value;
    //totalOrderPrice.value=1580.0;
   // AppLocalStorage().saveOrderPrice(totalOrderPrice.value);
  }


  getCartFromServer(String callApiFrom){
    CartWebservices.cartList(CartModal(orderTotalAmout:totalOrderPrice.value.toString(),list:serverCartList)).then((value){

      CartResponseModal modal = CartResponseModal.fromJson(value);
      manageCartResponse(modal);
      checkoutOrderId=modal.data!.orderId!;
      updateOrderId(modal.data!.orderId!);
      if(callApiFrom=="cart_list"){

      }else if(callApiFrom=="checkout_to_fav"){

        Get.back();
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
              children: const [
                AddWineFromFavView()
              ],
            ),),
        );
      }

    });
  }



  void updateRewardPoint(){
    isUseRewardPoints.value=!isUseRewardPoints.value;
    update();
  }

  void increaseQuantity(){
    quantity.value= quantity.value+1;
    update();
  }

  void deleteItemFromCart(int index,WineData wineData){
    //TODO get the price of product added in cart by quantity
    var productPrice=double.parse(wineData.price.toString())*wineData.buyQuantity!;
  //  double productPrice=double.parse(wineData.price.toString()).toPrecision(2)*wineData.buyQuantity!;

    //TODO subtract the price of product from total price of products
    allProductTotalPrice.value=allProductTotalPrice.value-productPrice;

    //TODO subtract the price of product from total price of order
    totalOrderPrice.value=totalOrderPrice.value-productPrice;
    wineData.buyQuantity=0;
    cartList.removeAt(index);
    AppLocalStorage().saveAllProductPrice(allProductTotalPrice.value);
    AppLocalStorage().saveOrderPrice(totalOrderPrice.value);
    AppLocalStorage().saveCartList(cartList);
    serverListCart();
    setLength(cartList.length);
    update();
  }


  void increaseQuan(WineData wineData){

    //TODO check the stock available in admin should be less than buy/order quantity by user.
    if(wineData.buyQuantity!<wineData.stock!){
      Iterable<WineData> list= cartList.where((element) => element.wineId==wineData.wineId);

      if(list.isEmpty){
        cartList.add(wineData);
      }

      //TODO add the price on increasing quantity
      //allProductTotalPrice.value=allProductTotalPrice.value+int.parse(wineData.price!);
      allProductTotalPrice.value= allProductTotalPrice.value+double.parse(wineData.price!);
      print("allPrice${allProductTotalPrice.value}");
      //TODO  increasing quantity
      wineData.buyQuantity=wineData.buyQuantity!+1;

      //TODO total order price including the delivery fee or total of all product in cart
     // totalOrderPrice.value=allProductTotalPrice.value+deliveryPrice.value;
    //  totalOrderPrice.value=allProductTotalPrice.value;
      print("allPricetotal${totalOrderPrice.value}");
      wineData.isIncreaseQuantity=true;
      cartList[cartList.indexWhere((element) => element.wineId==wineData.wineId)] = wineData;
      AppLocalStorage().saveAllProductPrice(allProductTotalPrice.value);
      AppLocalStorage().saveOrderPrice(totalOrderPrice.value);
      AppLocalStorage().saveCartList(cartList);
      setLength(cartList.length);
      serverListCart();
    }else{
      //TODO show message of stock left which comes from api if stock is less than user requirement.
      wineData.showStock=true;
    }

    update();

  }


  WineData getWineExistInCart(WineData wineData){

    if(cartList.isNotEmpty){
      Iterable<WineData> list= cartList.where((element) => element.wineId==wineData.wineId);
      return list.isEmpty ? wineData : list.first;
    }
     return wineData;

  }

  void decreaseQuantity(WineData wineData){
    Iterable<WineData> list= cartList.where((element) => element.wineId==wineData.wineId);

    if(wineData.showStock!){
      wineData.showStock=false;
    }
    if(list.isNotEmpty){
      if(wineData.buyQuantity!>0){
        //TODO subtract the price on decreasing quantity
       // allProductTotalPrice.value=allProductTotalPrice.value-int.parse(wineData.price!);
        allProductTotalPrice.value=allProductTotalPrice.value-double.parse(wineData.price!);
        //TODO total order price including all product price and delivery fee
        //totalOrderPrice.value=allProductTotalPrice.value+deliveryPrice.value;
       // totalOrderPrice.value=allProductTotalPrice.value;

        //TODO decreasing quantity
        wineData.buyQuantity=wineData.buyQuantity!-1;
        if(wineData.buyQuantity==0){
          cartList.remove(wineData);
        }
      }
      wineData.isIncreaseQuantity=false;
      //cartList[cartList.indexWhere((element) => element.wineId==wineData.wineId)] = wineData;
      AppLocalStorage().saveAllProductPrice(allProductTotalPrice.value);
      AppLocalStorage().saveOrderPrice(totalOrderPrice.value);
      AppLocalStorage().saveCartList(cartList);

      setLength(cartList.length);
      serverListCart();
      update();
    }

  }


  bool validateInstruction(){
    if(instructionCart.value.text.isNotEmpty){
      if(instructionCart.value.text.substring(0,1)==" "){
          snackBarCommon("Cart", "Please enter Special Instructions");
          return false;

      }else{
        return true;
      }
    }else if(cartList.length==outOfCartWineIdList.length){
      DialogCommon.showDialogCommon(const DeleteItemsCartDialog(msg:"Your all products are out of stock please add more wines to cart.",title: "Cart",));
      return false;
    }else if(outOfCartWineIdList.isNotEmpty){
      DialogCommon.showDialogCommon(const DeleteItemsCartDialog(msg:"Delete the out of stock wines.",title: "Cart",));
      return false;
    }else{
      return true;
    }
  }


   deleteOutOfStockItems(){
     for(int i=0;i<cartList.length;i++){
       for(int j=0;j<outOfCartWineIdList.length;j++){
         if(outOfCartWineIdList[j]==cartList[i].wineId){
           outOfCartWineIdList.removeAt(j);
           cartList.removeAt(i);
         }
       }
     }
     update();
   }

}