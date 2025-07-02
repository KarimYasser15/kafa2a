import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/config/routes_manager.dart';
import 'package:kafa2a/core/constants.dart';
import 'package:kafa2a/features/offers/user/data/models/user_offers_response/offers.dart';
import 'package:kafa2a/features/offers/user/presentation/cubit/offers_cubit.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';

class OfferItemWidget extends StatelessWidget {
  const OfferItemWidget({super.key, required this.offer});
  final Offers offer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, RoutesManager.providerProfileDetails),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: ColorsManager.blue,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: Image.network(
                      '${ApiConstants.baseImageUrl}${offer.provider.selfiePath}',
                      width: 70.w,
                      height: 70.w,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.person,
                            size: 100.w, color: Colors.grey);
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return SizedBox(
                          width: 100.w,
                          height: 100.w,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer.provider.name,
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          3,
                          (index) => Icon(Icons.star, color: Colors.amber),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    "${AppLocalizations.of(context).price}: ${offer.price}",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () =>
                        context.read<OffersCubit>().acceptOffer(offer.id),
                    icon: Icon(Icons.check_circle_outline),
                    iconSize: 40,
                    color: Colors.green,
                  ),
                  IconButton(
                    onPressed: () =>
                        context.read<OffersCubit>().rejectOffer(offer.id),
                    icon: Icon(Icons.close),
                    iconSize: 40,
                    color: Colors.red,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
