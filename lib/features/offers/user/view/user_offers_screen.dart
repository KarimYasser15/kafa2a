import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/features/offers/user/view/widgets/offer_item_widget.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';

class UserOffersScreen extends StatelessWidget {
  const UserOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).offers,
          ),
        ),
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  side: BorderSide(color: Colors.red, width: 1.2.w))),
          onPressed: () {},
          child: Text(
            AppLocalizations.of(context).cancelRequest,
            style: TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        body: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: OfferItemWidget(),
          ),
          itemCount: 40,
        ));
  }
}
