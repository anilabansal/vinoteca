


class CommonModal {
  int? response;
  String? token;
  String? errorMessage;

  CommonModal(
      {this.response, this.token, this.errorMessage});

  CommonModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    token = json['token'];
    errorMessage = json['errorMessage'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['response'] = this.response;
    data['token'] = this.token;
    data['errorMessage'] = this.errorMessage;


    return data;
  }
}