

class OrderListModal {
  int? response;
  String? errorMessage;
  List<OrdersData>? listData;

  OrderListModal({this.response, this.errorMessage, this.listData});

  OrderListModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    errorMessage = json['errorMessage'];
    if (json['listData'] != null) {
      listData = <OrdersData>[];
      json['listData'].forEach((v) {
        listData!.add(OrdersData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['errorMessage'] = this.errorMessage;
    if (this.listData != null) {
      data['listData'] = this.listData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrdersData {
  int? orderId;
  String? orderedOn;
  String? orderAmount;
  String? deliveryFees;
  String? rewardPoints;
  String? transectionId;
  int? orderStatusId;
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? streetAddress;
  String? apartment;
  String? suiteNumber;
  String? city;
  String? zipCode;
  String? state;
  String? country;
  List<Null>? cart;
  String? orderStatus;

  OrdersData(
      {this.orderId,
        this.orderedOn,
        this.orderAmount,
        this.deliveryFees,
        this.rewardPoints,
        this.transectionId,
        this.orderStatusId,
        this.firstName,
        this.lastName,
        this.mobileNo,
        this.streetAddress,
        this.apartment,
        this.suiteNumber,
        this.city,
        this.zipCode,
        this.state,
        this.country,
        this.cart,
        this.orderStatus});

  OrdersData.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'] ?? 0;
    orderedOn = json['orderedOn'];
   // orderAmount = json['orderTotalAmount'];
    String wp=json['orderTotalAmount'] ?? "";
    if(wp.contains("\$")){
      orderAmount = wp!="" ?   double.parse(wp.split("\$")[1]).toStringAsFixed(2) :"0.00";
    }else {
      orderAmount = wp!="" ?   double.parse(wp).toStringAsFixed(2) :"0.00";
    }
    deliveryFees = json['deliveryFees'];
    rewardPoints = json['rewardPoints'];
    transectionId = json['transectionId'];
    orderStatusId = json['orderStatusId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobileNo = json['mobileNo'];
    streetAddress = json['streetAddress'];
    apartment = json['apartment'];
    suiteNumber = json['suiteNumber'];
    city = json['city'];
    zipCode = json['zipCode'];
    state = json['state'];
    country = json['country'];
    if(orderStatusId==1){
      orderStatus=UserOrderStatus.Pending.name;
    }else if(orderStatusId==2){
      //orderStatus=UserOrderStatus.Approved.name;
      orderStatus="Confirmed";
    }else if(orderStatusId==3){
      orderStatus=UserOrderStatus.OutForDelivery.name;
    }else if(orderStatusId==4){
      orderStatus=UserOrderStatus.Delivered.name;
    }
    // if (json['cart'] != null) {
    //   cart = <Null>[];
    //   json['cart'].forEach((v) {
    //     cart!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['orderedOn'] = this.orderedOn;
    data['orderAmount'] = this.orderAmount;
    data['deliveryFees'] = this.deliveryFees;
    data['rewardPoints'] = this.rewardPoints;
    data['transectionId'] = this.transectionId;
    data['orderStatusId'] = this.orderStatusId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['mobileNo'] = this.mobileNo;
    data['streetAddress'] = this.streetAddress;
    data['apartment'] = this.apartment;
    data['suiteNumber'] = this.suiteNumber;
    data['city'] = this.city;
    data['zipCode'] = this.zipCode;
    data['state'] = this.state;
    data['country'] = this.country;
    // if (this.cart != null) {
    //   data['cart'] = this.cart!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}


enum UserOrderStatus{
  Pending,
  Approved,
  OutForDelivery,
  Delivered
}