import 'package:flutter/material.dart';
import 'package:great_places_app/helpers/location_helper.dart';
import 'package:great_places_app/providers/great_places.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/place-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              selectedPlace.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            selectedPlace.location!.address,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            alignment: Alignment.center,
            height: 170,
            width: double.infinity,
            child: Image.network(
              LocationHelper.generateLocationPreviewImage(
                latitude: selectedPlace.location!.latitude,
                longitude: selectedPlace.location!.longitude,
              ),
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}
