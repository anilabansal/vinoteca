


class LoginModal {
  int? response;
  String? token;
  String? errorMessage;
  Data? data;


  LoginModal(
      {this.response, this.token, this.errorMessage, this.data});

  LoginModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    token = json['token'];
    errorMessage = json['errorMessage'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['response'] = this.response;
    data['token'] = this.token;
    data['errorMessage'] = this.errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }

    return data;
  }
}

class Data {
  //LoginDetail? usermodel;
  LoginDetail? loginModel;

  //Data({this.usermodel, this.loginModel});
  Data({this.loginModel});

  Data.fromJson(Map<String, dynamic> json) {

    if(json.containsKey("usermodel") && json['usermodel']!=null ){
      loginModel=LoginDetail.fromJson(json['usermodel']);
    }else if(json.containsKey("loginModel") && json['loginModel']!=null){
      loginModel=LoginDetail.fromJson(json['loginModel']);
    }
    // usermodel = json['usermodel'] != null
    //     ? LoginDetail.fromJson(json['usermodel'])
    //     : null;
    // loginModel = json['loginModel'] != null
    //     ? LoginDetail.fromJson(json['loginModel'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();

    if (this.loginModel != null) {
      data['usermodel'] = this.loginModel!.toJson();
    }
    if (this.loginModel != null) {
      data['loginModel'] = this.loginModel!.toJson();
    }
    return data;
  }
}

class LoginDetail {
  int? userId;
  String? email;
  String? profilePic;
  String? password;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? confirmPassword;
  bool? termAndConditions;
  bool? isActive;
  bool? isDeleted;
  String? createdOn;
  String? authorizationId;
  String? mode;
  String? deviceToken;
  String? deviceType;
  String? bithday;
  String? birthmonth;
  int? reviewCount;
  String? lastLoginTime;
  double? totalRewardPoints;
  bool? isLoyaltySignUp;

  LoginDetail(
      {this.userId,
        this.email,
        this.profilePic,
        this.password,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.confirmPassword,
        this.termAndConditions,
        this.isActive,
        this.isDeleted,
        this.createdOn,
        this.authorizationId,
        this.mode,
        this.deviceToken,
        this.deviceType,
        this.bithday,
        //this.rewardPoints,
        this.reviewCount,
        this.birthmonth,
        this.lastLoginTime,
        this.isLoyaltySignUp,
        this.totalRewardPoints});

  LoginDetail.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'] ?? "";
    profilePic = json['profilePic'] ?? "";
    password = json['password'];
    firstName = json['firstName'] ?? "";
    lastName = json['lastName'] ?? "";
    phoneNumber = json['phoneNumber'] ?? "";
    confirmPassword = json['confirmPassword'];
    termAndConditions = json['termAndConditions'];
    isActive = json['isActive'];
    isDeleted = json['isDeleted'];
    createdOn = json['createdOn'];
    authorizationId = json['authorizationId'];
    mode = json['mode'];
    deviceToken = json['deviceToken'];
    deviceType = json['deviceType'];
    birthmonth = json['birthMonth'] ?? "";
    bithday = json['birthDay'] ?? "";
    reviewCount=json['reviewCount'] ?? 0;
    totalRewardPoints=json['totalRewardPoints'] ?? 0.0;
    lastLoginTime=json['lastLoginTime'] ?? "";
    isLoyaltySignUp=json['isLoyaltySignUp'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['userId'] = userId;
    data['email'] = this.email;
    data['profilePic'] = this.profilePic;
    data['password'] = this.password;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['confirmPassword'] = this.confirmPassword;
    data['termAndConditions'] = this.termAndConditions;
    data['isActive'] = this.isActive;
    data['reviewCount'] = this.reviewCount;
    data['isDeleted'] = this.isDeleted;
    data['createdOn'] = this.createdOn;
    data['authorizationId'] = this.authorizationId;
    data['mode'] = this.mode;
    data['deviceToken'] = this.deviceToken;
    data['deviceType'] = this.deviceType;
    data['birthDay'] = this.bithday;
    data['birthMonth'] = this.birthmonth;
    data['lastLoginTime'] = this.lastLoginTime;
    data['totalRewardPoints'] = this.totalRewardPoints;
    data['isLoyaltySignUp'] = this.isLoyaltySignUp;
    return data;
  }

}