import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/colors_manager.dart';
import 'package:kafa2a/config/strings_manager.dart';
import 'package:kafa2a/core/di/service_locator.dart';
import 'package:kafa2a/core/widgets/loading_indicator.dart';
import 'package:kafa2a/features/requests/user/presentation/cubit/user_requests_cubit.dart';
import 'package:kafa2a/features/requests/user/presentation/cubit/user_requests_states.dart';
import 'package:kafa2a/features/requests/user/presentation/screens/widgets/request_item_widget.dart';

class UserRequestsScreen extends StatelessWidget {
  const UserRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<UserRequestsCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringsManager.myRequests),
          actionsPadding: EdgeInsets.only(right: 20.w),
          actions: [
            PopupMenuButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  side: BorderSide(color: ColorsManager.blue)),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    children: [Text(StringsManager.open)],
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: Row(
                    children: [Text(StringsManager.accepted)],
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: Row(
                    children: [Text(StringsManager.completed)],
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: Row(
                    children: [Text(StringsManager.cancelled)],
                  ),
                  onTap: () {},
                )
              ],
              child: Row(
                children: [
                  Icon(
                    Icons.filter_alt_rounded,
                    color: Colors.black,
                  ),
                  Text(StringsManager.filter)
                ],
              ),
            )
          ],
        ),
        body: BlocBuilder<UserRequestsCubit, UserRequestsStates>(
          builder: (context, state) {
            if (state is UserPendingRequestsLoading) {
              return LoadingIndicator();
            } else if (state is UserPendingRequestsError) {
              return Center(child: Text(state.error));
            } else if (state is UserPendingRequestsSuccess) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 10.h),
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: RequestItemWidget(
                            pendingRequests: state.pendingRequests[index]),
                      ),
                      itemCount: state.pendingRequests.length,
                    ),
                  ),
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
