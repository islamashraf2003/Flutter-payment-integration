// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      installments: json['installments'],
      mandateOptions: json['mandateOptions'],
      network: json['network'],
      requestThreeDSecure: json['requestThreeDSecure'] as String?,
    );

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'installments': instance.installments,
      'mandateOptions': instance.mandateOptions,
      'network': instance.network,
      'requestThreeDSecure': instance.requestThreeDSecure,
    };
