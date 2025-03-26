import 'package:dartz/dartz.dart';
import 'package:ecomflutter/model/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentInput,
  });
}

abstract class Failure {
  final String errMessage;
  Failure({required this.errMessage});
}

class ServiceFailure extends Failure {
  ServiceFailure({required super.errMessage});
}
