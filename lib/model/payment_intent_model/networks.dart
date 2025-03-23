class Networks {
  String? preferred;
  List<String>? supported;

  Networks({this.preferred, this.supported});

  factory Networks.fromJson(Map<String, dynamic> json) => Networks(
    preferred: json['preferred'] as String?,
    supported: json['supported'] as List<String>?,
  );

  Map<String, dynamic> toJson() => {
    'preferred': preferred,
    'supported': supported,
  };
}
