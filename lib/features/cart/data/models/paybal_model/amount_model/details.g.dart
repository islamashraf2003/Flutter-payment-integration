// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      subtotal: json['subtotal'] as String?,
      shipping: json['shipping'] as String?,
      shippingDiscount: (json['shippingDiscount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'subtotal': instance.subtotal,
      'shipping': instance.shipping,
      'shippingDiscount': instance.shippingDiscount,
    };
