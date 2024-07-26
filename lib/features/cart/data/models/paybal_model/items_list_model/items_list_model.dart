import 'package:json_annotation/json_annotation.dart';

import 'item.dart';
part 'items_list_model.g.dart';

@JsonSerializable()
class ItemsListModel {
  List<Item>? items;

  ItemsListModel({this.items});

  factory ItemsListModel.fromJson(Map<String, dynamic> json) =>
      _$ItemsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsListModelToJson(this);
}
