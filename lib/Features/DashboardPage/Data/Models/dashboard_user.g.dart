// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DashboardUserAdapter extends TypeAdapter<DashboardUser> {
  @override
  final int typeId = 13;

  @override
  DashboardUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DashboardUser(
      authId: fields[0] as String,
      name: fields[1] as String,
      email: fields[2] as String,
      address: fields[3] as String,
      role: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DashboardUser obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.authId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.role);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
