import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String? url;
  final int? lengthMs;
  final String? mimeType;
  final String? extension;
  final int? lastModified;
  final int? size;
  final String? sizeText;
  final bool? hasAudio;
  final String? quality;
  final int? width;
  final int? height;

  const Item({
    this.url,
    this.lengthMs,
    this.mimeType,
    this.extension,
    this.lastModified,
    this.size,
    this.sizeText,
    this.hasAudio,
    this.quality,
    this.width,
    this.height,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    url: json['url'] as String?,
    lengthMs: json['lengthMs'] as int?,
    mimeType: json['mimeType'] as String?,
    extension: json['extension'] as String?,
    lastModified: json['lastModified'] as int?,
    size: json['size'] as int?,
    sizeText: json['sizeText'] as String?,
    hasAudio: json['hasAudio'] as bool?,
    quality: json['quality'] as String?,
    width: json['width'] as int?,
    height: json['height'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'url': url,
    'lengthMs': lengthMs,
    'mimeType': mimeType,
    'extension': extension,
    'lastModified': lastModified,
    'size': size,
    'sizeText': sizeText,
    'hasAudio': hasAudio,
    'quality': quality,
    'width': width,
    'height': height,
  };

  @override
  List<Object?> get props {
    return [url, lengthMs, mimeType, extension, lastModified, size, sizeText, hasAudio, quality, width, height];
  }
}
