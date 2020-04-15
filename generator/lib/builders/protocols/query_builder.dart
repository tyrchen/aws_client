import 'package:aws_client.generator/builders/protocols/service_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';

class QueryServiceBuilder extends ServiceBuilder {
  final Api api;

  QueryServiceBuilder(this.api);

  @override
  String constructor() => '''
  final _s.QueryProtocol _protocol;

  ${api.metadata.className}({@_s.required String region, @_s.required _s.AwsClientCredentials credentials, _s.Client client,})
  : _protocol = _s.QueryProtocol(client: client, service: \'${api.metadata.endpointPrefix}\', region: region, credentials: credentials,);
  ''';

  @override
  String imports() => '';

  @override
  String operationContent(Operation operation) {
    final parameterShape = api.shapes[operation.parameterType];

    final buf = StringBuffer();
    buf.writeln('    final \$request = <String, dynamic>{\n'
        '      \'Action\': \'${operation.name}\',\n'
        '      \'Version\': \'${api.metadata.apiVersion}\',');
    buf.writeln('    };');
    parameterShape?.members?.forEach((member) {
      String Function(String arg) transform;
      final attrBaseName = member.locationName ?? member.name;
      if (member.shapeClass.type == 'list' &&
          !member.shapeClass.member.shapeClass.isBasicTypeOrEnum) {
        transform = (x) =>
            '\$request[\'$attrBaseName\'] = $x.map((v) => v.toJson()).toList()';
      } else if (member.shapeClass.type == 'map' &&
          member.flattened &&
          !member.shapeClass.value.shapeClass.isBasicTypeOrEnum) {
        transform = (x) =>
            '\$request.addEntries(_s.flattenQueryParams(<String>[\'$attrBaseName\'], Map.fromEntries($x.entries.map((e) => MapEntry(e.key, e.value.toJson()))), flatten: true))';
      } else if (member.shapeClass.type == 'map' &&
          !member.shapeClass.value.shapeClass.isBasicTypeOrEnum) {
        transform = (x) =>
            '\$request[\'$attrBaseName\'] = Map.fromEntries($x.entries.map((e) => MapEntry(e.key, e.value.toJson())))';
      }
      transform ??= (x) => '\$request[\'$attrBaseName\'] = $x';

      if (member.isRequired) {
        buf.writeln('${transform(member.fieldName)};');
      } else {
        buf.writeln("${member.fieldName}?.also((arg) => ${transform('arg')});");
      }
    });
    final params = StringBuffer('\$request, '
        'method: \'${operation.http.method}\', '
        'requestUri: \'${operation.http.requestUri}\', '
        'exceptionFnMap: _exceptionFns, ');
    if (operation.output?.resultWrapper != null) {
      params.write('resultWrapper: \'${operation.output.resultWrapper}\',');
    }
    if (operation.hasReturnType) {
      buf.writeln('    final \$result = await _protocol.send($params);');
      buf.writeln('    return ${operation.returnType}.fromXml(\$result);');
    } else {
      buf.writeln('    await _protocol.send($params);');
    }
    return buf.toString();
  }
}
