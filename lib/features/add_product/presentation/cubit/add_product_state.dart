part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}
final class AddProductLoadingState extends AddProductState {}
final class AddProductSuccessState extends AddProductState {}
final class AddProductErrorState extends AddProductState {
  final String failure;
  AddProductErrorState(this.failure);
}
