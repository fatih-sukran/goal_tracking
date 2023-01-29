// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoalStatusAdapter extends TypeAdapter<GoalStatus> {
  @override
  final int typeId = 1;

  @override
  GoalStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GoalStatus.skip;
      case 1:
        return GoalStatus.done;
      case 2:
        return GoalStatus.fail;
      default:
        return GoalStatus.skip;
    }
  }

  @override
  void write(BinaryWriter writer, GoalStatus obj) {
    switch (obj) {
      case GoalStatus.skip:
        writer.writeByte(0);
        break;
      case GoalStatus.done:
        writer.writeByte(1);
        break;
      case GoalStatus.fail:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoalStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
