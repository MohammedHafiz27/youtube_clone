import 'package:equatable/equatable.dart';

import 'item.dart';

class Related extends Equatable {
  final String? nextToken;
  final List<Item>? items;

  const Related({this.nextToken, this.items});

  factory Related.fromJson(Map<String, dynamic> json) => Related(
    nextToken: json['nextToken'] as String?,
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'nextToken': nextToken,
    'items': items?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [nextToken, items];
}
