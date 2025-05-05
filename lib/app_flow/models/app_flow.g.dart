// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_flow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppFlow _$AppFlowFromJson(Map<String, dynamic> json) => _AppFlow(
      isLoggedIn: json['isLoggedIn'] as bool? ?? false,
      isEnableAnalyticsCompleted:
          json['isEnableAnalyticsCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$AppFlowToJson(_AppFlow instance) => <String, dynamic>{
      'isLoggedIn': instance.isLoggedIn,
      'isEnableAnalyticsCompleted': instance.isEnableAnalyticsCompleted,
    };
