import 'billing_details.dart';
import 'metadata.dart';
import 'us_bank_account.dart';

class PaymentIntentModel {
  String? id;
  String? object;
  String? allowRedisplay;
  BillingDetails? billingDetails;
  int? created;
  dynamic customer;
  bool? livemode;
  Metadata? metadata;
  String? type;
  UsBankAccount? usBankAccount;

  PaymentIntentModel({
    this.id,
    this.object,
    this.allowRedisplay,
    this.billingDetails,
    this.created,
    this.customer,
    this.livemode,
    this.metadata,
    this.type,
    this.usBankAccount,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      allowRedisplay: json['allow_redisplay'] as String?,
      billingDetails:
          json['billing_details'] == null
              ? null
              : BillingDetails.fromJson(
                json['billing_details'] as Map<String, dynamic>,
              ),
      created: json['created'] as int?,
      customer: json['customer'] as dynamic,
      livemode: json['livemode'] as bool?,
      metadata:
          json['metadata'] == null
              ? null
              : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      type: json['type'] as String?,
      usBankAccount:
          json['us_bank_account'] == null
              ? null
              : UsBankAccount.fromJson(
                json['us_bank_account'] as Map<String, dynamic>,
              ),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'object': object,
    'allow_redisplay': allowRedisplay,
    'billing_details': billingDetails?.toJson(),
    'created': created,
    'customer': customer,
    'livemode': livemode,
    'metadata': metadata?.toJson(),
    'type': type,
    'us_bank_account': usBankAccount?.toJson(),
  };
}
