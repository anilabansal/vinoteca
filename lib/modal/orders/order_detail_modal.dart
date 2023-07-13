class OrderDetailModal {
  int? response;
  String? token;
  String? errorMessage;
  Data? data;
  List? listData;

  OrderDetailModal(
      {this.response, this.token, this.errorMessage, this.data, this.listData});

  OrderDetailModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    token = json['token'];
    errorMessage = json['errorMessage'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    listData = json['listData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['token'] = this.token;
    data['errorMessage'] = this.errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['listData'] = this.listData;
    return data;
  }
}

class Data {
  OrderData? orderData;
  List<OrderWineData>? orderWineData;

  Data({this.orderData, this.orderWineData});

  Data.fromJson(Map<String, dynamic> json) {
    orderData = json['orderData'] != null
        ? new OrderData.fromJson(json['orderData'])
        : null;
    if (json['orderWineData'] != null) {
      orderWineData = <OrderWineData>[];
      json['orderWineData'].forEach((v) {
        orderWineData!.add(new OrderWineData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderData != null) {
      data['orderData'] = this.orderData!.toJson();
    }
    if (this.orderWineData != null) {
      data['orderWineData'] =
          this.orderWineData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderData {
  int? orderId;
  String? orderOn;
  String? orderAmount;
  double? deliveryFees;
  String? rewardPoints;
  bool? isRewardPointsadded;
  String? orderTotalAmout;

  OrderData(
      {this.orderId,
        this.orderOn,
        this.orderAmount,
        this.deliveryFees,
        this.rewardPoints,
        this.isRewardPointsadded,
        this.orderTotalAmout});

  OrderData.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    orderOn = json['orderOn'];
    //orderAmount = json['orderAmount']??"0.0";
    String wpe=json['orderAmount'] ?? "";
    if(wpe.contains("\$")){
      orderAmount = wpe!="" ?   double.parse(wpe.split("\$")[1]).toStringAsFixed(2) :"0.00";
    }else {
      orderAmount = wpe!="" ?   double.parse(wpe).toStringAsFixed(2) :"0.00";
    }
   deliveryFees = json['deliveryFees'];

    rewardPoints = json['rewardPoints'];
    isRewardPointsadded = json['isRewardPointsadded'] ?? false;
    //orderTotalAmout = json['orderTotalAmout']??"0.0";
    String wp=json['orderTotalAmout'] ?? "";
    if(wp.contains("\$")){
      orderTotalAmout = wp!="" ?   double.parse(wp.split("\$")[1]).toStringAsFixed(2) :"0.00";
    }else {
      orderTotalAmout = wp!="" ?   double.parse(wp).toStringAsFixed(2) :"0.00";
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['orderOn'] = this.orderOn;
    data['orderAmount'] = this.orderAmount;
    data['deliveryFees'] = this.deliveryFees;
    data['rewardPoints'] = this.rewardPoints;
    data['isRewardPointsadded'] = this.isRewardPointsadded;
    data['orderTotalAmout'] = this.orderTotalAmout;
    return data;
  }
}

class OrderWineData {
  int? wineId;
  String? wineImage;
  String? wineName;
  int? wineQuantity;
  String? price;

  OrderWineData({this.wineImage, this.wineName, this.wineQuantity, this.price,this.wineId});

  OrderWineData.fromJson(Map<String, dynamic> json) {
    wineImage = json['wineImage'];
    wineName = json['wineName'];
    wineQuantity = json['wineQuantity'];
    //price = json['price'];
    String wp=json['price'] ?? "";
    if(wp.contains("\$")){
      price = wp!="" ?   double.parse(wp.split("\$")[1]).toStringAsFixed(2) :"0.00";
    }else {
      price = wp!="" ?   double.parse(wp).toStringAsFixed(2) :"0.00";
    }
    wineId=json['wineId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wineId'] = this.wineId;
    data['wineImage'] = this.wineImage;
    data['wineName'] = this.wineName;
    data['wineQuantity'] = this.wineQuantity;
    data['price'] = this.price;
    return data;
  }
}