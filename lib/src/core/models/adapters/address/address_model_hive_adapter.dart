import 'package:paipfood_package/paipfood_package.dart';

class AddressModelHiveAdapter extends TypeAdapter<AddressModel> {
  @override
  AddressModel read(BinaryReader reader) {
    final id = reader.readString();
    final lat = reader.readDouble();
    final long = reader.readDouble();
    final street = reader.readString();
    final number = reader.readString();
    final neighborhood = reader.readString();
    final complement = reader.readString();
    final zipCode = reader.readString();
    final state = reader.readString();
    final address = reader.readString();
    final city = reader.readString();
    final country = reader.readString();
    final userId = reader.readString();
    final establishmentId = reader.readString();

    return AddressModel(
      id: id,
      lat: lat,
      long: long,
      address: address,
      city: city,
      complement: complement,
      country: country,
      establishmentId: establishmentId,
      neighborhood: neighborhood,
      number: number,
      street: street,
      zipCode: zipCode,
      state: state,
      userId: userId,
    );
  }

  @override
  int get typeId => 2;

  @override
  void write(BinaryWriter writer, AddressModel obj) {
    writer
      ..writeString(obj.id)
      ..writeDouble(obj.lat)
      ..writeDouble(obj.long)
      ..writeString(obj.street)
      ..writeString(obj.number)
      ..writeString(obj.neighborhood)
      ..writeString(obj.complement)
      ..writeString(obj.zipCode)
      ..writeString(obj.state)
      ..writeString(obj.address)
      ..writeString(obj.city)
      ..writeString(obj.country)
      ..writeString(obj.userId ?? '')
      ..writeString(obj.establishmentId ?? '');
  }
}
