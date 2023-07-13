



class TourListModal {
  int? response;
  String? errorMessage;
  List<TourListItem>? data;

  TourListModal({this.response, this.errorMessage, this.data});

  TourListModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    errorMessage = json['errorMessage'];
    if (json['data'] != null) {
      data = <TourListItem>[];
      json['data'].forEach((v) {
        data!.add(TourListItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['errorMessage'] = this.errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TourListItem {
  int? id;
  int? regionId;
  String? tourImage;
  String? tourName;
  String? createdOn;
  Null? region;
  int? wineCount;

  TourListItem(
      {this.id,
        this.regionId,
        this.tourImage,
        this.tourName,
        this.createdOn,
        this.region,this.wineCount});

  TourListItem.fromJson(Map<String, dynamic> json) {
    id = json['tourId'];
    regionId = json['regionId'];
    tourImage = json['tourImage'];
    tourName = json['tourName'];
    createdOn = json['createdOn'];
    region = json['region'];
    wineCount = json['wineCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tourId'] = this.id;
    data['regionId'] = this.regionId;
    data['tourImage'] = this.tourImage;
    data['tourName'] = this.tourName;
    data['createdOn'] = this.createdOn;
    data['region'] = this.region;
    data['wineCount']=this.wineCount;
    return data;
  }
}
