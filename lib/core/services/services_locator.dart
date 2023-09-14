import 'package:get_it/get_it.dart';
import 'package:todoapp/core/databse/cashhelper.dart';

final sl = GetIt.instance;
Future<void> setup() async {
  sl.registerLazySingleton<CashHelper>(() => CashHelper());
//   sl.registerSingleton<AppModel>(AppModel());

// // Alternatively you could write it if you don't like global variables
//   GetIt.I.registerSingleton<AppModel>(AppModel());
}
