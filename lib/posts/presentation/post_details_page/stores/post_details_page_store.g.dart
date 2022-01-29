// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_details_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostDetailsPageStore on PostDetailsPageStoreBase, Store {
  final _$postAtom = Atom(name: 'PostDetailsPageStoreBase.post');

  @override
  PostResponseEntity? get post {
    _$postAtom.reportRead();
    return super.post;
  }

  @override
  set post(PostResponseEntity? value) {
    _$postAtom.reportWrite(value, super.post, () {
      super.post = value;
    });
  }

  final _$loadingAtom = Atom(name: 'PostDetailsPageStoreBase.loading');

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

  final _$errorAtom = Atom(name: 'PostDetailsPageStoreBase.error');

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
post: ${post},
loading: ${loading},
error: ${error}
    ''';
  }
}
