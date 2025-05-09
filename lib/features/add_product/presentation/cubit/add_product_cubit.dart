import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/images/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/products/products_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
      : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoadingState());
    var result = await imagesRepo.uploadImage(addProductInputEntity.image);
    result.fold(
      (f) {
        debugPrint('🔥 Errorrrrrrrr: ${f.message}');
        emit(

          AddProductErrorState(f.message),
        );
      },
      (url) async {
        addProductInputEntity.imageUrl = url;
        var result = await productsRepo.addProduct(addProductInputEntity);
        result.fold(
          (f) {
             debugPrint('🔥 Errorrrrrrr: ${f.message}');
            emit(
              AddProductErrorState(f.message),
            );
          },
          (r) {
            emit(AddProductSuccessState());
          },
        );
      },
    );
  }
}