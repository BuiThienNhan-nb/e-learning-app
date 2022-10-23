// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainPageStore on _MainPageStore, Store {
  late final _$pageIndexAtom =
      Atom(name: '_MainPageStore.pageIndex', context: context);

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  late final _$_MainPageStoreActionController =
      ActionController(name: '_MainPageStore', context: context);

  @override
  void onPageChanged(int value, BuildContext context) {
    final _$actionInfo = _$_MainPageStoreActionController.startAction(
        name: '_MainPageStore.onPageChanged');
    try {
      return super.onPageChanged(value, context);
    } finally {
      _$_MainPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex}
    ''';
  }
}
