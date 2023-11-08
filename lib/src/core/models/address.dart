// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Geoapify {
  List<Address> features;
  Geoapify({
    required this.features,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'features': features.map((x) => x.toMap()).toList(),
    };
  }

  factory Geoapify.fromMap(Map<String, dynamic> map) {
    return Geoapify(
      features: List<Address>.from((map['features']).map<Address>((x) => Address.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Geoapify.fromJson(String source) => Geoapify.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Address {
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
  Address({
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'country': country,
      'countryCode': countryCode,
      'region': region,
      'state': state,
      'county': county,
      'city': city,
      'municipality': municipality,
      'postcode': postcode,
      'suburb': suburb,
      'street': street,
      'lon': lon,
      'lat': lat,
      'stateCode': stateCode,
      'formatted': formatted,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      name: map["properties"]["name"] ?? "",
      country: map["properties"]['country'] ?? "",
      countryCode: map["properties"]['countryCode'] ?? "",
      region: map["properties"]['region'] ?? "",
      state: map["properties"]['state'] ?? "",
      county: map["properties"]['county'] ?? "",
      city: map["properties"]['city'] ?? "",
      municipality: map["properties"]['municipality'] ?? "",
      postcode: map["properties"]['postcode'] ?? "",
      suburb: map["properties"]['suburb'] ?? "",
      street: map["properties"]['street'] ?? "",
      lon: map["properties"]['lon'] ?? 0,
      lat: map["properties"]['lat'] ?? 0,
      stateCode: map["properties"]['stateCode'] ?? "",
      formatted: map["properties"]['formatted'] ?? "",
      addressLine1: map["properties"]['addrine1'] ?? "",
      addressLine2: map["properties"]['address_line2'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(name: $name, country: $country, countryCode: $countryCode, region: $region, state: $state, county: $county, city: $city, municipality: $municipality, postcode: $postcode, suburb: $suburb, street: $street, lon: $lon, lat: $lat, stateCode: $stateCode, formatted: $formatted, addressLine1: $addressLine1, addressLine2: $addressLine2)';
  }
}
