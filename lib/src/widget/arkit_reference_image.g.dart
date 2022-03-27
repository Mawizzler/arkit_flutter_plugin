// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arkit_reference_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ARKitReferenceImage _$ARKitReferenceImageFromJson(Map json) =>
    ARKitReferenceImage(
      name: json['name'] as String,
      data: json['data'] as String,
      physicalWidth: (json['physicalWidth'] as num).toDouble(),
    );

Map<String, dynamic> _$ARKitReferenceImageToJson(
        ARKitReferenceImage instance) =>
    <String, dynamic>{
      'name': instance.name,
      'data': instance.data,
      'physicalWidth': instance.physicalWidth,
    };
