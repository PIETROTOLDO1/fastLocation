import 'package:fastlocation/src/modules/home/model/address_model.dart';
import 'package:fastlocation/src/modules/home/service/home_service.dart';
import 'package:mobx/mobx.dart';
part 'history_controller.g.dart';

class HistoryController = _HistoryController with _$HistoryController;

abstract class _HistoryController with Store {
  final HomeService _service = HomeService();

  @observable
  bool isLoading = false;

  @observable
  bool hasAddress = false;

  @observable
  List<AddressModel> addressHistoryList = [];

  @action
  Future<void> loadData() async {
    isLoading = true;
    addressHistoryList = (await _service.getAddressHistoryList())!;
    isLoading = false;
  }
}