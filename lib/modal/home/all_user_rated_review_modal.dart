


class UserRatedReviewsModal {
  int? response;
  List<DataReview>? data;

  UserRatedReviewsModal({this.response, this.data});

  UserRatedReviewsModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    if (json['data'] != null) {
      data = <DataReview>[];
      json['data'].forEach((v) {
        data!.add(DataReview.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataReview {
  List<WineImages>? wineImages;
  List<String>? wineImagesList;
  String? review;
  double? rating;
  String? ratedOn;
  String? bannerImage;

  DataReview({this.wineImages,this.bannerImage, this.review, this.rating, this.ratedOn});

  DataReview.fromJson(Map<String, dynamic> json) {
    if (json['wineImages'] != null) {
     if(json['wineImages'] is String){
       bannerImage=json['wineImages'];
     }else{
       wineImages = <WineImages>[];
       wineImagesList=[];
       json['wineImages'].forEach((v) {
         wineImages!.add(WineImages.fromJson(v));
         wineImagesList!.add(v['wineImages1']);
         if(wineImages!.isNotEmpty && wineImages!.length<2){
           bannerImage=v['wineImages1'];
         }
       });
     }
    }
    review = json['review'] ?? "";
    rating = json['rating'] ?? 0.0;
    if(json['ratedOn']!=null){
      ratedOn = json['ratedOn'].toString().split("T")[0];
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wineImages != null) {
      data['wineImages'] = this.wineImages!.map((v) => v.toJson()).toList();
    }
    data['review'] = this.review;
    data['rating'] = this.rating;
    data['ratedOn'] = this.ratedOn;
    return data;
  }
}

class WineImages {
  int? id;
  int? wineId;
  String? wineImages1;
  String? creatdOn;
  dynamic? wine;

  WineImages(
      {this.id, this.wineId, this.wineImages1, this.creatdOn, this.wine});

  WineImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wineId = json['wineId'];
    wineImages1 = json['wineImages1'];
    creatdOn = json['creatdOn'];
    wine = json['wine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wineId'] = this.wineId;
    data['wineImages1'] = this.wineImages1;
    data['creatdOn'] = this.creatdOn;
    data['wine'] = this.wine;
    return data;
  }
}
