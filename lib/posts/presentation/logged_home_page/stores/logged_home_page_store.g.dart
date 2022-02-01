// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoggedHomePageStore on LoggedHomePageStoreBase, Store {
  final _$allPostsAtom = Atom(name: 'LoggedHomePageStoreBase.allPosts');

  @override
  ObservableList<PostResponseEntity> get allPosts {
    _$allPostsAtom.reportRead();
    return super.allPosts;
  }

  @override
  set allPosts(ObservableList<PostResponseEntity> value) {
    _$allPostsAtom.reportWrite(value, super.allPosts, () {
      super.allPosts = value;
    });
  }

  final _$myPostsAtom = Atom(name: 'LoggedHomePageStoreBase.myPosts');

  @override
  ObservableList<PostResponseEntity> get myPosts {
    _$myPostsAtom.reportRead();
    return super.myPosts;
  }

  @override
  set myPosts(ObservableList<PostResponseEntity> value) {
    _$myPostsAtom.reportWrite(value, super.myPosts, () {
      super.myPosts = value;
    });
  }

  final _$loadingAtom = Atom(name: 'LoggedHomePageStoreBase.loading');

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

  final _$myPostsLoadingAtom =
      Atom(name: 'LoggedHomePageStoreBase.myPostsLoading');

  @override
  bool get myPostsLoading {
    _$myPostsLoadingAtom.reportRead();
    return super.myPostsLoading;
  }

  @override
  set myPostsLoading(bool value) {
    _$myPostsLoadingAtom.reportWrite(value, super.myPostsLoading, () {
      super.myPostsLoading = value;
    });
  }

  final _$errorAtom = Atom(name: 'LoggedHomePageStoreBase.error');

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

  final _$myPostsErrorAtom = Atom(name: 'LoggedHomePageStoreBase.myPostsError');

  @override
  String get myPostsError {
    _$myPostsErrorAtom.reportRead();
    return super.myPostsError;
  }

  @override
  set myPostsError(String value) {
    _$myPostsErrorAtom.reportWrite(value, super.myPostsError, () {
      super.myPostsError = value;
    });
  }

  @override
  String toString() {
    return '''
allPosts: ${allPosts},
myPosts: ${myPosts},
loading: ${loading},
myPostsLoading: ${myPostsLoading},
error: ${error},
myPostsError: ${myPostsError}
    ''';
  }
}
