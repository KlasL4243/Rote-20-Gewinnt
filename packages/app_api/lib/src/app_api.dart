import 'package:app_api/app_api.dart';

abstract class AppApi {
  const AppApi();

  Stream<List<AppData>> get getAppData;

  Future<void> saveAppData();

  Future<void> close();
}