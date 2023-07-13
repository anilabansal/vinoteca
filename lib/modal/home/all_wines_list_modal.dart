

import 'dart:convert';


class WineListModal {
  int? response;
  String? token;
  String? errorMessage;
  List<WineData>? data;
  //Null? listData;

  WineListModal(
      {this.response, this.token, this.errorMessage, this.data});

  WineListModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    token = json['token'];
    errorMessage = json['errorMessage'];
    if (json['data'] != null) {
      data = <WineData>[];
      json['data'].forEach((v) {
        data!.add(WineData.fromJson(v));
      });
    }

    if (json['listData'] != null) {
      data = <WineData>[];
      json['listData'].forEach((v) {
        data!.add(WineData.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['token'] = this.token;
    data['errorMessage'] = this.errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
   // data['listData'] = this.listData;
    return data;
  }
}

class WineData {
  String? wineName;
  int? wineId;
  String? price;
  String? bannerImage;
  String? category;
  bool? isLike;
  List<WineImages>? wineImages;
  List<String> wineImagesOnly=[];
  List<WineFlavour>? wineFlavour;
  List<WinePairing>? wineFoodPair;
  int? buyQuantity=0;
  int? productTotalPrice=0;
  String? description;
  String? region;
  int? regionId;
  double? avgRating;
  bool? showMore=false;
  int? stock;
  bool? showStock=false;
  bool? isIncreaseQuantity=false;
  List<CommentList>? commentList=[];
  bool? isRated;
  WineData({this.isRated,this.avgRating,this.commentList,this.productTotalPrice,this.showStock,this.wineName,this.category, this.price, this.wineImages,this.isLike,this.bannerImage,this.buyQuantity,this.regionId,this.wineId,this.description,this.stock});

  String getCategory(int catId){
    var cat="";
    switch(catId){
      case 1:
        cat= "Red";
        break;
      case 2:
        cat= "White";
        break;
      case 3:
        cat= "Rose";
        break;
      case 4:
        cat= "Sparkling";
        break;
      case 5:
        cat= "Desset";
        break;
      case 5:
        cat= "Fortified";
        break;
      default:
        cat="";

    }

    return cat;
  }
  WineData.fromJson(Map<String, dynamic> json) {
    wineName = json['wineName'] ?? "";
    wineId=json["wineId"];
    String wp=json['price'] ?? "";
    if(wp.contains("\$")){
      price = wp!="" ?   double.parse(wp.split("\$")[1]).toStringAsFixed(2) :"0.00";
    }else {
      price = wp!="" ?   double.parse(wp).toStringAsFixed(2) :"0.00";
    }
    print(wp);
   // price = json['price']!=null ?  double.parse(json['price']).toStringAsFixed(2) : "0.00";
   //
   // price = json['price'] ?? "";

    if(json.containsKey("category") && json['category']!=null){
      if(json['category'] is int){
        category=getCategory(json['category']);
      }else{
        category=json['category'] ?? "";
      }
    }



    if (json['wineImages'] != null) {
      wineImages = <WineImages>[];
      json['wineImages'].forEach((v) {
        wineImages!.add(WineImages.fromJson(v));
        wineImagesOnly.add(v["wineImages1"]);
        if(wineImages!.isNotEmpty && wineImages!.length>0){
          bannerImage=wineImages![0].wineImages1;
          //wineImagesOnly.add(v["wineImages1"]);
        }
      });


    }
    isRated=json['isRated'] ??false;
    if(json['stock']!=null){
      stock=json['stock'] is String ? int.parse(json['stock']) : json['stock'];
      if(stock==0){
        showStock=true;
      }
    }else{
      stock=0;
      showStock=false;
    }
    if (json['wineImage'] != null) {
      bannerImage=json["wineImage"];
    }

    if (json['wineflover'] != null) {
      wineFlavour = <WineFlavour>[];
      json['wineflover'].forEach((v) {
        wineFlavour!.add(WineFlavour.fromJson(v));
      });
    }

    if (json['winefoodpair'] != null) {
      wineFoodPair = <WinePairing>[];
      json['winefoodpair'].forEach((v) {
        wineFoodPair!.add(WinePairing.fromJson(v));
      });
    }

    if(json.containsKey("description"))
    {
      description=json["description"] ?? "";

    }else if(json.containsKey("wineDescription")){
      description=json["wineDescription"] ?? "";
    }

    isLike=json['isLike'] ?? false;

    if(json.containsKey("region") && json['region']!=null && json['region'] is String){
      region=json['region']??"";
      regionId=json['regionId'] ?? 0;

    }

    if(json.containsKey("buyQuantity")){
      buyQuantity=json["buyQuantity"] ?? 0;
    }
    if (json['commentList'] != null) {
      commentList = <CommentList>[];
      json['commentList'].forEach((v) {
        commentList!.add(new CommentList.fromJson(v));
      });
    }
    avgRating=json["avgRating"] ??0.0;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['wineName'] = this.wineName;
  //   data['price'] = this.price;
  //   data['isLike']=this.isLike;
  //   data['region']=this.region;
  //   if (this.wineImages != null) {
  //     data['wineImages'] = this.wineImages!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wineId'] = this.wineId;
    data['wineName'] = this.wineName;
    data['description'] = this.description;
    data['price'] = this.price;
    if (this.wineImages != null) {
      data['wineImages'] = this.wineImages!.map((v) => v.toJson()).toList();
    }
    data['isLike'] = this.isLike;
    data['buyQuantity'] =this.buyQuantity;
    data['bannerImage'] = this.bannerImage;
    data['regionId'] =this.regionId;
    data['stock'] = this.stock;
    data['isRated'] = this.isRated;
    data["avgRating"] =this.avgRating;
    if (this.commentList != null) {
      data['commentList'] = this.commentList!.map((v) => v.toJson()).toList();
    }
    return data;
  }


  static String encode(List<WineData> wine) => json.encode(
    wine.map<Map<String, dynamic>>((wines){
      return wines.toJson();
    }).toList(),
  );

  static List<WineData> decode(String wine) =>
      (json.decode(wine) as List<dynamic>)
          .map<WineData>((item){
            print(item['bannerImage']);
       return WineData.fromJson(item);
      })
          .toList();
}

class WineImages {
  int? id;
  int? wineId;
  String? wineImages1;
  String? creatdOn;
 // Null? wine;

  WineImages(
      {this.id, this.wineId, this.wineImages1, this.creatdOn});

  WineImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wineId = json['wineId'];
    wineImages1 = json['wineImages1'];
    creatdOn = json['creatdOn'];
  //  wine = json['wine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['wineId'] = this.wineId;
    data['wineImages1'] = this.wineImages1;
    data['creatdOn'] = this.creatdOn;
   // data['wine'] = this.wine;
    return data;
  }
}



class WineFlavour {
  int? id;
  String? flavourIcon;
  String? flavourName;


  WineFlavour(
      {this.id, this.flavourIcon, this.flavourName});

  WineFlavour.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    flavourIcon = json['flavourIcon'];
    flavourName = json['flavourName'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['flavourIcon'] = this.flavourIcon;
    data['flavourName'] = this.flavourName;
    return data;
  }
}




class WinePairing {
  int? id;
  String? foodImage;
  String? foodName;


  WinePairing(
      {this.id, this.foodImage, this.foodName});

  WinePairing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodImage = json['foodImage'];
    foodName = json['foodName'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['foodImage'] = this.foodImage;
    data['foodName'] = this.foodName;
    return data;
  }
}

class CommentList {
  String? userImage;
  String? userName;
  String? email;
  double? rating;
  String? comment;

  CommentList(
      {this.userImage, this.userName, this.email, this.rating, this.comment});

  CommentList.fromJson(Map<String, dynamic> json) {
    userImage = json['userImage']??"";
    userName = json['userName'] ??"";
    email = json['email'] ?? "";
    rating = json['rating'] ??0.0;
    comment = json['comment'] ??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userImage'] = this.userImage;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    return data;
  }
}




