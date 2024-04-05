import 'package:bloc_demo/repo/products_repo.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<ProductsRepo>(() => ProductsRepo());
}