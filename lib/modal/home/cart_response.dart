


class CartResponseModal {
  int? response;
  String? errorMessage;
  Data? data;
  Null? listData;

  CartResponseModal(
      {this.response, this.errorMessage, this.data, this.listData});

  CartResponseModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    errorMessage = json['errorMessage'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    listData = json['listData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['errorMessage'] = this.errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['listData'] = this.listData;
    return data;
  }
}

class Data {
  Null? wineData;
  int? orderId;
  List<OutOfStockWines>? outOfStockWines;

  Data({this.wineData, this.outOfStockWines});

  Data.fromJson(Map<String, dynamic> json) {
    wineData = json['wineData'];
    orderId=json["orderId"];
    if (json['outOfStockWines'] != null) {
      outOfStockWines = <OutOfStockWines>[];
      json['outOfStockWines'].forEach((v) {
        outOfStockWines!.add(new OutOfStockWines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wineData'] = this.wineData;
    data['orderId'] =this.orderId;
    if (this.outOfStockWines != null) {
      data['outOfStockWines'] =
          this.outOfStockWines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OutOfStockWines {
  int? wineId;
  String? wineName;
  Null? wineImage;
  int? stock;

  OutOfStockWines({this.wineId, this.wineName, this.wineImage, this.stock});

  OutOfStockWines.fromJson(Map<String, dynamic> json) {
    wineId = json['wineId'];
    wineName = json['wineName'];
    wineImage = json['wineImage'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wineId'] = this.wineId;
    data['wineName'] = this.wineName;
    data['wineImage'] = this.wineImage;
    data['stock'] = this.stock;
    return data;
  }
}