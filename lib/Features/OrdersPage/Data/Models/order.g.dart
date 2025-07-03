// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderModelAdapter extends TypeAdapter<OrderModel> {
  @override
  final int typeId = 4;

  @override
  OrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModel(
      id: fields[0] as int,
      address: fields[1] as String,
      orderConfirmed: fields[2] as DateTime,
      orderShipped: fields[3] as DateTime,
      shippedDate: fields[4] as DateTime,
      deliveryDate: fields[5] as DateTime,
      products: (fields[6] as List).cast<OrderItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, OrderModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.orderConfirmed)
      ..writeByte(3)
      ..write(obj.orderShipped)
      ..writeByte(4)
      ..write(obj.shippedDate)
      ..writeByte(5)
      ..write(obj.deliveryDate)
      ..writeByte(6)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
