import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/src/places.dart' as place;
import 'package:khalsha/features/map/presentation/widgets/text_input_search.dart';

import 'getx/controllers/controller.dart';

class MapView extends GetView<MapController> {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('اختر الموقع'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: InkWell(
              onTap: () async {
                Get.back(result: controller.locationDetails);
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 16,
                child: Icon(
                  Icons.done,
                  color: Get.theme.primaryColor,
                  size: 20,
                ),
              ),
            ),
          )
        ],
      ),
      body: Obx(
        () => controller.loading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: TextFieldSearch(
                      loading: controller.searchLoading,
                      initialList: controller.places,
                      onSelectedItem: (place.Prediction place) =>
                          controller.getPlaceDetails(place.placeId ?? '0'),
                      onChanged: (_) => controller.getPlacesFromSearch(),
                      controller: controller.searchController,
                      decoration: const InputDecoration(
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'ابحث هنا',
                          contentPadding: EdgeInsets.symmetric(horizontal: 4)),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GoogleMap(
                          mapType: MapType.terrain,
                          initialCameraPosition: controller.mapPosition,
                          onMapCreated: (GoogleMapController mapController) =>
                              controller.myMapController
                                  .complete(mapController),
                          onCameraMove: (CameraPosition cameraPosition) {
                            final lat = cameraPosition.target.latitude;
                            final long = cameraPosition.target.longitude;
                            controller.changeLatLong(lat, long);
                          },
                          onCameraIdle: controller.getLocationString,
                        ),
                        const Icon(Icons.place),
                        Positioned(
                          bottom: 20,
                          left: 60,
                          right: 60,
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14)),
                                color: Colors.white),
                            child: Obx(() => Text(
                                  controller.getLocationDataLoading.value
                                      ? 'جاري البحث عن الموقع'
                                      : controller.locationName,
                                  textAlign: TextAlign.center,
                                  style: Get.textTheme.titleMedium!
                                      .copyWith(color: Get.theme.primaryColor),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
