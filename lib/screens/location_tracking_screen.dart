import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/location_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Live Location Tracking')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(locationProvider.currentPosition?.latitude ?? 0, locationProvider.currentPosition?.longitude ?? 0),
          zoom: 14,
        ),
        markers: {
          if (locationProvider.currentPosition != null)
            Marker(
              markerId: MarkerId('currentLocation'),
              position: LatLng(locationProvider.currentPosition!.latitude, locationProvider.currentPosition!.longitude),
            ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await locationProvider.getCurrentLocation();
        },
        child: Icon(Icons.my_location),
      ),
    );
  }
}