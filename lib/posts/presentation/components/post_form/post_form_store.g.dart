// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostFormStore on PostFormStoreBase, Store {
  final _$idAtom = Atom(name: 'PostFormStoreBase.id');

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$titleAtom = Atom(name: 'PostFormStoreBase.title');

  @override
  TextEditingController get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(TextEditingController value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$contentAtom = Atom(name: 'PostFormStoreBase.content');

  @override
  TextEditingController get content {
    _$contentAtom.reportRead();
    return super.content;
  }

  @override
  set content(TextEditingController value) {
    _$contentAtom.reportWrite(value, super.content, () {
      super.content = value;
    });
  }

  final _$loadingAtom = Atom(name: 'PostFormStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: 'PostFormStoreBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
title: ${title},
content: ${content},
loading: ${loading},
error: ${error}
    ''';
  }
}
