// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryController on _HistoryController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HistoryController.isLoading', context: context);

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
      Atom(name: '_HistoryController.hasAddress', context: context);

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

  late final _$addressHistoryListAtom =
      Atom(name: '_HistoryController.addressHistoryList', context: context);

  @override
  List<AddressModel> get addressHistoryList {
    _$addressHistoryListAtom.reportRead();
    return super.addressHistoryList;
  }

  @override
  set addressHistoryList(List<AddressModel> value) {
    _$addressHistoryListAtom.reportWrite(value, super.addressHistoryList, () {
      super.addressHistoryList = value;
    });
  }

  late final _$loadDataAsyncAction =
      AsyncAction('_HistoryController.loadData', context: context);

  @override
  Future<void> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasAddress: ${hasAddress},
addressHistoryList: ${addressHistoryList}
    ''';
  }
}