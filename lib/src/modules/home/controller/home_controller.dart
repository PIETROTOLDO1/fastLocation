import 'package:fastlocation/src/modules/home/model/address_model.dart';
import 'package:fastlocation/src/modules/home/service/home_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final HomeService _service = HomeService();

  @observable
  bool isLoading = false;

  @observable
  bool hasAddress = false;

  @observable
  bool hasError = false;

  @observable
  bool hasRouteError = false;

  @observable
  AddressModel? lastAddress;

  @observable
  List<AddressModel> addressRecentList = [];

  @action
  Future<void> loadData() async {
    isLoading = true;
    addressRecentList = await _service.getAddressRecentList();
    isLoading = false;
  }

  @action
  Future<void> getAddress(String cep) async {
    try {
      isLoading = true;
      lastAddress = await _service.getAddress(cep);
      await updateAdressRecent(lastAddress!);
      await incrementAdressHistory(lastAddress!);
      hasAddress = true;
      isLoading = false;
    } catch (ex) {
      hasError = true;
      isLoading = false;
      debugPrint('HomeControler.getAddress -> ${ex.toString()}');
    }
  }

  @action
  Future<void> updateAdressRecent(AddressModel address) async {
    await _service.updateAdressRecentList(address);
    addressRecentList = await _service.getAddressRecentList();
  }

  @action
  Future<void> incrementAdressHistory(AddressModel address) async {
    await _service.incrementAdressHistoryList(address);
  }

  @action
  Future<void> route(BuildContext context) async {
    try {
      isLoading = true;
      if (lastAddress != null) {
        await _service.openMap(context, '${lastAddress?.publicPlace}, ${lastAddress?.neighborhood}');
      } else {
        hasRouteError = true;
        isLoading = false;
      }
      isLoading = false;
    } catch (ex) {
      hasRouteError = true;
      isLoading = false;
      debugPrint('HomeController.route -> ${ex.toString()}');
    }
  }
}