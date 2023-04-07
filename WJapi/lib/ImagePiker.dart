import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert' as convert;
import 'dart:io';

var oriTxt;

class ImagePickerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagePickerState();
  }
}

class _ImagePickerState extends State<ImagePickerWidget> {
  var _imgPath;
  // String encodeTxt = Util.base64Encode(_imgPath);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ImagePicker"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _ImageView(_imgPath),
              RaisedButton(
                onPressed: _takePhoto,
                child: Text("拍照"),
              ),
              RaisedButton(
                onPressed: _openGallery,
                child: Text("选择照片"),
              ),
            ],
          ),
        ));
  }

  /*图片控件*/
  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return Center(
        child: Text("请选择图片或拍照"),
      );
    } else {
      return Image.file(
        imgPath,
      );
    }
  }

  /*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _imgPath = image;
    });
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }
}

class EncodeUtil {
/*
  * Base64加密
  */
  static String encodeBase64(String data) {
    var content = convert.utf8.encode(data);
    var digest = convert.base64Encode(content);
    return digest;
  }

  /*
  * Base64解密
  */
  static String decodeBase64(String data) {
    return String.fromCharCodes(convert.base64Decode(data));
  }

  /*
  * 通过图片路径将图片转换成Base64字符串
  */
  static Future image2Base64(String path) async {
    File file = new File(path);
    List<int> imageBytes = await file.readAsBytes();
    return convert.base64Encode(imageBytes);
  }

  /*
  * 将图片文件转换成Base64字符串
  */
  static Future imageFile2Base64(File file) async {
    List<int> imageBytes = await file.readAsBytes();
    var uri = convert.base64Encode(imageBytes);
    // return Uri.encodeFull(uri);
    return Uri.encodeComponent(uri);
  }
}

testBase64() {
  String encodeTxt = EncodeUtil.encodeBase64(oriTxt);
  print(oriTxt);
  print(encodeTxt);
}
