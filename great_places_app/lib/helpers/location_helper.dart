import 'dart:convert';

import 'package:http/http.dart' as http;

const BING_API_KEY =
    'AhuRth3AWWb0pfz5kR4yd9bYAFOcqZ6WufbZGFsYySYnSUxUjt1bETB3fvRGAYfA';

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return 'https://dev.virtualearth.net/REST/v1/Imagery/Map/Road/$latitude,$longitude/14?mapSize=500,500&pp=$latitude,$longitude;66&mapLayer=Basemap,Buildings&key=$BING_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url =
        'http://dev.virtualearth.net/REST/v1/Locations/$lat,$lng?&key=$BING_API_KEY';
    final response = await http.get(Uri.parse(url));
    return json.decode(response.body)["resourceSets"][0]["resources"][0]
        ["address"]["formattedAddress"];
  }
}
