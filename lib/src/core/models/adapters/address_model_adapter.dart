import 'package:paipfood_package/paipfood_package.dart';
import 'package:paipfood_package/src/core/models/address_geoapify_model.dart';

class AddressModelAdapter {
  static AddressModel geoapify(AddressGeoapfyModel model) {
    return AddressModel(
      lat: model.lat,
      lon: model.lon,
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
