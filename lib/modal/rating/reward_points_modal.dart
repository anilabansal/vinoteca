class RewardPointsModal {
  int? response;
  List<ListDataReward>? listData;

  RewardPointsModal({this.response, this.listData});

  RewardPointsModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    if (json['listData'] != null) {
      listData = <ListDataReward>[];
      json['listData'].forEach((v) {
        listData!.add(ListDataReward.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    if (this.listData != null) {
      data['listData'] = this.listData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListDataReward {
  int? id;
  double? points;
  String? type;
  String? addedOn;
  int? userId;


  ListDataReward(
      {this.id, this.points, this.type, this.addedOn, this.userId});

  ListDataReward.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    points = json['points'] ??0.0;
    type = json['type'];
    addedOn = json['addedOn'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['points'] = this.points;
    data['type'] = this.type;
    data['addedOn'] = this.addedOn;
    data['userId'] = this.userId;
    return data;
  }
}
