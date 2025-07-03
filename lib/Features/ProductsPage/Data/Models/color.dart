import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'color.g.dart';

@HiveType(typeId: 1)
class CustomerColor extends HiveObject {
  @HiveField(0)
  int productId;

  @HiveField(1)
  int colorValue;

  @HiveField(2)
  String colorName;

  CustomerColor({
    required this.productId,
    required Color color,
    required this.colorName,
  }) : colorValue = color.value;

  CustomerColor._fromHive({
    required this.productId,
    required this.colorValue,
    required this.colorName,
  });

  Color get color => Color(colorValue);
}
