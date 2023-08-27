import 'package:google_maps_flutter/google_maps_flutter.dart';

getPolyline(double srcLat, double srcLong, double destLat, double destLong) async {
  Set<Polyline> polylines = {};

// String url = https://maps.googleapis.com/maps/api/directions/json?origin=23.22,33.22&destination=33.4,22.3&key=AIzaSyCUyPeOZihdOJX79PUaTI4LHxFtTnCv8zo
  // PolylinePoints polylinePoints = PolylinePoints();
  // var origin = PointLatLng(srcLat, srcLong);
  // var dest = PointLatLng(destLat, destLong);

  // PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(mapKey, origin, dest);
  // List<LatLng> myPoints = [];
  // for (var point in result.points) {
  //   myPoints.add(LatLng(point.latitude, point.longitude));
  //   print("#####################################");
  //   print('${point.latitude} :: ${point.longitude}');
  //   print("#####################################");
  // }
  List<LatLng> myPoints = [
    LatLng(srcLat, srcLong),
    LatLng(destLat, destLong),
  ];
  Polyline line = Polyline(
    polylineId: const PolylineId("1"),
    points: myPoints,
  );
  polylines.add(line);


  return polylines;
}
