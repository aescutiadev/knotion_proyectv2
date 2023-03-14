// Mocks generated by Mockito 5.3.2 from annotations
// in test_project2/test/src/serie_detail/aplication/get_serie_detail_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:test_project2/src/serie_detail/domain/serie_detail_class.dart'
    as _i2;
import 'package:test_project2/src/serie_detail/domain/serie_detail_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeSerieDetail_0 extends _i1.SmartFake implements _i2.SerieDetail {
  _FakeSerieDetail_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SerieDetailRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSerieDetailRepository extends _i1.Mock
    implements _i3.SerieDetailRepository {
  MockSerieDetailRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.SerieDetail> getSerieDetail(String? baseUrl) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSerieDetail,
          [baseUrl],
        ),
        returnValue: _i4.Future<_i2.SerieDetail>.value(_FakeSerieDetail_0(
          this,
          Invocation.method(
            #getSerieDetail,
            [baseUrl],
          ),
        )),
      ) as _i4.Future<_i2.SerieDetail>);
}
