import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kafa2a/core/di/service_locator.dart';
import 'package:kafa2a/core/widgets/loading_indicator.dart';
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
            if (state is MapSuccessState) {
              final LatLng currentLatLng = LatLng(
                state.location.latitude!,
                state.location.longitude!,
              );
              return GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
                zoomControlsEnabled: false,
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
