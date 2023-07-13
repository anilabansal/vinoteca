



import 'package:vinoteca_app/modal/home/all_wines_list_modal.dart';

class RegionListModel {
  int? response;
  String? token;
  String? errorMessage;

  List<ListData>? listData;
  List<String>? regionNameList;

  RegionListModel(
      {this.response, this.token, this.errorMessage, this.listData});

  RegionListModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    token = json['token'];
    errorMessage = json['errorMessage'];
    if (json['listData'] != null) {
      listData = <ListData>[];
      regionNameList=<String>[];
      json['listData'].forEach((v) {
        listData!.add(new ListData.fromJson(v));
        regionNameList!.add(v['regionName']);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['token'] = this.token;
    data['errorMessage'] = this.errorMessage;
    if (this.listData != null) {
      data['listData'] = this.listData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListData {
  int? regionId;
  String? regionName;
  String? location;
  double? ratings;
  String? createdOn;
  String? image;
  List<WineData>? winesMaster;

  ListData(
      {this.regionId,
        this.regionName,
        this.location,
        this.ratings,
        this.createdOn,
        this.image,
        this.winesMaster});

  ListData.fromJson(Map<String, dynamic> json) {
    regionId = json['regionId'];
    regionName = json['regionName'];
    location = json['location'];
    ratings = json['ratings'];
    createdOn = json['createdOn'];
    image = json['image'];
    if (json['winesMaster'] != null) {
      winesMaster = <WineData>[];
      json['winesMaster'].forEach((v) {
        winesMaster!.add(new WineData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regionId'] = this.regionId;
    data['regionName'] = this.regionName;
    data['location'] = this.location;
    data['ratings'] = this.ratings;
    data['createdOn'] = this.createdOn;
    data['image'] = this.image;
    if (this.winesMaster != null) {
      data['winesMaster'] = this.winesMaster!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}