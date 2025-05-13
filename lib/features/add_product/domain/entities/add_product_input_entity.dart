import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entities/review_entity.dart';

class AddProductInputEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final bool isOrganic;
  final List<ReviewEntity> reviews;

  AddProductInputEntity(
      {required this.name,
      required this.code,
      required this.description,
      required this.price,
      required this.image,
      required this.isFeatured,
      required this.expirationsMonths,
      required this.numberOfCalories,
      required this.unitAmount,
      required this.reviews,
      this.isOrganic = false,
      this.imageUrl});
}
