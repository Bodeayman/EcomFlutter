import 'networks.dart';
import 'status_details.dart';

class UsBankAccount {
  String? accountHolderType;
  String? accountType;
  String? bankName;
  dynamic financialConnectionsAccount;
  String? fingerprint;
  String? last4;
  Networks? networks;
  String? routingNumber;
  StatusDetails? statusDetails;

  UsBankAccount({
    this.accountHolderType,
    this.accountType,
    this.bankName,
    this.financialConnectionsAccount,
    this.fingerprint,
    this.last4,
    this.networks,
    this.routingNumber,
    this.statusDetails,
  });

  factory UsBankAccount.fromJson(Map<String, dynamic> json) => UsBankAccount(
    accountHolderType: json['account_holder_type'] as String?,
    accountType: json['account_type'] as String?,
    bankName: json['bank_name'] as String?,
    financialConnectionsAccount:
        json['financial_connections_account'] as dynamic,
    fingerprint: json['fingerprint'] as String?,
    last4: json['last4'] as String?,
    networks:
        json['networks'] == null
            ? null
            : Networks.fromJson(json['networks'] as Map<String, dynamic>),
    routingNumber: json['routing_number'] as String?,
    statusDetails:
        json['status_details'] == null
            ? null
            : StatusDetails.fromJson(
              json['status_details'] as Map<String, dynamic>,
            ),
  );

  Map<String, dynamic> toJson() => {
    'account_holder_type': accountHolderType,
    'account_type': accountType,
    'bank_name': bankName,
    'financial_connections_account': financialConnectionsAccount,
    'fingerprint': fingerprint,
    'last4': last4,
    'networks': networks?.toJson(),
    'routing_number': routingNumber,
    'status_details': statusDetails?.toJson(),
  };
}
