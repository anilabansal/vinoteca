

class StoreDetailModal {
  int? response;
  String? token;
  String? errorMessage;
  Data? data;
 // Null? listData;

  StoreDetailModal(
      {this.response, this.token, this.errorMessage, this.data});

  StoreDetailModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    token = json['token'];
    errorMessage = json['errorMessage'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    //listData = json['listData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['response'] = this.response;
    data['token'] = this.token;
    data['errorMessage'] = this.errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
   // data['listData'] = this.listData;
    return data;
  }
}

class Data {
  int? storeId;
  String? storeImage;
  String? storeName;
 // String? openingHours;
  List<OpeningHours>? openingHours;
  String? mobileNumber;
  String? emailId;
  String? website;
  String? createdOn;
  String? location;

  Data(
      { this.storeId,
        this.storeImage,
        this.storeName,
        this.openingHours,
        this.mobileNumber,
        this.emailId,
        this.website,
        this.createdOn,
        this.location});

  Data.fromJson(Map<String, dynamic> json) {
    storeId = json['storeId'];
    storeImage = json['storeImage'] ?? "";
    storeName = json['storeName'] ?? "";
    //openingHours = json['openingHours'] ?? "";
    if (json['openingHours'] != null) {
      openingHours = <OpeningHours>[];
      json['openingHours'].forEach((v) {
        openingHours!.add(OpeningHours.fromJson(v));
      });
    }
    mobileNumber = json['mobileNumber'] ?? "";
    emailId = json['emailId'] ?? "";
    website = json['website'] ?? "";
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
    if (this.openingHours != null) {
      data['openingHours'] = this.openingHours!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OpeningHours {
  int? id;
  int? storeId;
  String? day;
  String? openingTime;
  String? closingTime;
  String? createdOn;
  String? store;

  OpeningHours(
      {this.id,
        this.storeId,
        this.day,
        this.openingTime,
        this.closingTime,
        this.createdOn,
        this.store});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['storeId'];
    day = json['day'];
    openingTime = json['openingTime'];
    closingTime = json['closingTime'];
    createdOn = json['createdOn'];
    store = json['store'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['storeId'] = this.storeId;
    data['day'] = this.day;
    data['openingTime'] = this.openingTime;
    data['closingTime'] = this.closingTime;
    data['createdOn'] = this.createdOn;
    data['store'] = this.store;
    return data;
  }
}
