import 'dart:convert';

class SettingModel {
  int? id;
  String? nameAr;
  String? nameEn;
  dynamic email;
  dynamic email2;
  dynamic phone;
  dynamic phone2;
  dynamic whatsapp;
  dynamic address;
  dynamic address2;
  dynamic location;
  dynamic taxNum;
  dynamic commercialNum;
  String? vat;
  String? serviceFee;
  dynamic currency;
  dynamic facebook;
  dynamic twitter;
  dynamic youtube;
  dynamic linkedin;
  dynamic instagram;
  dynamic snapchat;
  dynamic keywordsAr;
  dynamic keywordsEn;
  dynamic descriptionAr;
  dynamic descriptionEn;
  DateTime? createdAt;
  DateTime? updatedAt;

  SettingModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.email,
    this.email2,
    this.phone,
    this.phone2,
    this.whatsapp,
    this.address,
    this.address2,
    this.location,
    this.taxNum,
    this.commercialNum,
    this.vat,
    this.serviceFee,
    this.currency,
    this.facebook,
    this.twitter,
    this.youtube,
    this.linkedin,
    this.instagram,
    this.snapchat,
    this.keywordsAr,
    this.keywordsEn,
    this.descriptionAr,
    this.descriptionEn,
    this.createdAt,
    this.updatedAt,
  });

  factory SettingModel.fromRawJson(String str) =>
      SettingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        email: json["email"],
        email2: json["email2"],
        phone: json["phone"],
        phone2: json["phone2"],
        whatsapp: json["whatsapp"],
        address: json["address"],
        address2: json["address2"],
        location: json["location"],
        taxNum: json["tax_num"],
        commercialNum: json["commercial_num"],
        vat: json["vat"],
        serviceFee: json["service_fee"],
        currency: json["currency"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        youtube: json["youtube"],
        linkedin: json["linkedin"],
        instagram: json["instagram"],
        snapchat: json["snapchat"],
        keywordsAr: json["keywords_ar"],
        keywordsEn: json["keywords_en"],
        descriptionAr: json["description_ar"],
        descriptionEn: json["description_en"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "email": email,
        "email2": email2,
        "phone": phone,
        "phone2": phone2,
        "whatsapp": whatsapp,
        "address": address,
        "address2": address2,
        "location": location,
        "tax_num": taxNum,
        "commercial_num": commercialNum,
        "vat": vat,
        "service_fee": serviceFee,
        "currency": currency,
        "facebook": facebook,
        "twitter": twitter,
        "youtube": youtube,
        "linkedin": linkedin,
        "instagram": instagram,
        "snapchat": snapchat,
        "keywords_ar": keywordsAr,
        "keywords_en": keywordsEn,
        "description_ar": descriptionAr,
        "description_en": descriptionEn,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
