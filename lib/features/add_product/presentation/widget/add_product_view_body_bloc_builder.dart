import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/build_error_bar.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/widget/add_product_view_body.dart';

class AddProductsViewBodyBlocBuilder extends StatelessWidget {
  const AddProductsViewBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccessState) {
          buildBar(context, 'Product added successfully');
        }
        if (state is AddProductErrorState) {
          buildBar(context, state.failure);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddProductLoadingState,
          child: const AddProductViewBody(),
        );
      },
    );
  }
}
