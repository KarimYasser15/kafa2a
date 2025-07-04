import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/core/constants.dart';
import 'package:kafa2a/core/di/service_locator.dart';
import 'package:kafa2a/core/widgets/loading_indicator.dart';
import 'package:kafa2a/features/requests/user/presentation/cubit/service_requests_cubit.dart';
import 'package:kafa2a/features/requests/user/presentation/cubit/service_requests_states.dart';
import 'package:kafa2a/features/requests/user/presentation/screens/widgets/service_request_card.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';
import 'package:kafa2a/config/routes_manager.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class UserRequestsScreen extends StatefulWidget {
  const UserRequestsScreen({super.key});

  @override
  State<UserRequestsScreen> createState() => _UserRequestsScreenState();
}

class _UserRequestsScreenState extends State<UserRequestsScreen> {
  String? selectedStatus;

  List<Map<String, String>> getStatusOptions(BuildContext context) => [
        {'key': 'pending', 'label': AppLocalizations.of(context).pending},
        {'key': 'accepted', 'label': AppLocalizations.of(context).accepted},
        {'key': 'cancelled', 'label': AppLocalizations.of(context).cancelled},
        {'key': 'completed', 'label': AppLocalizations.of(context).completed},
        {'key': 'paid', 'label': AppLocalizations.of(context).paid},
      ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<ServiceRequestsCubit>()..getAllServiceRequests(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).myRequests,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          actionsPadding: EdgeInsets.only(right: 20.w),
          actions: [
            PopupMenuButton<String?>(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  side: BorderSide(color: ColorsManager.blue)),
              onSelected: (value) {
                setState(() {
                  selectedStatus = value;
                });
              },
              itemBuilder: (context) => [
                PopupMenuItem<String?>(
                  value: null,
                  child: Text(AppLocalizations.of(context).filter),
                ),
                ...getStatusOptions(context)
                    .map((status) => PopupMenuItem<String?>(
                          value: status['key'],
                          child: Text(status['label']!),
                        )),
              ],
              icon: Icon(Icons.filter_alt_rounded, color: Colors.black),
            )
          ],
        ),
        body: BlocBuilder<ServiceRequestsCubit, ServiceRequestsStates>(
          builder: (context, state) {
            if (state is ServiceRequestsLoadingState) {
              return LoadingIndicator();
            } else if (state is ServiceRequestsErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      size: 64.sp,
                      color: Colors.red,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      state.error,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            } else if (state is ServiceRequestsSuccessState) {
              var requests = state.response.data;
              if (selectedStatus != null) {
                requests =
                    requests.where((r) => r.status == selectedStatus).toList();
              }
              if (requests.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.inbox_rounded,
                        size: 64.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        AppLocalizations.of(context).noRequestsAtTheMoment,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }
              return AnimationLimiter(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 100.h, top: 12.h),
                  itemCount: requests.length,
                  itemBuilder: (context, index) {
                    final request = requests[index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: 40.0,
                        child: FadeInAnimation(
                          child: ServiceRequestCard(
                            request: request,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesManager.requestDetails,
                                arguments: request.id,
                              );
                            },
                            onViewOffers: () {
                              Navigator.pushNamed(
                                context,
                                RoutesManager.allOffers,
                                arguments: request.id,
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
