import 'package:equatable/equatable.dart';

import 'item.dart';

class CommentsModel extends Equatable {
  final String? errorId;
  final String? nextToken;
  final String? countText;
  final List<Item>? items;

  const CommentsModel({this.errorId, this.nextToken, this.countText, this.items});

  factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
    errorId: json['errorId'] as String?,
    nextToken: json['nextToken'] as String?,
    countText: json['countText'] as String?,
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'errorId': errorId,
    'nextToken': nextToken,
    'countText': countText,
    'items': items?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [errorId, nextToken, countText, items];
}
