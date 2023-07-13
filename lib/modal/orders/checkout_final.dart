


class CheckoutModal{

  String? rewardPoints;
  String? deliveryFree;
  String? orderAmount;
  String? specialInstaruction;
  int? orderId;
  String? orderTotalAmount;
  bool? isRewardPointAdded;
  String? transectionId;

  CheckoutModal({this.deliveryFree,this.isRewardPointAdded,this.orderTotalAmount,this.orderAmount,this.rewardPoints,this.specialInstaruction,this.orderId,this.transectionId});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rewardPoints'] = this.rewardPoints;
    data['deliveryFree'] = this.deliveryFree;
    data['OrderAmount'] = this.orderAmount;
    data['IsRewardPointAdded'] = this.isRewardPointAdded;
    data['OrderTotalAmount'] = this.orderTotalAmount;
    data['specialInstaruction'] = this.specialInstaruction;
    data['orderId'] = this.orderId;
    data['transectionId'] =this.transectionId;
    return data;
  }
}