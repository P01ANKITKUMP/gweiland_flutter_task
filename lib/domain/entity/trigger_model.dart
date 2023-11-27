// To parse this JSON data, do
//
//     final triggerModel = triggerModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

TriggerModel triggerModelFromJson(String str) =>
    TriggerModel.fromJson(json.decode(str));

String triggerModelToJson(TriggerModel data) => json.encode(data.toJson());

class TriggerModel extends Equatable {
  final int? tapValue;
  final int? totalSuccessCount;
  final bool? isEqual;

  const TriggerModel({
    this.tapValue,
    this.totalSuccessCount,
    this.isEqual,
  });

  TriggerModel copyWith({
    int? tapValue,
    int? totalSuccessCount,
    bool? isEqual,
  }) =>
      TriggerModel(
        tapValue: tapValue ?? this.tapValue,
        totalSuccessCount: totalSuccessCount ?? this.totalSuccessCount,
        isEqual: isEqual ?? this.isEqual,
      );

  factory TriggerModel.fromJson(Map<String, dynamic> json) => TriggerModel(
        tapValue: json["tapValue"],
        totalSuccessCount: json["Total_success_count"],
        isEqual: json["isEqual"],
      );

  Map<String, dynamic> toJson() => {
        "tapValue": tapValue,
        "Total_success_count": totalSuccessCount,
        "isEqual": isEqual,
      };

  @override
  List<Object?> get props => [tapValue, totalSuccessCount, isEqual];
}
