import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class FullScreenMap extends StatelessWidget {
  final LatLng location;
  final String? title;

  const FullScreenMap({super.key, required this.location, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title ?? 'Peta'),
      body: FlutterMap(
        options: MapOptions(initialCenter: location, initialZoom: 16),
        children: [
          TileLayer(
            urlTemplate:
                'https://mt0.google.com/vt/lyrs=r&hl=en&x={x}&y={y}&z={z}',
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: location,
                width: 60,
                height: 60,
                child: Icon(Icons.location_pin, color: Colors.red, size: 60),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
