import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kafa2a/core/di/service_locator.dart';
import 'package:kafa2a/core/widgets/loading_indicator.dart';
import 'package:kafa2a/features/home/user/data/models/get_nearby_providers_request.dart';
import 'package:kafa2a/features/home/user/presentation/cubit/map/map_cubit.dart';
import 'package:kafa2a/features/home/user/presentation/cubit/map/map_states.dart';

class MapTab extends StatelessWidget {
  const MapTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt.get<MapCubit>()..getLocation(),
        child: BlocBuilder<MapCubit, MapStates>(
          builder: (context, state) {
            if (state is MapSuccessState ||
                state is NearbyProvidersSuccessState) {
              final LatLng currentLatLng = LatLng(
                context.read<MapCubit>().currentLocation!.latitude!,
                context.read<MapCubit>().currentLocation!.longitude!,
              );
              // if (context.read<MapCubit>().markers.isEmpty) {
              //   context.read<MapCubit>().getNearbyProviders(
              //         GetNearbyProvidersRequest(
              //           lat:
              //               context.read<MapCubit>().currentLocation!.latitude!,
              //           lng: context
              //               .read<MapCubit>()
              //               .currentLocation!
              //               .longitude!,
              //         ),
              //       );
              // }
              return GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
                zoomControlsEnabled: false,
                markers: context.read<MapCubit>().markers,
                initialCameraPosition: CameraPosition(
                  zoom: 15.151926040649414,
                  target: currentLatLng,
                ),
              );
            } else if (state is MapLoadingState) {
              return LoadingIndicator();
            } else if (state is MapErrorState) {
              return Center(child: Text("ERROR"));
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
