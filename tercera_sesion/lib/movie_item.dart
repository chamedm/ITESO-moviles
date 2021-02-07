import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  final Map<String, String> pelicula;
  MovieItem({Key key, @required this.pelicula}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      child: Container(
        width: 120,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  "${pelicula["image"]}",
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xfa4169D8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      )),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Titulo: ${pelicula["title"]}",
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Rating: ${pelicula["description"]}",
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
