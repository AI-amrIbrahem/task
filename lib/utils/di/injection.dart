import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task/utils/network/network_info.dart';


final instance = GetIt.instance;

Future<void> initAppInjection() async{
  instance.registerLazySingleton<NetworkInfoImp>(() => NetworkInfoImp(
      connectionChecker: InternetConnectionChecker()));
}
