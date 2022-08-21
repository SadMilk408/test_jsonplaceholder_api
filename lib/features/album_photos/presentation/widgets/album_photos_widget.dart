import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_for_eclipse/features/album_photos/data/models/photos_model.dart';

class AlbumPhotosWidget extends StatelessWidget {
  List<PhotosModel> photosList;

  AlbumPhotosWidget({
    required this.photosList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = photosList
        .map(
          (item) => Container(
        margin: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item.url, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    item.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )
        .toList();

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
          ),
          items: imageSliders,
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: photosList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(photosList[index].title),
                    leading: Image.network(photosList[index].thumbnailUrl),
                  ),
                );
              }
          ),
        ),
      ],
    );
  }
}