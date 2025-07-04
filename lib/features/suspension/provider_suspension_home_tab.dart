import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafa2a/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';

class ProviderSuspensionHomeTab extends StatelessWidget {
  const ProviderSuspensionHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).home),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(AppLocalizations.of(context).notActiveYet),
            Text(((context.read<AuthCubit>().provider!.suspendReason) != null)
                ? (context.read<AuthCubit>().provider!.suspendReason).toString()
                : "")
          ]),
        ));
  }
}
