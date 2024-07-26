// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsListModel _$ItemsListModelFromJson(Map<String, dynamic> json) =>
    ItemsListModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemsListModelToJson(ItemsListModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
