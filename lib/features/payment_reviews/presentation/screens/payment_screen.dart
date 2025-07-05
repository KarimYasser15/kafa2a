import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafa2a/core/widgets/ui_utils.dart';
import 'package:kafa2a/features/payment_reviews/data/models/payment_request.dart';
import 'package:kafa2a/features/payment_reviews/presentation/cubit/payment_cubit.dart';
import 'package:kafa2a/features/payment_reviews/presentation/cubit/payment_states.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _amountController = TextEditingController();
  String _selectedGateway = 'cash';

  void _setPaymentMethod(String method) {
    setState(() {
      _selectedGateway = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).payment),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).enterAmount,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedGateway == 'cash'
                          ? Colors.green
                          : Colors.grey,
                    ),
                    onPressed: () => _setPaymentMethod('cash'),
                    child: Text(AppLocalizations.of(context).cash),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedGateway == 'credit'
                          ? Colors.green
                          : Colors.grey,
                    ),
                    onPressed: () => _setPaymentMethod('credit'),
                    child: Text(AppLocalizations.of(context).credit),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            BlocListener<PaymentCubit, PaymentStates>(
              listener: (context, state) {
                if (state is PaymentLoadingState) {
                  UIUtils.showLoading(context);
                } else if (state is PaymentErrorState) {
                  UIUtils.hideLoading(context);
                  UIUtils.showMessage(state.error);
                } else if (state is PaymentSuccessState) {
                  UIUtils.hideLoading(context);
                  UIUtils.showMessage("Success");
                }
              },
              child: ElevatedButton.icon(
                onPressed: () => context.read<PaymentCubit>().payProvider(
                      PaymentRequest(
                        serviceId: 1,
                        userId: 1,
                        providerId: 1,
                        amount: int.parse(_amountController.text),
                        gateway: 'cash',
                      ),
                    ),
                icon: const Icon(Icons.payment),
                label: Text(AppLocalizations.of(context).pay),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
