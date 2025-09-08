import 'package:equatable/equatable.dart';

import 'thumbnail.dart';

class MusicCredit extends Equatable {
  final String? videoId;
  final String? title;
  final String? artist;
  final String? album;
  final String? description;
  final List<Thumbnail>? thumbnails;

  const MusicCredit({
    this.videoId,
    this.title,
    this.artist,
    this.album,
    this.description,
    this.thumbnails,
  });

  factory MusicCredit.fromJson(Map<String, dynamic> json) => MusicCredit(
    videoId: json['videoId'] as String?,
    title: json['title'] as String?,
    artist: json['artist'] as String?,
    album: json['album'] as String?,
    description: json['description'] as String?,
    thumbnails: (json['thumbnails'] as List<dynamic>?)
        ?.map((e) => Thumbnail.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'videoId': videoId,
    'title': title,
    'artist': artist,
    'album': album,
    'description': description,
    'thumbnails': thumbnails?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [videoId, title, artist, album, description, thumbnails];
  }
}
