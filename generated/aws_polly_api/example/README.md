```dart
import 'package:aws_polly_api/polly-2016-06-10.dart';

void main() {
  final credentials = AwsClientCredentials(accessKey: '', secretKey: '');
  final service = Polly(region: 'eu-west-1', credentials: credentials);
  // See documentation on how to use Polly
}
```
