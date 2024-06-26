part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoadingState extends ProductsState {}

final class ProductsLoadedState extends ProductsState {
  final List<Product> productsModel;
  const ProductsLoadedState(this.productsModel);
  @override
  List<Object> get props => [productsModel];
}

final class ProductsErrorState extends ProductsState {
  final String errorMessage;
  const ProductsErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
