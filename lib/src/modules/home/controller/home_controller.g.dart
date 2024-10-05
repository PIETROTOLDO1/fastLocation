// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HomeController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$hasAddressAtom =
      Atom(name: '_HomeController.hasAddress', context: context);

  @override
  bool get hasAddress {
    _$hasAddressAtom.reportRead();
    return super.hasAddress;
  }

  @override
  set hasAddress(bool value) {
    _$hasAddressAtom.reportWrite(value, super.hasAddress, () {
      super.hasAddress = value;
    });
  }

  late final _$hasErrorAtom =
      Atom(name: '_HomeController.hasError', context: context);

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  late final _$hasRouteErrorAtom =
      Atom(name: '_HomeController.hasRouteError', context: context);

  @override
  bool get hasRouteError {
    _$hasRouteErrorAtom.reportRead();
    return super.hasRouteError;
  }

  @override
  set hasRouteError(bool value) {
    _$hasRouteErrorAtom.reportWrite(value, super.hasRouteError, () {
      super.hasRouteError = value;
    });
  }

  late final _$lastAddressAtom =
      Atom(name: '_HomeController.lastAddress', context: context);

  @override
  AddressModel? get lastAddress {
    _$lastAddressAtom.reportRead();
    return super.lastAddress;
  }

  @override
  set lastAddress(AddressModel? value) {
    _$lastAddressAtom.reportWrite(value, super.lastAddress, () {
      super.lastAddress = value;
    });
  }

  late final _$addressRecentListAtom =
      Atom(name: '_HomeController.addressRecentList', context: context);

  @override
  List<AddressModel> get addressRecentList {
    _$addressRecentListAtom.reportRead();
    return super.addressRecentList;
  }

  @override
  set addressRecentList(List<AddressModel> value) {
    _$addressRecentListAtom.reportWrite(value, super.addressRecentList, () {
      super.addressRecentList = value;
    });
  }

  late final _$loadDataAsyncAction =
      AsyncAction('_HomeController.loadData', context: context);

  @override
  Future<void> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  late final _$getAddressAsyncAction =
      AsyncAction('_HomeController.getAddress', context: context);

  @override
  Future<void> getAddress(String cep) {
    return _$getAddressAsyncAction.run(() => super.getAddress(cep));
  }

  late final _$updateAdressRecentAsyncAction =
      AsyncAction('_HomeController.updateAdressRecent', context: context);

  @override
  Future<void> updateAdressRecent(AddressModel address) {
    return _$updateAdressRecentAsyncAction
        .run(() => super.updateAdressRecent(address));
  }

  late final _$incrementAdressHistoryAsyncAction =
      AsyncAction('_HomeController.incrementAdressHistory', context: context);

  @override
  Future<void> incrementAdressHistory(AddressModel address) {
    return _$incrementAdressHistoryAsyncAction
        .run(() => super.incrementAdressHistory(address));
  }

  late final _$routeAsyncAction =
      AsyncAction('_HomeController.route', context: context);

  @override
  Future<void> route(BuildContext context) {
    return _$routeAsyncAction.run(() => super.route(context));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasAddress: ${hasAddress},
hasError: ${hasError},
hasRouteError: ${hasRouteError},
lastAddress: ${lastAddress},
addressRecentList: ${addressRecentList}
    ''';
  }
}