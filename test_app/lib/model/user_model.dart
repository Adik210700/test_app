class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final AdressModel address;
  UserModel(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address});
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      email: map['email'],
      address: AdressModel.fromMap(
        map['address'] ?? {},
      ),
    );
  }
}

class AdressModel {
  final String street;
  final String siute;
  final String city;
  final String zipcode;
  final GeoModel get;

  AdressModel({
    required this.street,
    required this.siute,
    required this.city,
    required this.zipcode,
    required this.get,
  });
  factory AdressModel.fromMap(Map<String, dynamic> map) {
    return AdressModel(
      street: map['street'] ?? '',
      siute: map['siute'] ?? '',
      city: map['city'] ?? '',
      zipcode: map['zipcode'] ?? '',
      get: GeoModel.fromMap(
        map['geo'] ?? {},
      ),
    );
  }
}

class GeoModel {
  final String lat;
  final String lng;

  GeoModel({required this.lat, required this.lng});
  factory GeoModel.fromMap(Map<String, dynamic> map) {
    return GeoModel(lat: map['lat'] ?? '', lng: map['lng'] ?? '');
  }
}
