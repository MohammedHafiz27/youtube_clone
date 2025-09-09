import 'package:equatable/equatable.dart';

import 'item.dart';

class RelatedVideosModel extends Equatable {
  final String? errorId;
  final String? nextToken;
  final List<Item>? items;

  const RelatedVideosModel({this.errorId, this.nextToken, this.items});

  factory RelatedVideosModel.fromJson(Map<String, dynamic> json) => RelatedVideosModel(
    errorId: json['errorId'] as String?,
    nextToken: json['nextToken'] as String?,
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'errorId': errorId,
    'nextToken': nextToken,
    'items': items?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [errorId, nextToken, items];
}
