import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/config/routes_manager.dart';
import 'package:kafa2a/features/my_profile/presentation/cubit/profile_cubit.dart';
import 'package:kafa2a/features/requests/user/data/models/get_all_requests/all_requests.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';

class RequestItemWidget extends StatelessWidget {
  const RequestItemWidget({super.key, required this.pendingRequests});
  final AllRequests pendingRequests;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, RoutesManager.offerUser),
      child: ClipRRect(
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
                    Center(
                        child: Text(
                      "${AppLocalizations.of(context).title} :${pendingRequests.title} ,${AppLocalizations.of(context).price}: ${pendingRequests.price}",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
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
                      context.read<ProfileCubit>().getLanguage() == 'ar'
                          ? pendingRequests.service.nameAr!
                          : pendingRequests.service.nameEn!,
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
                      pendingRequests.description,
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
                      pendingRequests.lat,
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
                      pendingRequests.scheduledAt,
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 30.h,
                color: getStatusColor(pendingRequests.status.toUpperCase()),
                child: Center(
                    child: Text(
                  pendingRequests.status.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color getStatusColor(String status) {
    if (status == 'PENDING') {
      return Color.fromARGB(255, 149, 149, 50);
    }
    if (status == 'ACCEPTED') {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
