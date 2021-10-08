// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homepage_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomepageBack on _HomepageBack, Store {
  final _$listAtom = Atom(name: '_HomepageBack.list');

  @override
  Future<List<Pratos>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Pratos>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_HomepageBackActionController =
      ActionController(name: '_HomepageBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_HomepageBackActionController.startAction(
        name: '_HomepageBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_HomepageBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
