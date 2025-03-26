import 'package:bloc/bloc.dart';
import 'package:ecomflutter/model/payment_intent_input_model.dart';
import 'package:ecomflutter/model/repo/checkout_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.checkoutRepo) : super(StripePaymentInitial());
  final CheckoutRepo checkoutRepo;
  Future makePayment({
    required PaymentIntentInputModel paymentIntentmodel,
  }) async {
    emit(StripePaymentLoading());
    var data = await checkoutRepo.makePayment(paymentInput: paymentIntentmodel);
    data.fold(
      (l) => emit(StripePaymentFailure(l.errMessage)),
      (r) => emit(StripePaymentSuccess()),
    );
  }

  @override
  void onChange(Change<StripePaymentState> change) {
    debugPrint(change.toString());
    super.onChange(change);
  }
}
