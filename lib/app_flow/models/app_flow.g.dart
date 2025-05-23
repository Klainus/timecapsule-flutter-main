// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_flow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppFlowImpl _$$AppFlowImplFromJson(Map<String, dynamic> json) =>
    _$AppFlowImpl(
      isLoggedIn: json['isLoggedIn'] as bool? ?? false,
      isEnableAnalyticsCompleted:
          json['isEnableAnalyticsCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$AppFlowImplToJson(_$AppFlowImpl instance) =>
    <String, dynamic>{
      'isLoggedIn': instance.isLoggedIn,
      'isEnableAnalyticsCompleted': instance.isEnableAnalyticsCompleted,
    };
