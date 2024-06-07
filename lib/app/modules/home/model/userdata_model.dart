import 'dart:convert';

class UserData {
  String? email;
  String? name;
  String? role;
  List<String>? favouritePoemsIds;

  UserData({
    this.email,
    this.name,
    this.role,
    this.favouritePoemsIds,
  });

  factory UserData.fromRawJson(String str) =>
      UserData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        email: json["email"],
        name: json["name"],
        role: json["Role"],
        favouritePoemsIds: json["FavouritePoemsIds"] == null
            ? []
            : List<String>.from(json["FavouritePoemsIds"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "Role": role,
        "FavouritePoemsIds": favouritePoemsIds == null
            ? []
            : List<dynamic>.from(favouritePoemsIds!.map((x) => x)),
      };
}
