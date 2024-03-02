import 'package:paipfood_package/paipfood_package.dart';
import 'package:paipfood_package/src/core/models/opening_hours_model.dart';

abstract interface class IOpeningHoursRepository {
  Future<List<OpeningHoursModel>> getByEstablishmentId(String id, {bool? visible});
  Future<List<OpeningHoursModel>> upsert({required List<OpeningHoursModel> openingHours, required AuthModel auth});
  Future<void> delete({required String id, required AuthModel auth, bool isDeleted});
}
