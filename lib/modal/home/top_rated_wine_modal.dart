



class TopRatedWineRegion {
  int? response;
  Null? token;
  Null? errorMessage;
  Data? data;
  Null? listData;

  TopRatedWineRegion(
      {this.response, this.token, this.errorMessage, this.data, this.listData});

  TopRatedWineRegion.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    token = json['token'];
    errorMessage = json['errorMessage'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    listData = json['listData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['token'] = this.token;
    data['errorMessage'] = this.errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['listData'] = this.listData;
    return data;
  }
}

class Data {
  List<TopWinelist>? topWinelist;
  List<Null>? topRegionList;

  Data({this.topWinelist, this.topRegionList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['topWinelist'] != null) {
      topWinelist = <TopWinelist>[];
      json['topWinelist'].forEach((v) {
        topWinelist!.add(new TopWinelist.fromJson(v));
      });
    }
    // if (json['topRegionList'] != null) {
    //   topRegionList = <Null>[];
    //   json['topRegionList'].forEach((v) {
    //     topRegionList!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topWinelist != null) {
      data['topWinelist'] = this.topWinelist!.map((v) => v.toJson()).toList();
    }
    // if (this.topRegionList != null) {
    //   data['topRegionList'] =
    //       this.topRegionList!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class TopWinelist {
  int? wineId;
  String? wineName;
  String? description;
  String? createdOn;
  String? price;
  int? category;
  String? quantity;
  int? regionid;
  int? venderId;
  String? qrcode;
  Null? categoryNavigation;
  Null? region;
  Null? vender;
  List<Null>? cart;
  List<Null>? favroiteWines;
  List<Ratings>? ratings;
  List<Null>? tourWines;
  List<Null>? wineFlavours;
  List<Null>? wineFoodPairing;
  List<WineImages>? wineImages;

  TopWinelist(
      {this.wineId,
        this.wineName,
        this.description,
        this.createdOn,
        this.price,
        this.category,
        this.quantity,
        this.regionid,
        this.venderId,
        this.qrcode,
        this.categoryNavigation,
        this.region,
        this.vender,
        this.cart,
        this.favroiteWines,
        this.ratings,
        this.tourWines,
        this.wineFlavours,
        this.wineFoodPairing,
        this.wineImages});

  TopWinelist.fromJson(Map<String, dynamic> json) {
    wineId = json['wineId'];
    wineName = json['wineName'];
    description = json['description'];
    createdOn = json['createdOn'];
    price = json['price'];
    category = json['category'];
    quantity = json['quantity'];
    regionid = json['regionid'];
    venderId = json['venderId'];
    qrcode = json['qrcode'];
    categoryNavigation = json['categoryNavigation'];
    region = json['region'];
    vender = json['vender'];
    // if (json['cart'] != null) {
    //   cart = <Null>[];
    //   json['cart'].forEach((v) {
    //     cart!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['favroiteWines'] != null) {
    //   favroiteWines = <Null>[];
    //   json['favroiteWines'].forEach((v) {
    //     favroiteWines!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['ratings'] != null) {
      ratings = <Ratings>[];
      json['ratings'].forEach((v) {
        ratings!.add(new Ratings.fromJson(v));
      });
    }
    // if (json['tourWines'] != null) {
    //   tourWines = <Null>[];
    //   json['tourWines'].forEach((v) {
    //     tourWines!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['wineFlavours'] != null) {
    //   wineFlavours = <Null>[];
    //   json['wineFlavours'].forEach((v) {
    //     wineFlavours!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['wineFoodPairing'] != null) {
    //   wineFoodPairing = <Null>[];
    //   json['wineFoodPairing'].forEach((v) {
    //     wineFoodPairing!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['wineImages'] != null) {
      wineImages = <WineImages>[];
      json['wineImages'].forEach((v) {
        wineImages!.add(new WineImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wineId'] = this.wineId;
    data['wineName'] = this.wineName;
    data['description'] = this.description;
    data['createdOn'] = this.createdOn;
    data['price'] = this.price;
    data['category'] = this.category;
    data['quantity'] = this.quantity;
    data['regionid'] = this.regionid;
    data['venderId'] = this.venderId;
    data['qrcode'] = this.qrcode;
    data['categoryNavigation'] = this.categoryNavigation;
    data['region'] = this.region;
    data['vender'] = this.vender;
    // if (this.cart != null) {
    //   data['cart'] = this.cart!.map((v) => v.toJson()).toList();
    // }
    // if (this.favroiteWines != null) {
    //   data['favroiteWines'] =
    //       this.favroiteWines!.map((v) => v.toJson()).toList();
    // }
    if (this.ratings != null) {
      data['ratings'] = this.ratings!.map((v) => v.toJson()).toList();
    }
    // if (this.tourWines != null) {
    //   data['tourWines'] = this.tourWines!.map((v) => v.toJson()).toList();
    // }
    // if (this.wineFlavours != null) {
    //   data['wineFlavours'] = this.wineFlavours!.map((v) => v.toJson()).toList();
    // }
    // if (this.wineFoodPairing != null) {
    //   data['wineFoodPairing'] =
    //       this.wineFoodPairing!.map((v) => v.toJson()).toList();
    // }
    if (this.wineImages != null) {
      data['wineImages'] = this.wineImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ratings {
  int? id;
  int? wineId;
  int? userId;
  double? ratings1;
  String? review;
  String? creaedOn;
  Null? user;

  Ratings(
      {this.id,
        this.wineId,
        this.userId,
        this.ratings1,
        this.review,
        this.creaedOn,
        this.user});

  Ratings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wineId = json['wineId'];
    userId = json['userId'];
    ratings1 = json['ratings1'];
    review = json['review'];
    creaedOn = json['creaedOn'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wineId'] = this.wineId;
    data['userId'] = this.userId;
    data['ratings1'] = this.ratings1;
    data['review'] = this.review;
    data['creaedOn'] = this.creaedOn;
    data['user'] = this.user;
    return data;
  }
}

class WineImages {
  int? id;
  int? wineId;
  String? wineImages1;
  String? creatdOn;

  WineImages({this.id, this.wineId, this.wineImages1, this.creatdOn});

  WineImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wineId = json['wineId'];
    wineImages1 = json['wineImages1'];
    creatdOn = json['creatdOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wineId'] = this.wineId;
    data['wineImages1'] = this.wineImages1;
    data['creatdOn'] = this.creatdOn;
    return data;
  }
}
