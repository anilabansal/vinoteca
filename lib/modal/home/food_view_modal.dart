


class FoodMenuModal {
  int? response;
  String? token;
  String? errorMessage;
  List<MenuList>? data;
  Null? listData;

  FoodMenuModal(
      {this.response, this.token, this.errorMessage, this.data, this.listData});

  FoodMenuModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    token = json['token'];
    errorMessage = json['errorMessage'];
    if (json['data'] != null) {
      data = <MenuList>[];
      json['data'].forEach((v) {
        data!.add(MenuList.fromJson(v));
      });
    }
    listData = json['listData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['token'] = this.token;
    data['errorMessage'] = this.errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['listData'] = this.listData;
    return data;
  }
}

class MenuList {
  int? id;
  String? foodMenu1;
  String? createdOn;
  String? type;

  MenuList({this.id, this.foodMenu1, this.createdOn, this.type});

  MenuList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodMenu1 = json['foodMenu1'];
    createdOn = json['createdOn'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['foodMenu1'] = this.foodMenu1;
    data['createdOn'] = this.createdOn;
    data['type'] = this.type;
    return data;
  }
}