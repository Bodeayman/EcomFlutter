// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerColorAdapter extends TypeAdapter<CustomerColor> {
  @override
  final int typeId = 1;

  @override
  CustomerColor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerColor._fromHive(
      productId: fields[0] as int,
      colorValue: fields[1] as int,
      colorName: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerColor obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.colorValue)
      ..writeByte(2)
      ..write(obj.colorName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerColorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
