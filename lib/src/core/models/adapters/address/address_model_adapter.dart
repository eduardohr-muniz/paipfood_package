import 'package:paipfood_package/paipfood_package.dart';

class AddressModelAdapter {
  static AddressModel geoapify(AddressGeoapfyModel model) {
    return AddressModel(
      id: uuid,
      lat: model.lat,
      long: model.lon,
      address: model.formatted,
      city: model.city,
      country: model.country,
      neighborhood: model.suburb,
      state: model.state,
      street: model.street,
      // zipCode: model.postcode,
    );
  }
}
