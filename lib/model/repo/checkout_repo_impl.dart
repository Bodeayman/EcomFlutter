import 'package:dartz/dartz.dart';
import 'package:ecomflutter/model/payment_intent_input_model.dart';
import 'package:ecomflutter/model/repo/checkout_repo.dart';
import 'package:ecomflutter/utils/stripe_service.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentInput,
  }) async {
    try {
      await stripeService.makePayment(InputModel: paymentInput);
      return right(null);
    } catch (e) {
      return left(ServiceFailure(errMessage: e.toString()));
    }
  }
}
