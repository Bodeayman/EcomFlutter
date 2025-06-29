// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerSizeAdapter extends TypeAdapter<CustomerSize> {
  @override
  final int typeId = 2;

  @override
  CustomerSize read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerSize(
      size: fields[0] as String,
      productId: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerSize obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.size)
      ..writeByte(1)
      ..write(obj.productId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerSizeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
