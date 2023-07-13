





class CartModal {
  String? orderTotalAmout;
  List<ListCart>? list;

  CartModal({this.orderTotalAmout, this.list});

  CartModal.fromJson(Map<String, dynamic> json) {
    orderTotalAmout = json['OrderTotalAmout'];
    if (json['list'] != null) {
      list = <ListCart>[];
      json['list'].forEach((v) {
        list!.add(ListCart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrderTotalAmout'] = this.orderTotalAmout;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListCart {
  int? productId;
  String? productName;
  int? userId;
  int? quantity;
  String? quantityMl;
  String? price;
  int? orderId;

  ListCart(
      {this.productId,
        this.productName,
        this.userId,
        this.quantity,
        this.quantityMl,
        this.price,
        this.orderId});

  ListCart.fromJson(Map<String, dynamic> json) {
    productId = json['ProductId'];
    productName = json['ProductName'];
    userId = json['UserId'];
    quantity = json['Quantity'];
    quantityMl = json['QuantityMl'];
    price = json['Price'];
    orderId = json['OrderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductId'] = this.productId;
    data['ProductName'] = this.productName;
    data['UserId'] = this.userId;
    data['Quantity'] = this.quantity;
    data['QuantityMl'] = this.quantityMl;
    data['Price'] = this.price;
    data['OrderId'] = this.orderId;
    return data;
  }
}