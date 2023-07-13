


class TourDetailModal {
  int? response;
  List<TourWines>? listData;

  TourDetailModal({this.response, this.listData});

  TourDetailModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    if (json['listData'] != null) {
      listData = <TourWines>[];
      json['listData'].forEach((v) {
        listData!.add(TourWines.fromJson(v));
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

class TourWines {
  int? wineId;
  String? wineName;
  String? wineImage;
  String? winePrice;
  bool? isRated;

  TourWines({this.wineId, this.wineName, this.wineImage, this.winePrice,this.isRated});

  TourWines.fromJson(Map<String, dynamic> json) {
    wineId = json['wineId'];
    wineName = json['wineName'];
    wineImage = json['wineImage'];
    winePrice = json['winePrice'];
    isRated=json['isRated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wineId'] = this.wineId;
    data['wineName'] = this.wineName;
    data['wineImage'] = this.wineImage;
    data['winePrice'] = this.winePrice;
    data['isRated'] = this.isRated;
    return data;
  }
}
