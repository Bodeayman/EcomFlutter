// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DashboardOrderAdapter extends TypeAdapter<DashboardOrder> {
  @override
  final int typeId = 11;

  @override
  DashboardOrder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DashboardOrder(
      id: fields[0] as int,
      address: fields[1] as String,
      userId: fields[2] as String,
      status: fields[3] as String,
      shippedDate: fields[4] as DateTime?,
      deliveryDate: fields[5] as DateTime?,
      orderConfirmed: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, DashboardOrder obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.shippedDate)
      ..writeByte(5)
      ..write(obj.deliveryDate)
      ..writeByte(6)
      ..write(obj.orderConfirmed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardOrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DashboardOrderItemAdapter extends TypeAdapter<DashboardOrderItem> {
  @override
  final int typeId = 15;

  @override
  DashboardOrderItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DashboardOrderItem(
      id: fields[0] as String,
      orderId: fields[1] as String,
      itemId: fields[2] as String,
      quantity: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DashboardOrderItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.orderId)
      ..writeByte(2)
      ..write(obj.itemId)
      ..writeByte(3)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardOrderItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
