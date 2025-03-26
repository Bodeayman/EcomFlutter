import 'package:ecomflutter/model/payment_intent_input_model.dart';
import 'package:ecomflutter/model/payment_intent_model/payment_intent_model.dart';
import 'package:ecomflutter/utils/api_key.dart';
import 'package:ecomflutter/utils/api_service.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: secretKey,
    );
    PaymentIntentModel tempPaymentIntentModel = PaymentIntentModel.fromJson(
      response.data,
    );
    // Takes the response from the api as json and convert it to the model so you can use it

    return tempPaymentIntentModel;
  }
}

//51
