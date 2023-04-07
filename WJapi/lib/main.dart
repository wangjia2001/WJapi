import 'package:flutter/material.dart';
import 'ImagePiker.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "ImagePiker": (BuildContext context) => new ImagePickerWidget(),
      },
      home: new ImagePickerWidget(),
    ));
