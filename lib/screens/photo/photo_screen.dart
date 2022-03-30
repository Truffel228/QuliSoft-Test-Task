import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qulisoft_test_task/models/user/user.dart';

class PhotoScreenArguments {
  PhotoScreenArguments(this.imageUrl);
  final String imageUrl;
}

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PhotoScreenArguments arguments =
        ModalRoute.of(context)!.settings.arguments as PhotoScreenArguments;
    final url = arguments.imageUrl;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      /// Added interactive InteractiveViewer to zoom the picture
      body: InteractiveViewer(
        maxScale: 4,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              url,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
