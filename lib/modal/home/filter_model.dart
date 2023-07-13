


import 'package:vinoteca_app/modal/home/all_wines_list_modal.dart';

class FilterModal {
  int? response;
  String? errorMessage;
  List<WineData>? listData;

  FilterModal({this.response, this.errorMessage, this.listData});

  FilterModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    errorMessage = json['errorMessage'];
    if (json['listData'] != null) {
      listData = <WineData>[];
      json['listData'].forEach((v) {
        listData!.add(WineData.fromJson(v));
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