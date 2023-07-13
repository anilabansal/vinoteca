
class ProfileModal {
  int? response;
  String? token;
  String? errorMessage;
  ProfileData? data;


  ProfileModal(
      {this.response, this.token, this.errorMessage, this.data});

  ProfileModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    token = json['token'];
    errorMessage = json['errorMessage'];
    data = json['data'] != null ?  ProfileData.fromJson(json['data']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['token'] = this.token;
    data['errorMessage'] = this.errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileData {
  int? userId;
  String? firstName;
  String? lastName;
  String? profilePic;
  String? birthDay;
  String? birthMonth;
  String? phoneNo;
  int? reviewCount;
  bool? isLoyaltySignUp;
  List<Null>? reviewLists;

  ProfileData(
      {this.userId,
        this.firstName,
        this.lastName,
        this.profilePic,
        this.birthDay,
        this.birthMonth,
        this.phoneNo,
        this.isLoyaltySignUp,
        this.reviewLists});

  ProfileData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    profilePic = json['profilePic'];
    birthDay = json['birthDay'];
    birthMonth = json['birthMonth'];
    phoneNo = json['phoneNo'];
    reviewCount=json['reviewCount'];
    isLoyaltySignUp=json['isLoyaltySignUp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['profilePic'] = this.profilePic;
    data['birthDay'] = this.birthDay;
    data['birthMonth'] = this.birthMonth;
    data['phoneNo'] = this.phoneNo;
    data['reviewCount'] = this.reviewCount;
    data['isLoyaltySignUp'] = this.isLoyaltySignUp;
    return data;
  }
}


