

class SquarePaymentModal {
  Payment? payment;

  SquarePaymentModal({this.payment});

  SquarePaymentModal.fromJson(Map<String, dynamic> json) {
    payment =
    json['payment'] != null ? new Payment.fromJson(json['payment']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payment != null) {
      data['payment'] = this.payment!.toJson();
    }
    return data;
  }
}

class Payment {
  String? id;
  String? createdAt;
  String? updatedAt;
  AmountMoney? amountMoney;
  String? status;
  String? delayDuration;
  String? sourceType;
  CardDetails? cardDetails;
  String? locationId;
  String? orderId;
  List<ProcessingFee>? processingFee;
  AmountMoney? totalMoney;
  AmountMoney? approvedMoney;
  String? receiptNumber;
  String? receiptUrl;
  String? delayAction;
  String? delayedUntil;
  ApplicationDetails? applicationDetails;
  String? versionToken;

  Payment(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.amountMoney,
        this.status,
        this.delayDuration,
        this.sourceType,
        this.cardDetails,
        this.locationId,
        this.orderId,
        this.processingFee,
        this.totalMoney,
        this.approvedMoney,
        this.receiptNumber,
        this.receiptUrl,
        this.delayAction,
        this.delayedUntil,
        this.applicationDetails,
        this.versionToken});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    amountMoney = json['amount_money'] != null
        ? new AmountMoney.fromJson(json['amount_money'])
        : null;
    status = json['status'];
    delayDuration = json['delay_duration'];
    sourceType = json['source_type'];
    cardDetails = json['card_details'] != null
        ? new CardDetails.fromJson(json['card_details'])
        : null;
    locationId = json['location_id'];
    orderId = json['order_id'];
    if (json['processing_fee'] != null) {
      processingFee = <ProcessingFee>[];
      json['processing_fee'].forEach((v) {
        processingFee!.add(new ProcessingFee.fromJson(v));
      });
    }
    totalMoney = json['total_money'] != null
        ? new AmountMoney.fromJson(json['total_money'])
        : null;
    approvedMoney = json['approved_money'] != null
        ? new AmountMoney.fromJson(json['approved_money'])
        : null;
    receiptNumber = json['receipt_number'];
    receiptUrl = json['receipt_url'];
    delayAction = json['delay_action'];
    delayedUntil = json['delayed_until'];
    applicationDetails = json['application_details'] != null
        ? new ApplicationDetails.fromJson(json['application_details'])
        : null;
    versionToken = json['version_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.amountMoney != null) {
      data['amount_money'] = this.amountMoney!.toJson();
    }
    data['status'] = this.status;
    data['delay_duration'] = this.delayDuration;
    data['source_type'] = this.sourceType;
    if (this.cardDetails != null) {
      data['card_details'] = this.cardDetails!.toJson();
    }
    data['location_id'] = this.locationId;
    data['order_id'] = this.orderId;
    if (this.processingFee != null) {
      data['processing_fee'] =
          this.processingFee!.map((v) => v.toJson()).toList();
    }
    if (this.totalMoney != null) {
      data['total_money'] = this.totalMoney!.toJson();
    }
    if (this.approvedMoney != null) {
      data['approved_money'] = this.approvedMoney!.toJson();
    }
    data['receipt_number'] = this.receiptNumber;
    data['receipt_url'] = this.receiptUrl;
    data['delay_action'] = this.delayAction;
    data['delayed_until'] = this.delayedUntil;
    if (this.applicationDetails != null) {
      data['application_details'] = this.applicationDetails!.toJson();
    }
    data['version_token'] = this.versionToken;
    return data;
  }
}

class AmountMoney {
  int? amount;
  String? currency;

  AmountMoney({this.amount, this.currency});

  AmountMoney.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    return data;
  }
}

class CardDetails {
  String? status;
  Card? card;
  String? entryMethod;
  String? cvvStatus;
  String? avsStatus;
  String? statementDescription;
  CardPaymentTimeline? cardPaymentTimeline;

  CardDetails(
      {this.status,
        this.card,
        this.entryMethod,
        this.cvvStatus,
        this.avsStatus,
        this.statementDescription,
        this.cardPaymentTimeline});

  CardDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    card = json['card'] != null ? new Card.fromJson(json['card']) : null;
    entryMethod = json['entry_method'];
    cvvStatus = json['cvv_status'];
    avsStatus = json['avs_status'];
    statementDescription = json['statement_description'];
    cardPaymentTimeline = json['card_payment_timeline'] != null
        ? new CardPaymentTimeline.fromJson(json['card_payment_timeline'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.card != null) {
      data['card'] = this.card!.toJson();
    }
    data['entry_method'] = this.entryMethod;
    data['cvv_status'] = this.cvvStatus;
    data['avs_status'] = this.avsStatus;
    data['statement_description'] = this.statementDescription;
    if (this.cardPaymentTimeline != null) {
      data['card_payment_timeline'] = this.cardPaymentTimeline!.toJson();
    }
    return data;
  }
}

class Card {
  String? cardBrand;
  String? last4;
  int? expMonth;
  int? expYear;
  String? fingerprint;
  String? cardType;
  String? prepaidType;
  String? bin;

  Card(
      {this.cardBrand,
        this.last4,
        this.expMonth,
        this.expYear,
        this.fingerprint,
        this.cardType,
        this.prepaidType,
        this.bin});

  Card.fromJson(Map<String, dynamic> json) {
    cardBrand = json['card_brand'];
    last4 = json['last_4'];
    expMonth = json['exp_month'];
    expYear = json['exp_year'];
    fingerprint = json['fingerprint'];
    cardType = json['card_type'];
    prepaidType = json['prepaid_type'];
    bin = json['bin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['card_brand'] = this.cardBrand;
    data['last_4'] = this.last4;
    data['exp_month'] = this.expMonth;
    data['exp_year'] = this.expYear;
    data['fingerprint'] = this.fingerprint;
    data['card_type'] = this.cardType;
    data['prepaid_type'] = this.prepaidType;
    data['bin'] = this.bin;
    return data;
  }
}

class CardPaymentTimeline {
  String? authorizedAt;
  String? capturedAt;

  CardPaymentTimeline({this.authorizedAt, this.capturedAt});

  CardPaymentTimeline.fromJson(Map<String, dynamic> json) {
    authorizedAt = json['authorized_at'];
    capturedAt = json['captured_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorized_at'] = this.authorizedAt;
    data['captured_at'] = this.capturedAt;
    return data;
  }
}

class ProcessingFee {
  String? effectiveAt;
  String? type;
  AmountMoney? amountMoney;

  ProcessingFee({this.effectiveAt, this.type, this.amountMoney});

  ProcessingFee.fromJson(Map<String, dynamic> json) {
    effectiveAt = json['effective_at'];
    type = json['type'];
    amountMoney = json['amount_money'] != null
        ? new AmountMoney.fromJson(json['amount_money'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['effective_at'] = this.effectiveAt;
    data['type'] = this.type;
    if (this.amountMoney != null) {
      data['amount_money'] = this.amountMoney!.toJson();
    }
    return data;
  }
}

class ApplicationDetails {
  String? squareProduct;
  String? applicationId;

  ApplicationDetails({this.squareProduct, this.applicationId});

  ApplicationDetails.fromJson(Map<String, dynamic> json) {
    squareProduct = json['square_product'];
    applicationId = json['application_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['square_product'] = this.squareProduct;
    data['application_id'] = this.applicationId;
    return data;
  }
}
