

class RegionModal {
  int? response;
  String? errorMessage;
  RegionData? data;


  RegionModal(
      {this.response,this.errorMessage, this.data});

  RegionModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    errorMessage = json['errorMessage'];
    data = json['data'] != null ?  RegionData.fromJson(json['data']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['errorMessage'] = this.errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }


    return data;
  }
}

class RegionData {
  RegionDetail? regionDetail;
  List<WineList>? wineList=[];

  RegionData({this.regionDetail});
  // RegionData({this.regionDetail, this.wineList});

  RegionData.fromJson(Map<String, dynamic> json) {
    regionDetail = json['regionDetail'] != null
        ?  RegionDetail.fromJson(json['regionDetail'])
        : null;
    if (json['wineList'] != null) {
      wineList = <WineList>[];
      json['wineList'].forEach((v) {
        wineList!.add(WineList.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.regionDetail != null) {
      data['regionDetail'] = this.regionDetail!.toJson();
    }
    if (this.wineList != null) {
      data['wineList'] = this.wineList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RegionDetail {
  String? regionImage;
  String? regionName;
  String? description;
  double? rating;
  int? ratingCount;

  RegionDetail(
      {this.regionImage,
        this.regionName,
        this.description,
        this.rating,
        this.ratingCount});

  RegionDetail.fromJson(Map<String, dynamic> json) {
    regionImage = json['regionImage'] ??"";
    regionName = json['regionName'] ?? "";
    description = json['description'] ?? "";
    rating = json['rating']??0.0;
    ratingCount = json['ratingCount']??"";

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regionImage'] = this.regionImage;
    data['regionName'] = this.regionName;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['ratingCount'] = this.ratingCount;

    return data;
  }
}

class WineList {
  int? wineId;
  String? wineImage;
  String? wineName;
  String? bannerImage;

  WineList({this.wineId,this.bannerImage, this.wineImage, this.wineName});

  WineList.fromJson(Map<String, dynamic> json) {
    wineId = json['wineId'];
    wineImage = json['wineImage'];
    wineName = json['wineName'];
    bannerImage = json['wineName'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wineId'] = this.wineId;
    data['wineImage'] = this.wineImage;
    data['wineName'] = this.wineName;
    return data;
  }
}