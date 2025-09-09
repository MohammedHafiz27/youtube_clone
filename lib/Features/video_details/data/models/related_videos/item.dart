import 'package:equatable/equatable.dart';

import 'channel.dart';
import 'thumbnail.dart';

class Item extends Equatable {
  final String? type;
  final String? id;
  final String? title;
  final Channel? channel;
  final bool? isLiveNow;
  final String? viewCountText;
  final List<Thumbnail>? thumbnails;
  final String? lengthText;
  final String? publishedTimeText;

  const Item({
    this.type,
    this.id,
    this.title,
    this.channel,
    this.isLiveNow,
    this.viewCountText,
    this.thumbnails,
    this.lengthText,
    this.publishedTimeText,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    type: json['type'] as String?,
    id: json['id'] as String?,
    title: json['title'] as String?,
    channel: json['channel'] == null
        ? null
        : Channel.fromJson(json['channel'] as Map<String, dynamic>),
    isLiveNow: json['isLiveNow'] as bool?,
    viewCountText: json['viewCountText'] as String?,
    thumbnails: (json['thumbnails'] as List<dynamic>?)
        ?.map((e) => Thumbnail.fromJson(e as Map<String, dynamic>))
        .toList(),
    lengthText: json['lengthText'] as String?,
    publishedTimeText: json['publishedTimeText'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'id': id,
    'title': title,
    'channel': channel?.toJson(),
    'isLiveNow': isLiveNow,
    'viewCountText': viewCountText,
    'thumbnails': thumbnails?.map((e) => e.toJson()).toList(),
    'lengthText': lengthText,
    'publishedTimeText': publishedTimeText,
  };

  @override
  List<Object?> get props {
    return [
      type,
      id,
      title,
      channel,
      isLiveNow,
      viewCountText,
      thumbnails,
      lengthText,
      publishedTimeText,
    ];
  }
}
