import 'package:app_api/src/model/csrf.dart';
import 'package:app_api/src/model/change_password.dart';
import 'package:app_api/src/model/login.dart';
import 'package:app_api/src/model/patched_change_password.dart';
import 'package:app_api/src/model/patched_reset_password_confirm.dart';
import 'package:app_api/src/model/patched_user_me.dart';
import 'package:app_api/src/model/registration.dart';
import 'package:app_api/src/model/reset_password.dart';
import 'package:app_api/src/model/reset_password_confirm.dart';
import 'package:app_api/src/model/user_me.dart';
import 'package:app_api/src/model/version.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType,
    {bool growable = true}) {
  switch (targetType) {
    case 'String':
      return '$value' as ReturnType;
    case 'int':
      return (value is int ? value : int.parse('$value')) as ReturnType;
    case 'bool':
      if (value is bool) {
        return value as ReturnType;
      }
      final valueString = '$value'.toLowerCase();
      return (valueString == 'true' || valueString == '1') as ReturnType;
    case 'double':
      return (value is double ? value : double.parse('$value')) as ReturnType;
    case 'CSRF':
      return CSRF.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ChangePassword':
      return ChangePassword.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Login':
      return Login.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'PatchedChangePassword':
      return PatchedChangePassword.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PatchedResetPasswordConfirm':
      return PatchedResetPasswordConfirm.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PatchedUserMe':
      return PatchedUserMe.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Registration':
      return Registration.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ResetPassword':
      return ResetPassword.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ResetPasswordConfirm':
      return ResetPasswordConfirm.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UserMe':
      return UserMe.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'Version':
      return Version.fromJson(value as Map<String, dynamic>) as ReturnType;
    default:
      RegExpMatch? match;

      if (value is List && (match = _regList.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
            .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(
                v, targetType,
                growable: growable))
            .toList(growable: growable) as ReturnType;
      }
      if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
            .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(
                v, targetType,
                growable: growable))
            .toSet() as ReturnType;
      }
      if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
        targetType = match![1]!.trim(); // ignore: parameter_assignments
        return Map<String, BaseType>.fromIterables(
          value.keys as Iterable<String>,
          value.values.map((dynamic v) => deserialize<BaseType, BaseType>(
              v, targetType,
              growable: growable)),
        ) as ReturnType;
      }
      break;
  }
  throw Exception('Cannot deserialize');
}
