import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_memes/shared/widgets/MyAppBar.dart';
import 'dart:core';
import 'package:image_downloader/image_downloader.dart';
import '../../../../constants/text_styles.dart';
import '../../../../router/routing_variables.dart';
import '../../domain/entities/get_memes_entity.dart';

class DetailsPage extends StatefulWidget {
  final dynamic aruments;
  const DetailsPage({Key? key, this.aruments}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState(aruments);
}

class _DetailsPageState extends State<DetailsPage> {
  GetMemesEntity getMemesEntity;
  _DetailsPageState(this.getMemesEntity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Another Screen",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(getMemesEntity.url.toString()),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  downloadImage();
                },
                child: Text("Download Iamge"),
              ),
              SizedBox(height: 14),
              Text(
                "ID: ${getMemesEntity.id.toString()}",
                style: ConstantTextStyles.bodyBold16(
                  context,
                  Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Count: ${getMemesEntity.box_count.toString()}",
                style: ConstantTextStyles.body16(
                  context,
                  Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Captions: ${getMemesEntity.captions.toString()}",
                style: ConstantTextStyles.body16(
                  context,
                  Colors.black,
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Navigation.detailsPage);
                },
                child: Row(
                  children: [
                    Text(
                      "Size: ",
                      style: ConstantTextStyles.bodyBold16(
                        context,
                        Colors.black,
                      ),
                    ),
                    Text(
                      'height ${getMemesEntity.height.toString()}',
                      style: ConstantTextStyles.body16(
                        context,
                        Colors.black,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text("x"),
                    SizedBox(width: 5),
                    Text(
                      'width ${getMemesEntity.width.toString()}',
                      style: ConstantTextStyles.body16(
                        context,
                        Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }

  downloadImage() async {
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(getMemesEntity.url.toString());
      if (imageId == null) {
        return;
      }

      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: const Text('Download Complete'),
      //     action: SnackBarAction(
      //       label: 'Open Image',
      //       onPressed: () async {
      //         var path = await ImageDownloader.findPath(imageId);
      //         await ImageDownloader.open(imageId);
      //       },
      //     ),
      //   ),
      // );

      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      print(error);
    }
  }
}
