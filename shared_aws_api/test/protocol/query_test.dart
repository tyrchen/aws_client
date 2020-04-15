import 'package:test/test.dart';

import 'package:shared_aws_api/src/protocol/query.dart';

void main() {
  group('flatQueryParams', () {
    test('string values', () {
      expect(queryParamsAsFlatMap({'Version': ''}), {'Version': ''});
      expect(queryParamsAsFlatMap({'Version': '1.2.3'}), {'Version': '1.2.3'});
    });

    test('empty list', () {
      expect(
        queryParamsAsFlatMap({'List': []}),
        {
          'List': '',
        },
      );
    });

    test('list', () {
      expect(
        queryParamsAsFlatMap({
          'List': ['a', 'b']
        }),
        {
          'List.1': 'a',
          'List.2': 'b',
        },
      );
    });

    test('empty map', () {
      expect(queryParamsAsFlatMap({'Map': {}}), {});
    });

    test('map', () {
      expect(
        queryParamsAsFlatMap({
          'Map': {'a': 'A', 'b': 'B'}
        }),
        {
          'Map.entry.1.key': 'a',
          'Map.entry.1.value': 'A',
          'Map.entry.2.key': 'b',
          'Map.entry.2.value': 'B',
        },
      );
    });
  });
}
