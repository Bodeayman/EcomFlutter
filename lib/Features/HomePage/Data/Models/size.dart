import 'package:hive/hive.dart';

part 'size.g.dart';

@HiveType(typeId: 2)
class CustomerSize extends HiveObject {
  @HiveField(0)
  final String size;

  @HiveField(1)
  final int productId;

  CustomerSize({required this.size, required this.productId});
}
