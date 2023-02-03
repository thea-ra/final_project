// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeModel _$$_HomeModelFromJson(Map<String, dynamic> json) => _$_HomeModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['imageUrl'] as String?,
      placeCount: json['placeCount'] as num?,
      shortDescription: json['shortDescription'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_HomeModelToJson(_$_HomeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.image,
      'placeCount': instance.placeCount,
      'shortDescription': instance.shortDescription,
      'description': instance.description,
    };
