import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/images/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/products/products_repo.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/widget/add_product_view_body_bloc_builder.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'add-product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'Add Product',
      ),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          getIt.get<ImagesRepo>(),
          getIt.get<ProductsRepo>(),
        ),
        child: AddProductsViewBodyBlocBuilder(),
      ),
    );
  }
}
