// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DashboardProductAdapter extends TypeAdapter<DashboardProduct> {
  @override
  final int typeId = 10;

  @override
  DashboardProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DashboardProduct(
      id: fields[0] as int,
      url: fields[1] as String,
      description: fields[2] as String,
      price: fields[3] as double,
      location: fields[4] as String,
      name: fields[5] as String,
      cat: fields[6] as String,
      quantity: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DashboardProduct obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.cat)
      ..writeByte(7)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
