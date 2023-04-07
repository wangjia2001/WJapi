// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'dart:convert';

// class Ocr extends StatefulWidget {
//   @override
//   _OcrState createState() => _OcrState();
// }

// class _OcrState extends State<Ocr> {
//   var _ipAddress = 'Unknown';

//   _getIPAddress() async {
//     var getAccessTokenUrl =
//         'https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=Ww4NWD4p0lAsTVuRc5M6NB20&client_secret=NQ87RgTbDwKkF8QICOGsQCr3i9Dv5ZYx';
//     var url =
//         'https://aip.baidubce.com/rest/2.0/ocr/v1/general?25.138ec0a9da3f2d27d5f4a272def94f7f.315360000.1936602920.282335-24113557';
//     var httpClient = new HttpClient();

//     String result;
//     try {
//       var request = await httpClient.getUrl(Uri.parse(url));
//       var response = await request.close();
//       if (response.statusCode == HttpStatus.OK) {
//         var json = await response.transform(utf8.decoder).join();
//         var data = jsonDecode(json);
//         result = data['origin'];
//       } else {
//         result =
//             'Error getting IP address:\nHttp status ${response.statusCode}';
//       }
//     } catch (exception) {
//       result = 'Failed getting IP address';
//     }

//     // If the widget was removed from the tree while the message was in flight,
//     // we want to discard the reply rather than calling setState to update our
//     // non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       _ipAddress = result;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var spacer = new SizedBox(height: 32.0);
//     return new Scaffold(
//       body: new Center(
//         child: new Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             new Text('Your current IP address is:'),
//             new Text('$_ipAddress.'),
//             spacer,
//             new RaisedButton(
//               onPressed: _getIPAddress,
//               child: new Text('Get IP address'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
