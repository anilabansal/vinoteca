


class AddressModal {
  int? response;
  AddressData? data;

  AddressModal({this.response, this.data});

  AddressModal.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    data = json['data'] != null ? AddressData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AddressData {
  BillingAddress? billingAddress;
  BillingAddress? shippingAddress;

  AddressData({this.billingAddress, this.shippingAddress});

  AddressData.fromJson(Map<String, dynamic> json) {
    billingAddress = json['billingAddress'] != null
        ?  BillingAddress.fromJson(json['billingAddress'])
        : null;
    shippingAddress = json['shippingAddress'] != null
        ?  BillingAddress.fromJson(json['shippingAddress'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.billingAddress != null) {
      data['billingAddress'] = this.billingAddress!.toJson();
    }
    if (this.shippingAddress != null) {
      data['shippingAddress'] = this.shippingAddress!.toJson();
    }
    return data;
  }
}

class BillingAddress {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? streetAddress;
  String? apartmentAddress;
  String? suiteNumber;
  String? zipCode;
  String? city;
  String? state;
  String? country;

  BillingAddress(
      {this.firstName,
        this.lastName,
        this.phoneNumber,
        this.streetAddress,
        this.apartmentAddress,
        this.suiteNumber,
        this.zipCode,
        this.city,
        this.state,
        this.country});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    streetAddress = json['streetAddress'];

    if(json.containsKey("apartmentAddress")){

      apartmentAddress = json['apartmentAddress'];

    }else if(json.containsKey("apartment")){

      apartmentAddress = json['apartment'];
    }

    suiteNumber = json['suiteNumber'];
    zipCode = json['zipCode'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['streetAddress'] = this.streetAddress;
    data['apartment'] = this.apartmentAddress;
    data['suiteNumber'] = this.suiteNumber;
    data['zipCode'] = this.zipCode;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    return data;
  }
}
