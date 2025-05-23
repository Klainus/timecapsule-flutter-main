// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeCapsuleAdapter extends TypeAdapter<TimeCapsule> {
  @override
  final int typeId = 0;

  @override
  TimeCapsule read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeCapsule(
      thoughts: fields[0] as String,
      revealDate: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TimeCapsule obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.thoughts)
      ..writeByte(1)
      ..write(obj.revealDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeCapsuleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
