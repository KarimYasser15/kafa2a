import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/core/widgets/default_submit_button.dart';
import 'package:kafa2a/features/home/provider/data/models/get_all_requests_response/all_provider_requests.dart';
import 'package:kafa2a/features/home/provider/presentation/cubit/provider_offers_cubit.dart';
import 'package:kafa2a/features/home/provider/presentation/screens/widgets/send_offer_bottom_sheet.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';

class ProviderOfferItemWidget extends StatelessWidget {
  const ProviderOfferItemWidget({super.key, required this.request});
  final AllProviderRequests request;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: ColorsManager.blue,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: ColorsManager.blue,
                      ),
                      Text(
                        "${request.user.name} - ${request.title}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "${AppLocalizations.of(context).price}: ${request.price}",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: ColorsManager.blue,
                      ),
                      Text(
                        AppLocalizations.of(context).service,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Plumber",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Icon(Icons.description, color: ColorsManager.blue),
                      Text(
                        AppLocalizations.of(context).description,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    request.description,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Colors.red,
                      ),
                      Text(
                        AppLocalizations.of(context).location,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    request.address ?? "",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_time_rounded,
                          color: ColorsManager.blue),
                      Text(
                        AppLocalizations.of(context).time,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    request.scheduledAt,
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: DefaultSubmitButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (_) => BlocProvider.value(
                            value: context.read<ProviderOffersCubit>(),
                            child: SendOfferBottomSheet(
                              request: request,
                            ),
                          ));
                },
                label: AppLocalizations.of(context).offer,
              ),
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
