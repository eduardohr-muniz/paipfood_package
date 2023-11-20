import 'dart:convert';

class Geoapify {
  List<AddressGeoapfyModel> results;
  Geoapify({
    required this.results,
  });

  factory Geoapify.fromMap(Map<String, dynamic> map) {
    return Geoapify(
      results: List<AddressGeoapfyModel>.from(map['results'].map<AddressGeoapfyModel>((e) {
        return AddressGeoapfyModel.fromMap(e);
      })),
    );
  }

  factory Geoapify.fromJson(String source) => Geoapify.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AddressGeoapfyModel {
  String name;
  String country;
  String countryCode;
  String region;
  String state;
  String county;
  String city;
  String municipality;
  String postcode;
  String suburb;
  String street;
  double lon;
  double lat;
  String stateCode;
  String formatted;
  String addressLine1;
  String addressLine2;
  AddressGeoapfyModel({
    required this.name,
    required this.country,
    required this.countryCode,
    required this.region,
    required this.state,
    required this.county,
    required this.city,
    required this.municipality,
    required this.postcode,
    required this.suburb,
    required this.street,
    required this.lon,
    required this.lat,
    required this.stateCode,
    required this.formatted,
    required this.addressLine1,
    required this.addressLine2,
  });

  factory AddressGeoapfyModel.fromMap(Map<String, dynamic> map) {
    return AddressGeoapfyModel(
      name: map["name"] ?? "",
      country: map['country'] ?? "",
      countryCode: map['countryCode'] ?? "",
      region: map['region'] ?? "",
      state: map['state'] ?? "",
      county: map['county'] ?? "",
      city: map['city'] ?? "",
      municipality: map['municipality'] ?? "",
      postcode: map['postcode'] ?? "",
      suburb: map['suburb'] ?? "",
      street: map['street'] ?? "",
      lon: map['lon'] ?? 0,
      lat: map['lat'] ?? 0,
      stateCode: map['stateCode'] ?? "",
      formatted: map['formatted'] ?? "",
      addressLine1: map['addrine1'] ?? "",
      addressLine2: map['address_line2'] ?? "",
    );
  }

  factory AddressGeoapfyModel.fromJson(String source) => AddressGeoapfyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(name: $name, country: $country, countryCode: $countryCode, region: $region, state: $state, county: $county, city: $city, municipality: $municipality, postcode: $postcode, suburb: $suburb, street: $street, lon: $lon, lat: $lat, stateCode: $stateCode, formatted: $formatted, addressLine1: $addressLine1, addressLine2: $addressLine2)';
  }
}
