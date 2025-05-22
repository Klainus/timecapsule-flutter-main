import 'package:as_boilerplate_flutter/add_capsule/models/capsule.dart';
import 'package:hive/hive.dart';

class TimeCapsuleAdapter extends TypeAdapter<TimeCapsule> {
  @override
  final int typeId = 0; // Ensure this is unique for each model

  @override
  TimeCapsule read(BinaryReader reader) {
    return TimeCapsule(
      thoughts: reader.readString(),
      goal: reader.readString(),
      revealDate: DateTime.fromMillisecondsSinceEpoch(reader.readInt()),
    );
  }

  @override
  void write(BinaryWriter writer, TimeCapsule obj) {
    writer
      ..writeString(obj.thoughts)
      ..writeString(obj.goal)
      ..writeInt(obj.revealDate.millisecondsSinceEpoch);
  }
}
