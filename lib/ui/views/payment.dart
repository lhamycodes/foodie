// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider_architecture/provider_architecture.dart';

import '../../locator.dart';
import '../../models/payment_method.dart';
import '../../viewmodels/application_view_model.dart';
import '../shared/app_colors.dart';
import '../shared/app_styles.dart';
import '../shared/ui_helpers.dart';
import '../widgets/app_button.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/app_text.dart';
import '../widgets/title_text.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = '/app/payment';

  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ApplicationViewModel>.withConsumer(
      viewModelBuilder: () => locator<ApplicationViewModel>(),
      disposeViewModel: false,
      builder: (context, model, child) {
        return AppScaffold(
          title: "Payment 🤑",
          onBackTap: () => model.goBack(),
          child: Container(
            padding: scaffoldPadding,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                        title: "Item Total",
                        text: NumberFormat.currency(
                          symbol: '\$',
                          decimalDigits: 2,
                        ).format(model.cart.sum),
                      ),
                      verticalSpace(15),
                      const TitleText(
                        title: "Delivery Charge",
                        text: "Free",
                      ),
                      const Divider(height: 30),
                      TitleText(
                        title: "Total",
                        text: NumberFormat.currency(
                          symbol: '\$',
                          decimalDigits: 2,
                        ).format(model.cart.sum),
                      ),
                      verticalSpace(30),
                      const AppText.subheading("Payment Method"),
                      verticalSpace(15),
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: model.paymentMethods.length,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          itemBuilder: (cx, i) {
                            PaymentMethod method = model.paymentMethods[i];
                            return ListTile(
                              leading: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFedeef0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  "assets/images/${method.image}",
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              title: Text(
                                method.name,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              subtitle: Text(
                                method.number,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              trailing: Radio(
                                visualDensity: VisualDensity.compact,
                                value: method.name,
                                onChanged: (val) {
                                  model.setSelectedPaymentMethod(val);
                                },
                                groupValue: model.selectedPaymentMethod,
                                activeColor: primaryColor,
                              ),
                            );
                          },
                          separatorBuilder: (_, __) => verticalSpace(15),
                        ),
                      ),
                      verticalSpace(30),
                      const AppText.subheading("Address"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: Platform.isAndroid ? 20 : 40,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      title: "Place Order",
                      onPressed: () => model.to("order.track"),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
