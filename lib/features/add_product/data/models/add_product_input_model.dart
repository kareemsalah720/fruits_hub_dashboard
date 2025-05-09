import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;

  AddProductInputModel(
      {required this.name,
      required this.code,
      required this.description,
      required this.price,
      required this.image,
      required this.isFeatured,
      required this.unitAmount,
      required this.expirationsMonths,
      required this.numberOfCalories,
      required this.isOrganic,
      this.imageUrl});

  factory AddProductInputModel.fromEntity(
          AddProductInputEntity addProductInputEntity) =>
      AddProductInputModel(
        name: addProductInputEntity.name,
        code: addProductInputEntity.code,
        description: addProductInputEntity.description,
        price: addProductInputEntity.price,
        image: addProductInputEntity.image,
        isFeatured: addProductInputEntity.isFeatured,
        imageUrl: addProductInputEntity.imageUrl,
        expirationsMonths: addProductInputEntity.expirationsMonths,
        numberOfCalories: addProductInputEntity.numberOfCalories,
        unitAmount: addProductInputEntity.unitAmount,
        isOrganic: addProductInputEntity.isOrganic,
      );

  tojson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic
    };
  }
}
