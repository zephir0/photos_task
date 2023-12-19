import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_task/bloc/photo_bloc.dart';
import 'package:photos_task/bloc/photo_event.dart';
import 'package:photos_task/config/get_it.dart';
import 'package:photos_task/ui/photo_grid_page.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoBloc()..add(LoadAllPhotos()),
      child: const MaterialApp(
        title: 'Photo Grid',
        home: PhotoGridPage(),
      ),
    );
  }
}
