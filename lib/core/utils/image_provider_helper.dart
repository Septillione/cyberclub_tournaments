import 'package:flutter/material.dart';

class ImageProviderHelper {
  static ImageProvider getImage(String? url) {
    if (url == null || url.isEmpty) {
      return const AssetImage('assets/images/stock/placeholder.jpg');
    }

    if (url.startsWith('http')) {
      return NetworkImage(url);
    }

    return AssetImage(url);
  }
}
