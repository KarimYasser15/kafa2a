import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/strings_manager.dart';
import 'package:kafa2a/core/di/service_locator.dart';
import 'package:kafa2a/core/widgets/loading_indicator.dart';
import 'package:kafa2a/features/home/provider/presentation/cubit/provider_offers_cubit.dart';
import 'package:kafa2a/features/home/provider/presentation/cubit/provider_offers_states.dart';
import 'package:kafa2a/features/home/provider/presentation/screens/widgets/provider_offer_item_widget.dart';

class ProviderHomeTab extends StatelessWidget {
  const ProviderHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ProviderOffersCubit>(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(StringsManager.home),
          ),
          body: BlocBuilder<ProviderOffersCubit, ProviderOffersStates>(
            builder: (context, state) {
              if (state is GetAllRequestsLoadingState) {
                return LoadingIndicator();
              } else if (state is GetAllRequestsErrorState) {
                return Center(
                  child: Text(state.error),
                );
              } else if (state is GetAllRequestsSuccessState) {
                return Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom: 70.h),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: ProviderOfferItemWidget(
                        request: state.requests[index],
                      ),
                    ),
                    itemCount: state.requests.length,
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          )),
    );
  }
}
