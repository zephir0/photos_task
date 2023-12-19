import 'package:flutter/material.dart';

class PhotoMenu extends StatelessWidget {
  final Function(String) onSelected;

  const PhotoMenu({Key? key, required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem<String>(
            value: 'show_albums',
            child: Text('Show Albums'),
          ),
          const PopupMenuItem<String>(
            value: 'all_photos',
            child: Text('Show All Photos'),
          ),
        ];
      },
    );
  }
}
