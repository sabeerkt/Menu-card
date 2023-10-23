// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodAdapter extends TypeAdapter<Food> {
  @override
  final int typeId = 1;

  @override
  Food read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Food(
      name: fields[0] as String,
      model: fields[1] as int,
      color: fields[2] as String,
      image: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Food obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.model)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
