// To parse this JSON data, do
//
//     final graphUser = graphUserFromMap(jsonString);

import 'dart:convert';

class GraphUser {
  GraphUser({
    required this.odataContext,
    required this.businessPhones,
    required this.displayName,
    required this.givenName,
    this.jobTitle,
    required this.mail,
    this.mobilePhone,
    this.officeLocation,
    this.preferredLanguage,
    required this.surname,
    required this.userPrincipalName,
    required this.id,
  });

  String odataContext;
  List<String> businessPhones;
  String displayName;
  String givenName;
  dynamic jobTitle;
  String mail;
  dynamic mobilePhone;
  dynamic officeLocation;
  dynamic preferredLanguage;
  String surname;
  String userPrincipalName;
  String id;

  factory GraphUser.fromJson(String str) => GraphUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GraphUser.fromMap(Map<String, dynamic> json) => GraphUser(
        odataContext: json["@odata.context"],
        businessPhones: List<String>.from(json["businessPhones"].map((x) => x)),
        displayName: json["displayName"],
        givenName: json["givenName"],
        jobTitle: json["jobTitle"],
        mail: json["mail"],
        mobilePhone: json["mobilePhone"],
        officeLocation: json["officeLocation"],
        preferredLanguage: json["preferredLanguage"],
        surname: json["surname"],
        userPrincipalName: json["userPrincipalName"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "@odata.context": odataContext,
        "businessPhones": List<dynamic>.from(businessPhones.map((x) => x)),
        "displayName": displayName,
        "givenName": givenName,
        "jobTitle": jobTitle,
        "mail": mail,
        "mobilePhone": mobilePhone,
        "officeLocation": officeLocation,
        "preferredLanguage": preferredLanguage,
        "surname": surname,
        "userPrincipalName": userPrincipalName,
        "id": id,
      };
}
