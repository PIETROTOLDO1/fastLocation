import 'package:dio/dio.dart';
import 'package:fastlocation/src/modules/home/model/address_model.dart';
import 'package:fastlocation/src/modules/home/repositories/home_local_repository.dart';
import 'package:fastlocation/src/modules/home/repositories/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:map_launcher/map_launcher.dart';

class HomeService {
  final HomeRepository _repository = HomeRepository();
  final HomeLocalRepository _localRepository = HomeLocalRepository();

  Future<AddressModel> getAddress(String cep) async {
    try {
      Response response = await _repository.getAddressViaCep(cep);
      return AddressModel.fromJson(response.data);
    } catch (ex) {
      debugPrint('HomeService.getAdress -> ${ex.toString()}');
      rethrow;
    }
  }
  Future<List<AddressModel>> getAddressRecentList() async {
    try {
      List<AddressModel>? addressRecentList = await _localRepository.getAddressRecent();
      return addressRecentList ?? <AddressModel>[];
    } catch (ex) {
      debugPrint('HomeService.getAdressRecentList -> ${ex.toString()}');
      rethrow;
    }
  }
  Future<void> updateAdressRecentList(AddressModel address) async {
    await _localRepository.addAddressRecent(address);
  }
  Future<List<AddressModel>?> getAddressHistoryList() async {
    try {
      List<AddressModel>? addressHistoryList = await _localRepository.getAddressHistory();
      return addressHistoryList ?? <AddressModel>[];
    } catch (ex) {
      debugPrint('HomeService.gerAdressHistoryList -> ${ex.toString()}');
      rethrow;
    }
  }
  Future<void> incrementAdressHistoryList(AddressModel address) async{
    await _localRepository.addAddressHistory(address);
  }
  Future<void> openMap(BuildContext context, String address) async{
    try {
      Map<String, double>? location = await getGeoLocation(address);

      double latitude = location?["latitude"] ?? 0;
      double longitude = location?["longitude"] ?? 0;

      final List<AvailableMap> availableMaps = await MapLauncher.installedMaps;

      if(availableMaps.isNotEmpty) {
        await availableMaps.first.showDirections(destination: Coords(latitude, longitude));
      }

    } on Exception{
      rethrow;
    }
  }
  Future<Map<String, double>?> getGeoLocation(String address) async {
    List<Location> locations = await locationFromAddress(address);

    return {
      "latitude": locations.first.latitude,
      "longitude": locations.first.longitude,
    };
  }
}