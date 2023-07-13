

class StoreListModal {
  int? response;
  String? errorMessage;
  List<ListData>? listData;

  StoreListModal({this.response, this.errorMessage, this.listData});

  StoreListModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    errorMessage = json['errorMessage'];
    if (json['listData'] != null) {
      listData = <ListData>[];
      json['listData'].forEach((v) {
        listData!.add(new ListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['errorMessage'] = this.errorMessage;
    if (this.listData != null) {
      data['listData'] = this.listData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListData {
  int? storeId;
  String? storeImage;
  String? storeName;
  Null? openingHours;
  String? mobileNumber;
  String? emailId;
  String? website;
  String? createdOn;
  String? location;

  ListData(
      {this.storeId,
        this.storeImage,
        this.storeName,
        this.openingHours,
        this.mobileNumber,
        this.emailId,
        this.website,
        this.createdOn,
        this.location});

  ListData.fromJson(Map<String, dynamic> json) {
    storeId = json['storeId'];
    storeImage = json['storeImage'];
    storeName = json['storeName'];
    openingHours = json['openingHours'];
    mobileNumber = json['mobileNumber'];
    emailId = json['emailId'];
    website = json['website'];
    createdOn = json['createdOn'];
    location = json['location'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['storeId'] = this.storeId;
    data['storeImage'] = this.storeImage;
    data['storeName'] = this.storeName;
    data['openingHours'] = this.openingHours;
    data['mobileNumber'] = this.mobileNumber;
    data['emailId'] = this.emailId;
    data['website'] = this.website;
    data['createdOn'] = this.createdOn;
    data['location'] = this.location;
    return data;
  }
}
