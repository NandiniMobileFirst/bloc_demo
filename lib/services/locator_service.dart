
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'package:bloc_demo/repo/products_repo.dart';

final GetIt locator = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  locator.registerLazySingleton<ProductsRepo>(() => ProductsRepo());
}
