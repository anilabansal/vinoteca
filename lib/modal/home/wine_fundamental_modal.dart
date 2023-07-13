


class WineFundamentalModal {
  int? response;
  String? token;
  String? errorMessage;
  List<WineFundamentalData>? data;
  // List<Null>? listData;

  WineFundamentalModal(
      {this.response, this.token, this.errorMessage, this.data});

  WineFundamentalModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    token = json['token'];
    errorMessage = json['errorMessage'];
    if (json['data'] != null) {
      data = <WineFundamentalData>[];
      json['data'].forEach((v) {
        data!.add(WineFundamentalData.fromJson(v));
      });
    }
    // if (json['listData'] != null) {
    //   listData = <Null>[];
    //   json['listData'].forEach((v) {
    //     listData!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['token'] = this.token;
    data['errorMessage'] = this.errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class WineFundamentalData {
  int? id;
  String? image;
  String? title;
  String? description;
  List<SubWineFundamentals>? subWineFundamentals;

  WineFundamentalData(
      {this.id,
        this.image,
        this.title,
        this.description,
        this.subWineFundamentals});

  WineFundamentalData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    if (json['subWineFundamentals'] != null) {
      subWineFundamentals = <SubWineFundamentals>[];
      json['subWineFundamentals'].forEach((v) {
        subWineFundamentals!.add(new SubWineFundamentals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.subWineFundamentals != null) {
      data['subWineFundamentals'] =
          this.subWineFundamentals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubWineFundamentals {
  int? id;
  int? wineFundamentalId;
  String? image;
  String? title;
  Null? wineFundamental;

  SubWineFundamentals(
      {this.id,
        this.wineFundamentalId,
        this.image,
        this.title,
        this.wineFundamental});

  SubWineFundamentals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wineFundamentalId = json['wineFundamentalId'];
    image = json['image'];
    title = json['title'];
    wineFundamental = json['wineFundamental'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wineFundamentalId'] = this.wineFundamentalId;
    data['image'] = this.image;
    data['title'] = this.title;
    data['wineFundamental'] = this.wineFundamental;
    return data;
  }
}