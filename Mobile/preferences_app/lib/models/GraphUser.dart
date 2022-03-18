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
}
