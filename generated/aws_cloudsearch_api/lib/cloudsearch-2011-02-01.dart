// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822fromJson,
        rfc822toJson,
        iso8601fromJson,
        iso8601toJson,
        unixFromJson,
        unixToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'cloudsearch-2011-02-01.g.dart';

/// You use the configuration service to create, configure, and manage search
/// domains. Configuration service requests are submitted using the AWS Query
/// protocol. AWS Query requests are HTTP or HTTPS requests submitted via HTTP
/// GET or POST with a query parameter named Action.
class CloudSearch {
  final _s.QueryProtocol _protocol;

  CloudSearch({
    @_s.required String region,
    @_s.required _s.AwsClientCredentials credentials,
    _s.Client client,
  }) : _protocol = _s.QueryProtocol(
          client: client,
          service: 'cloudsearch',
          region: region,
          credentials: credentials,
        );

  /// Creates a new search domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  Future<CreateDomainResponse> createDomain({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    final $request = <String, dynamic>{
      'Action': 'CreateDomain',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateDomainResult',
    );
    return CreateDomainResponse.fromXml($result);
  }

  /// Configures an <code>IndexField</code> for the search domain. Used to
  /// create new fields and modify existing ones. If the field exists, the new
  /// configuration replaces the old one. You can configure a maximum of 200
  /// index fields.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
  Future<DefineIndexFieldResponse> defineIndexField({
    @_s.required String domainName,
    @_s.required IndexField indexField,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    ArgumentError.checkNotNull(indexField, 'indexField');
    final $request = <String, dynamic>{
      'Action': 'DefineIndexField',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    $request['IndexField'] = indexField;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DefineIndexFieldResult',
    );
    return DefineIndexFieldResponse.fromXml($result);
  }

  /// Configures a <code>RankExpression</code> for the search domain. Used to
  /// create new rank expressions and modify existing ones. If the expression
  /// exists, the new configuration replaces the old one. You can configure a
  /// maximum of 50 rank expressions.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
  Future<DefineRankExpressionResponse> defineRankExpression({
    @_s.required String domainName,
    @_s.required NamedRankExpression rankExpression,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    ArgumentError.checkNotNull(rankExpression, 'rankExpression');
    final $request = <String, dynamic>{
      'Action': 'DefineRankExpression',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    $request['RankExpression'] = rankExpression;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DefineRankExpressionResult',
    );
    return DefineRankExpressionResponse.fromXml($result);
  }

  /// Permanently deletes a search domain and all of its data.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  Future<DeleteDomainResponse> deleteDomain({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    final $request = <String, dynamic>{
      'Action': 'DeleteDomain',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DeleteDomainResult',
    );
    return DeleteDomainResponse.fromXml($result);
  }

  /// Removes an <code>IndexField</code> from the search domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
  Future<DeleteIndexFieldResponse> deleteIndexField({
    @_s.required String domainName,
    @_s.required String indexFieldName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    ArgumentError.checkNotNull(indexFieldName, 'indexFieldName');
    _s.validateStringLength(
      'indexFieldName',
      indexFieldName,
      1,
      64,
    );
    _s.validateStringPattern(
      'indexFieldName',
      indexFieldName,
      r'[a-z][a-z0-9_]*',
    );
    final $request = <String, dynamic>{
      'Action': 'DeleteIndexField',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    $request['IndexFieldName'] = indexFieldName;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DeleteIndexFieldResult',
    );
    return DeleteIndexFieldResponse.fromXml($result);
  }

  /// Removes a <code>RankExpression</code> from the search domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [rankName] :
  /// The name of the <code>RankExpression</code> to delete.
  Future<DeleteRankExpressionResponse> deleteRankExpression({
    @_s.required String domainName,
    @_s.required String rankName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    ArgumentError.checkNotNull(rankName, 'rankName');
    _s.validateStringLength(
      'rankName',
      rankName,
      1,
      64,
    );
    _s.validateStringPattern(
      'rankName',
      rankName,
      r'[a-z][a-z0-9_]*',
    );
    final $request = <String, dynamic>{
      'Action': 'DeleteRankExpression',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    $request['RankName'] = rankName;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DeleteRankExpressionResult',
    );
    return DeleteRankExpressionResponse.fromXml($result);
  }

  /// Gets the availability options configured for a domain. By default, shows
  /// the configuration with any pending changes. Set the <code>Deployed</code>
  /// option to <code>true</code> to show the active configuration and exclude
  /// pending changes. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-availability-options.html"
  /// target="_blank">Configuring Availability Options</a> in the <i>Amazon
  /// CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain you want to describe.
  Future<DescribeAvailabilityOptionsResponse> describeAvailabilityOptions({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    final $request = <String, dynamic>{
      'Action': 'DescribeAvailabilityOptions',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeAvailabilityOptionsResult',
    );
    return DescribeAvailabilityOptionsResponse.fromXml($result);
  }

  /// Gets the default search field configured for the search domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  Future<DescribeDefaultSearchFieldResponse> describeDefaultSearchField({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    final $request = <String, dynamic>{
      'Action': 'DescribeDefaultSearchField',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeDefaultSearchFieldResult',
    );
    return DescribeDefaultSearchFieldResponse.fromXml($result);
  }

  /// Gets information about the search domains owned by this account. Can be
  /// limited to specific domains. Shows all domains by default.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  ///
  /// Parameter [domainNames] :
  /// Limits the DescribeDomains response to the specified search domains.
  Future<DescribeDomainsResponse> describeDomains({
    List<String> domainNames,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'DescribeDomains',
      'Version': '2011-02-01',
    };
    domainNames?.also((arg) => $request['DomainNames'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeDomainsResult',
    );
    return DescribeDomainsResponse.fromXml($result);
  }

  /// Gets information about the index fields configured for the search domain.
  /// Can be limited to specific fields by name. Shows all fields by default.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [fieldNames] :
  /// Limits the <code>DescribeIndexFields</code> response to the specified
  /// fields.
  Future<DescribeIndexFieldsResponse> describeIndexFields({
    @_s.required String domainName,
    List<String> fieldNames,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    final $request = <String, dynamic>{
      'Action': 'DescribeIndexFields',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    fieldNames?.also((arg) => $request['FieldNames'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeIndexFieldsResult',
    );
    return DescribeIndexFieldsResponse.fromXml($result);
  }

  /// Gets the rank expressions configured for the search domain. Can be limited
  /// to specific rank expressions by name. Shows all rank expressions by
  /// default.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [rankNames] :
  /// Limits the <code>DescribeRankExpressions</code> response to the specified
  /// fields.
  Future<DescribeRankExpressionsResponse> describeRankExpressions({
    @_s.required String domainName,
    List<String> rankNames,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    final $request = <String, dynamic>{
      'Action': 'DescribeRankExpressions',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    rankNames?.also((arg) => $request['RankNames'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeRankExpressionsResult',
    );
    return DescribeRankExpressionsResponse.fromXml($result);
  }

  /// Gets information about the resource-based policies that control access to
  /// the domain's document and search services.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  Future<DescribeServiceAccessPoliciesResponse> describeServiceAccessPolicies({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    final $request = <String, dynamic>{
      'Action': 'DescribeServiceAccessPolicies',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeServiceAccessPoliciesResult',
    );
    return DescribeServiceAccessPoliciesResponse.fromXml($result);
  }

  /// Gets the stemming dictionary configured for the search domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  Future<DescribeStemmingOptionsResponse> describeStemmingOptions({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    final $request = <String, dynamic>{
      'Action': 'DescribeStemmingOptions',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeStemmingOptionsResult',
    );
    return DescribeStemmingOptionsResponse.fromXml($result);
  }

  /// Gets the stopwords configured for the search domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  Future<DescribeStopwordOptionsResponse> describeStopwordOptions({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    final $request = <String, dynamic>{
      'Action': 'DescribeStopwordOptions',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeStopwordOptionsResult',
    );
    return DescribeStopwordOptionsResponse.fromXml($result);
  }

  /// Gets the synonym dictionary configured for the search domain.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  Future<DescribeSynonymOptionsResponse> describeSynonymOptions({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    final $request = <String, dynamic>{
      'Action': 'DescribeSynonymOptions',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeSynonymOptionsResult',
    );
    return DescribeSynonymOptionsResponse.fromXml($result);
  }

  /// Tells the search domain to start indexing its documents using the latest
  /// text processing options and <code>IndexFields</code>. This operation must
  /// be invoked to make options whose <a>OptionStatus</a> has
  /// <code>OptionState</code> of <code>RequiresIndexDocuments</code> visible in
  /// search results.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  Future<IndexDocumentsResponse> indexDocuments({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    final $request = <String, dynamic>{
      'Action': 'IndexDocuments',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'IndexDocumentsResult',
    );
    return IndexDocumentsResponse.fromXml($result);
  }

  /// Configures the availability options for a domain. Enabling the Multi-AZ
  /// option expands an Amazon CloudSearch domain to an additional Availability
  /// Zone in the same Region to increase fault tolerance in the event of a
  /// service disruption. Changes to the Multi-AZ option can take about half an
  /// hour to become active. For more information, see <a
  /// href="http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-availability-options.html"
  /// target="_blank">Configuring Availability Options</a> in the <i>Amazon
  /// CloudSearch Developer Guide</i>.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DisabledOperationException].
  ///
  /// Parameter [multiAZ] :
  /// You expand an existing search domain to a second Availability Zone by
  /// setting the Multi-AZ option to true. Similarly, you can turn off the
  /// Multi-AZ option to downgrade the domain to a single Availability Zone by
  /// setting the Multi-AZ option to <code>false</code>.
  Future<UpdateAvailabilityOptionsResponse> updateAvailabilityOptions({
    @_s.required String domainName,
    @_s.required bool multiAZ,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    ArgumentError.checkNotNull(multiAZ, 'multiAZ');
    final $request = <String, dynamic>{
      'Action': 'UpdateAvailabilityOptions',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    $request['MultiAZ'] = multiAZ;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'UpdateAvailabilityOptionsResult',
    );
    return UpdateAvailabilityOptionsResponse.fromXml($result);
  }

  /// Configures the default search field for the search domain. The default
  /// search field is the text field that is searched when a search request does
  /// not specify which fields to search. By default, it is configured to
  /// include the contents of all of the domain's text fields.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [defaultSearchField] :
  /// The text field to search if the search request does not specify which
  /// field to search. The default search field is used when search terms are
  /// specified with the <code>q</code> parameter, or if a match expression
  /// specified with the <code>bq</code> parameter does not constrain the search
  /// to a particular field. The default is an empty string, which automatically
  /// searches all text fields.
  Future<UpdateDefaultSearchFieldResponse> updateDefaultSearchField({
    @_s.required String defaultSearchField,
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(defaultSearchField, 'defaultSearchField');
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    final $request = <String, dynamic>{
      'Action': 'UpdateDefaultSearchField',
      'Version': '2011-02-01',
    };
    $request['DefaultSearchField'] = defaultSearchField;
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'UpdateDefaultSearchFieldResult',
    );
    return UpdateDefaultSearchFieldResponse.fromXml($result);
  }

  /// Configures the policies that control access to the domain's document and
  /// search services. The maximum size of an access policy document is 100 KB.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidTypeException].
  Future<UpdateServiceAccessPoliciesResponse> updateServiceAccessPolicies({
    @_s.required String accessPolicies,
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(accessPolicies, 'accessPolicies');
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    final $request = <String, dynamic>{
      'Action': 'UpdateServiceAccessPolicies',
      'Version': '2011-02-01',
    };
    $request['AccessPolicies'] = accessPolicies;
    $request['DomainName'] = domainName;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'UpdateServiceAccessPoliciesResult',
    );
    return UpdateServiceAccessPoliciesResponse.fromXml($result);
  }

  /// Configures a stemming dictionary for the search domain. The stemming
  /// dictionary is used during indexing and when processing search requests.
  /// The maximum size of the stemming dictionary is 500 KB.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  Future<UpdateStemmingOptionsResponse> updateStemmingOptions({
    @_s.required String domainName,
    @_s.required String stems,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    ArgumentError.checkNotNull(stems, 'stems');
    final $request = <String, dynamic>{
      'Action': 'UpdateStemmingOptions',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    $request['Stems'] = stems;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'UpdateStemmingOptionsResult',
    );
    return UpdateStemmingOptionsResponse.fromXml($result);
  }

  /// Configures stopwords for the search domain. Stopwords are used during
  /// indexing and when processing search requests. The maximum size of the
  /// stopwords dictionary is 10 KB.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  Future<UpdateStopwordOptionsResponse> updateStopwordOptions({
    @_s.required String domainName,
    @_s.required String stopwords,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    ArgumentError.checkNotNull(stopwords, 'stopwords');
    final $request = <String, dynamic>{
      'Action': 'UpdateStopwordOptions',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    $request['Stopwords'] = stopwords;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'UpdateStopwordOptionsResult',
    );
    return UpdateStopwordOptionsResponse.fromXml($result);
  }

  /// Configures a synonym dictionary for the search domain. The synonym
  /// dictionary is used during indexing to configure mappings for terms that
  /// occur in text fields. The maximum size of the synonym dictionary is 100
  /// KB.
  ///
  /// May throw [BaseException].
  /// May throw [InternalException].
  /// May throw [InvalidTypeException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  Future<UpdateSynonymOptionsResponse> updateSynonymOptions({
    @_s.required String domainName,
    @_s.required String synonyms,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      3,
      28,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'[a-z][a-z0-9\-]+',
    );
    ArgumentError.checkNotNull(synonyms, 'synonyms');
    final $request = <String, dynamic>{
      'Action': 'UpdateSynonymOptions',
      'Version': '2011-02-01',
    };
    $request['DomainName'] = domainName;
    $request['Synonyms'] = synonyms;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'UpdateSynonymOptionsResult',
    );
    return UpdateSynonymOptionsResponse.fromXml($result);
  }
}

/// A <code>PolicyDocument</code> that specifies access policies for the search
/// domain's services, and the current status of those policies.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class AccessPoliciesStatus {
  @_s.JsonKey(name: 'Options')
  final String options;
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  AccessPoliciesStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory AccessPoliciesStatus.fromXml(_s.XmlElement elem) {
    return AccessPoliciesStatus(
      options: _s.extractXmlStringValue(elem, 'Options'),
      status: _s
          .extractXmlChild(elem, 'Status')
          ?.let((e) => OptionStatus.fromXml(e)),
    );
  }
}

/// The status and configuration of the domain's availability options.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class AvailabilityOptionsStatus {
  /// The availability options configured for the domain.
  @_s.JsonKey(name: 'Options')
  final bool options;
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  AvailabilityOptionsStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory AvailabilityOptionsStatus.fromXml(_s.XmlElement elem) {
    return AvailabilityOptionsStatus(
      options: _s.extractXmlBoolValue(elem, 'Options'),
      status: _s
          .extractXmlChild(elem, 'Status')
          ?.let((e) => OptionStatus.fromXml(e)),
    );
  }
}

/// An error occurred while processing the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class BaseException implements _s.AwsException {
  @_s.JsonKey(name: 'Code')
  final String code;
  @_s.JsonKey(name: 'Message')
  final String message;

  BaseException({
    this.code,
    this.message,
  });
  factory BaseException.fromXml(_s.XmlElement elem) {
    return BaseException(
      code: _s.extractXmlStringValue(elem, 'Code'),
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }
}

/// A response message that contains the status of a newly created domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class CreateDomainResponse {
  @_s.JsonKey(name: 'DomainStatus')
  final DomainStatus domainStatus;

  CreateDomainResponse({
    this.domainStatus,
  });
  factory CreateDomainResponse.fromXml(_s.XmlElement elem) {
    return CreateDomainResponse(
      domainStatus: _s
          .extractXmlChild(elem, 'DomainStatus')
          ?.let((e) => DomainStatus.fromXml(e)),
    );
  }
}

/// The value of the <code>DefaultSearchField</code> configured for this search
/// domain and its current status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DefaultSearchFieldStatus {
  /// The name of the <code>IndexField</code> to use as the default search field.
  /// The default is an empty string, which automatically searches all text
  /// fields.
  @_s.JsonKey(name: 'Options')
  final String options;
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  DefaultSearchFieldStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory DefaultSearchFieldStatus.fromXml(_s.XmlElement elem) {
    return DefaultSearchFieldStatus(
      options: _s.extractXmlStringValue(elem, 'Options'),
      status: _s
          .extractXmlChild(elem, 'Status')
          ?.let((e) => OptionStatus.fromXml(e)),
    );
  }
}

/// A response message that contains the status of an updated index field.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DefineIndexFieldResponse {
  @_s.JsonKey(name: 'IndexField')
  final IndexFieldStatus indexField;

  DefineIndexFieldResponse({
    @_s.required this.indexField,
  });
  factory DefineIndexFieldResponse.fromXml(_s.XmlElement elem) {
    return DefineIndexFieldResponse(
      indexField: _s
          .extractXmlChild(elem, 'IndexField')
          ?.let((e) => IndexFieldStatus.fromXml(e)),
    );
  }
}

/// A response message that contains the status of an updated
/// <code>RankExpression</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DefineRankExpressionResponse {
  @_s.JsonKey(name: 'RankExpression')
  final RankExpressionStatus rankExpression;

  DefineRankExpressionResponse({
    @_s.required this.rankExpression,
  });
  factory DefineRankExpressionResponse.fromXml(_s.XmlElement elem) {
    return DefineRankExpressionResponse(
      rankExpression: _s
          .extractXmlChild(elem, 'RankExpression')
          ?.let((e) => RankExpressionStatus.fromXml(e)),
    );
  }
}

/// A response message that contains the status of a newly deleted domain, or no
/// status if the domain has already been completely deleted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DeleteDomainResponse {
  @_s.JsonKey(name: 'DomainStatus')
  final DomainStatus domainStatus;

  DeleteDomainResponse({
    this.domainStatus,
  });
  factory DeleteDomainResponse.fromXml(_s.XmlElement elem) {
    return DeleteDomainResponse(
      domainStatus: _s
          .extractXmlChild(elem, 'DomainStatus')
          ?.let((e) => DomainStatus.fromXml(e)),
    );
  }
}

/// A response message that contains the status of a deleted index field.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DeleteIndexFieldResponse {
  @_s.JsonKey(name: 'IndexField')
  final IndexFieldStatus indexField;

  DeleteIndexFieldResponse({
    @_s.required this.indexField,
  });
  factory DeleteIndexFieldResponse.fromXml(_s.XmlElement elem) {
    return DeleteIndexFieldResponse(
      indexField: _s
          .extractXmlChild(elem, 'IndexField')
          ?.let((e) => IndexFieldStatus.fromXml(e)),
    );
  }
}

/// A response message that contains the status of a deleted
/// <code>RankExpression</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DeleteRankExpressionResponse {
  @_s.JsonKey(name: 'RankExpression')
  final RankExpressionStatus rankExpression;

  DeleteRankExpressionResponse({
    @_s.required this.rankExpression,
  });
  factory DeleteRankExpressionResponse.fromXml(_s.XmlElement elem) {
    return DeleteRankExpressionResponse(
      rankExpression: _s
          .extractXmlChild(elem, 'RankExpression')
          ?.let((e) => RankExpressionStatus.fromXml(e)),
    );
  }
}

/// The result of a <code>DescribeAvailabilityOptions</code> request. Indicates
/// whether or not the Multi-AZ option is enabled for the domain specified in
/// the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DescribeAvailabilityOptionsResponse {
  /// The availability options configured for the domain. Indicates whether
  /// Multi-AZ is enabled for the domain.
  @_s.JsonKey(name: 'AvailabilityOptions')
  final AvailabilityOptionsStatus availabilityOptions;

  DescribeAvailabilityOptionsResponse({
    this.availabilityOptions,
  });
  factory DescribeAvailabilityOptionsResponse.fromXml(_s.XmlElement elem) {
    return DescribeAvailabilityOptionsResponse(
      availabilityOptions: _s
          .extractXmlChild(elem, 'AvailabilityOptions')
          ?.let((e) => AvailabilityOptionsStatus.fromXml(e)),
    );
  }
}

/// A response message that contains the default search field for a search
/// domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DescribeDefaultSearchFieldResponse {
  /// The name of the <code>IndexField</code> to use for search requests issued
  /// with the <code>q</code> parameter. The default is the empty string, which
  /// automatically searches all text fields.
  @_s.JsonKey(name: 'DefaultSearchField')
  final DefaultSearchFieldStatus defaultSearchField;

  DescribeDefaultSearchFieldResponse({
    @_s.required this.defaultSearchField,
  });
  factory DescribeDefaultSearchFieldResponse.fromXml(_s.XmlElement elem) {
    return DescribeDefaultSearchFieldResponse(
      defaultSearchField: _s
          .extractXmlChild(elem, 'DefaultSearchField')
          ?.let((e) => DefaultSearchFieldStatus.fromXml(e)),
    );
  }
}

/// A response message that contains the status of one or more domains.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DescribeDomainsResponse {
  @_s.JsonKey(name: 'DomainStatusList')
  final List<DomainStatus> domainStatusList;

  DescribeDomainsResponse({
    @_s.required this.domainStatusList,
  });
  factory DescribeDomainsResponse.fromXml(_s.XmlElement elem) {
    return DescribeDomainsResponse(
      domainStatusList: _s.extractXmlChild(elem, 'DomainStatusList')?.let(
          (elem) => elem
              .findElements('DomainStatusList')
              .map((c) => DomainStatus.fromXml(c))
              .toList()),
    );
  }
}

/// A response message that contains the index fields for a search domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DescribeIndexFieldsResponse {
  /// The index fields configured for the domain.
  @_s.JsonKey(name: 'IndexFields')
  final List<IndexFieldStatus> indexFields;

  DescribeIndexFieldsResponse({
    @_s.required this.indexFields,
  });
  factory DescribeIndexFieldsResponse.fromXml(_s.XmlElement elem) {
    return DescribeIndexFieldsResponse(
      indexFields: _s.extractXmlChild(elem, 'IndexFields')?.let((elem) => elem
          .findElements('IndexFields')
          .map((c) => IndexFieldStatus.fromXml(c))
          .toList()),
    );
  }
}

/// A response message that contains the rank expressions for a search domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DescribeRankExpressionsResponse {
  /// The rank expressions configured for the domain.
  @_s.JsonKey(name: 'RankExpressions')
  final List<RankExpressionStatus> rankExpressions;

  DescribeRankExpressionsResponse({
    @_s.required this.rankExpressions,
  });
  factory DescribeRankExpressionsResponse.fromXml(_s.XmlElement elem) {
    return DescribeRankExpressionsResponse(
      rankExpressions: _s.extractXmlChild(elem, 'RankExpressions')?.let(
          (elem) => elem
              .findElements('RankExpressions')
              .map((c) => RankExpressionStatus.fromXml(c))
              .toList()),
    );
  }
}

/// A response message that contains the access policies for a domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DescribeServiceAccessPoliciesResponse {
  @_s.JsonKey(name: 'AccessPolicies')
  final AccessPoliciesStatus accessPolicies;

  DescribeServiceAccessPoliciesResponse({
    @_s.required this.accessPolicies,
  });
  factory DescribeServiceAccessPoliciesResponse.fromXml(_s.XmlElement elem) {
    return DescribeServiceAccessPoliciesResponse(
      accessPolicies: _s
          .extractXmlChild(elem, 'AccessPolicies')
          ?.let((e) => AccessPoliciesStatus.fromXml(e)),
    );
  }
}

/// A response message that contains the stemming options for a search domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DescribeStemmingOptionsResponse {
  @_s.JsonKey(name: 'Stems')
  final StemmingOptionsStatus stems;

  DescribeStemmingOptionsResponse({
    @_s.required this.stems,
  });
  factory DescribeStemmingOptionsResponse.fromXml(_s.XmlElement elem) {
    return DescribeStemmingOptionsResponse(
      stems: _s
          .extractXmlChild(elem, 'Stems')
          ?.let((e) => StemmingOptionsStatus.fromXml(e)),
    );
  }
}

/// A response message that contains the stopword options for a search domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DescribeStopwordOptionsResponse {
  @_s.JsonKey(name: 'Stopwords')
  final StopwordOptionsStatus stopwords;

  DescribeStopwordOptionsResponse({
    @_s.required this.stopwords,
  });
  factory DescribeStopwordOptionsResponse.fromXml(_s.XmlElement elem) {
    return DescribeStopwordOptionsResponse(
      stopwords: _s
          .extractXmlChild(elem, 'Stopwords')
          ?.let((e) => StopwordOptionsStatus.fromXml(e)),
    );
  }
}

/// A response message that contains the synonym options for a search domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DescribeSynonymOptionsResponse {
  @_s.JsonKey(name: 'Synonyms')
  final SynonymOptionsStatus synonyms;

  DescribeSynonymOptionsResponse({
    @_s.required this.synonyms,
  });
  factory DescribeSynonymOptionsResponse.fromXml(_s.XmlElement elem) {
    return DescribeSynonymOptionsResponse(
      synonyms: _s
          .extractXmlChild(elem, 'Synonyms')
          ?.let((e) => SynonymOptionsStatus.fromXml(e)),
    );
  }
}

/// The request was rejected because it attempted an operation which is not
/// enabled.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DisabledOperationException implements _s.AwsException {
  DisabledOperationException();
  factory DisabledOperationException.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DisabledOperationException();
  }
}

/// The current status of the search domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DomainStatus {
  @_s.JsonKey(name: 'DomainId')
  final String domainId;
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// True if <a>IndexDocuments</a> needs to be called to activate the current
  /// domain configuration.
  @_s.JsonKey(name: 'RequiresIndexDocuments')
  final bool requiresIndexDocuments;

  /// True if the search domain is created. It can take several minutes to
  /// initialize a domain when <a>CreateDomain</a> is called. Newly created search
  /// domains are returned from <a>DescribeDomains</a> with a false value for
  /// Created until domain creation is complete.
  @_s.JsonKey(name: 'Created')
  final bool created;

  /// True if the search domain has been deleted. The system must clean up
  /// resources dedicated to the search domain when <a>DeleteDomain</a> is called.
  /// Newly deleted search domains are returned from <a>DescribeDomains</a> with a
  /// true value for IsDeleted for several minutes until resource cleanup is
  /// complete.
  @_s.JsonKey(name: 'Deleted')
  final bool deleted;

  /// The service endpoint for updating documents in a search domain.
  @_s.JsonKey(name: 'DocService')
  final ServiceEndpoint docService;

  /// The number of documents that have been submitted to the domain and indexed.
  @_s.JsonKey(name: 'NumSearchableDocs')
  final int numSearchableDocs;

  /// True if processing is being done to activate the current domain
  /// configuration.
  @_s.JsonKey(name: 'Processing')
  final bool processing;

  /// The number of search instances that are available to process search
  /// requests.
  @_s.JsonKey(name: 'SearchInstanceCount')
  final int searchInstanceCount;

  /// The instance type (such as search.m1.small) that is being used to process
  /// search requests.
  @_s.JsonKey(name: 'SearchInstanceType')
  final String searchInstanceType;

  /// The number of partitions across which the search index is spread.
  @_s.JsonKey(name: 'SearchPartitionCount')
  final int searchPartitionCount;

  /// The service endpoint for requesting search results from a search domain.
  @_s.JsonKey(name: 'SearchService')
  final ServiceEndpoint searchService;

  DomainStatus({
    @_s.required this.domainId,
    @_s.required this.domainName,
    @_s.required this.requiresIndexDocuments,
    this.created,
    this.deleted,
    this.docService,
    this.numSearchableDocs,
    this.processing,
    this.searchInstanceCount,
    this.searchInstanceType,
    this.searchPartitionCount,
    this.searchService,
  });
  factory DomainStatus.fromXml(_s.XmlElement elem) {
    return DomainStatus(
      domainId: _s.extractXmlStringValue(elem, 'DomainId'),
      domainName: _s.extractXmlStringValue(elem, 'DomainName'),
      requiresIndexDocuments:
          _s.extractXmlBoolValue(elem, 'RequiresIndexDocuments'),
      created: _s.extractXmlBoolValue(elem, 'Created'),
      deleted: _s.extractXmlBoolValue(elem, 'Deleted'),
      docService: _s
          .extractXmlChild(elem, 'DocService')
          ?.let((e) => ServiceEndpoint.fromXml(e)),
      numSearchableDocs: _s.extractXmlIntValue(elem, 'NumSearchableDocs'),
      processing: _s.extractXmlBoolValue(elem, 'Processing'),
      searchInstanceCount: _s.extractXmlIntValue(elem, 'SearchInstanceCount'),
      searchInstanceType: _s.extractXmlStringValue(elem, 'SearchInstanceType'),
      searchPartitionCount: _s.extractXmlIntValue(elem, 'SearchPartitionCount'),
      searchService: _s
          .extractXmlChild(elem, 'SearchService')
          ?.let((e) => ServiceEndpoint.fromXml(e)),
    );
  }
}

/// The result of an <code>IndexDocuments</code> action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class IndexDocumentsResponse {
  /// The names of the fields that are currently being processed due to an
  /// <code>IndexDocuments</code> action.
  @_s.JsonKey(name: 'FieldNames')
  final List<String> fieldNames;

  IndexDocumentsResponse({
    this.fieldNames,
  });
  factory IndexDocumentsResponse.fromXml(_s.XmlElement elem) {
    return IndexDocumentsResponse(
      fieldNames: _s
          .extractXmlChild(elem, 'FieldNames')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'FieldNames')),
    );
  }
}

/// Defines a field in the index, including its name, type, and the source of
/// its data. The <code>IndexFieldType</code> indicates which of the options
/// will be present. It is invalid to specify options for a type other than the
/// <code>IndexFieldType</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class IndexField {
  /// The name of a field in the search index. Field names must begin with a
  /// letter and can contain the following characters: a-z (lowercase), 0-9, and _
  /// (underscore). Uppercase letters and hyphens are not allowed. The names
  /// "body", "docid", and "text_relevance" are reserved and cannot be specified
  /// as field or rank expression names.
  @_s.JsonKey(name: 'IndexFieldName')
  final String indexFieldName;

  /// The type of field. Based on this type, exactly one of the
  /// <a>UIntOptions</a>, <a>LiteralOptions</a> or <a>TextOptions</a> must be
  /// present.
  @_s.JsonKey(name: 'IndexFieldType')
  final IndexFieldType indexFieldType;

  /// Options for literal field. Present if <code>IndexFieldType</code> specifies
  /// the field is of type literal.
  @_s.JsonKey(name: 'LiteralOptions')
  final LiteralOptions literalOptions;

  /// An optional list of source attributes that provide data for this index
  /// field. If not specified, the data is pulled from a source attribute with the
  /// same name as this <code>IndexField</code>. When one or more source
  /// attributes are specified, an optional data transformation can be applied to
  /// the source data when populating the index field. You can configure a maximum
  /// of 20 sources for an <code>IndexField</code>.
  @_s.JsonKey(name: 'SourceAttributes')
  final List<SourceAttribute> sourceAttributes;

  /// Options for text field. Present if <code>IndexFieldType</code> specifies the
  /// field is of type text.
  @_s.JsonKey(name: 'TextOptions')
  final TextOptions textOptions;

  /// Options for an unsigned integer field. Present if
  /// <code>IndexFieldType</code> specifies the field is of type unsigned integer.
  @_s.JsonKey(name: 'UIntOptions')
  final UIntOptions uIntOptions;

  IndexField({
    @_s.required this.indexFieldName,
    @_s.required this.indexFieldType,
    this.literalOptions,
    this.sourceAttributes,
    this.textOptions,
    this.uIntOptions,
  });
  factory IndexField.fromXml(_s.XmlElement elem) {
    return IndexField(
      indexFieldName: _s.extractXmlStringValue(elem, 'IndexFieldName'),
      indexFieldType:
          _s.extractXmlStringValue(elem, 'IndexFieldType')?.toIndexFieldType(),
      literalOptions: _s
          .extractXmlChild(elem, 'LiteralOptions')
          ?.let((e) => LiteralOptions.fromXml(e)),
      sourceAttributes: _s.extractXmlChild(elem, 'SourceAttributes')?.let(
          (elem) => elem
              .findElements('SourceAttributes')
              .map((c) => SourceAttribute.fromXml(c))
              .toList()),
      textOptions: _s
          .extractXmlChild(elem, 'TextOptions')
          ?.let((e) => TextOptions.fromXml(e)),
      uIntOptions: _s
          .extractXmlChild(elem, 'UIntOptions')
          ?.let((e) => UIntOptions.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() => _$IndexFieldToJson(this);
}

/// The value of an <code>IndexField</code> and its current status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class IndexFieldStatus {
  @_s.JsonKey(name: 'Options')
  final IndexField options;
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  IndexFieldStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory IndexFieldStatus.fromXml(_s.XmlElement elem) {
    return IndexFieldStatus(
      options: _s
          .extractXmlChild(elem, 'Options')
          ?.let((e) => IndexField.fromXml(e)),
      status: _s
          .extractXmlChild(elem, 'Status')
          ?.let((e) => OptionStatus.fromXml(e)),
    );
  }
}

/// The type of <code>IndexField</code>.
enum IndexFieldType {
  @_s.JsonValue('uint')
  uint,
  @_s.JsonValue('literal')
  literal,
  @_s.JsonValue('text')
  text,
}

extension on String {
  IndexFieldType toIndexFieldType() {
    switch (this) {
      case 'uint':
        return IndexFieldType.uint;
      case 'literal':
        return IndexFieldType.literal;
      case 'text':
        return IndexFieldType.text;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An internal error occurred while processing the request. If this problem
/// persists, report an issue from the <a
/// href="http://status.aws.amazon.com/">Service Health Dashboard</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class InternalException implements _s.AwsException {
  InternalException();
  factory InternalException.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return InternalException();
  }
}

/// The request was rejected because it specified an invalid type definition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class InvalidTypeException implements _s.AwsException {
  InvalidTypeException();
  factory InvalidTypeException.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return InvalidTypeException();
  }
}

/// The request was rejected because a resource limit has already been met.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class LimitExceededException implements _s.AwsException {
  LimitExceededException();
  factory LimitExceededException.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return LimitExceededException();
  }
}

/// Options that define a literal field in the search index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LiteralOptions {
  /// The default value for a literal field. Optional.
  @_s.JsonKey(name: 'DefaultValue')
  final String defaultValue;

  /// Specifies whether facets are enabled for this field. Default: False.
  @_s.JsonKey(name: 'FacetEnabled')
  final bool facetEnabled;

  /// Specifies whether values of this field can be returned in search results and
  /// used for ranking. Default: False.
  @_s.JsonKey(name: 'ResultEnabled')
  final bool resultEnabled;

  /// Specifies whether search is enabled for this field. Default: False.
  @_s.JsonKey(name: 'SearchEnabled')
  final bool searchEnabled;

  LiteralOptions({
    this.defaultValue,
    this.facetEnabled,
    this.resultEnabled,
    this.searchEnabled,
  });
  factory LiteralOptions.fromXml(_s.XmlElement elem) {
    return LiteralOptions(
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      facetEnabled: _s.extractXmlBoolValue(elem, 'FacetEnabled'),
      resultEnabled: _s.extractXmlBoolValue(elem, 'ResultEnabled'),
      searchEnabled: _s.extractXmlBoolValue(elem, 'SearchEnabled'),
    );
  }

  Map<String, dynamic> toJson() => _$LiteralOptionsToJson(this);
}

/// A named expression that can be evaluated at search time and used for ranking
/// or thresholding in a search query.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NamedRankExpression {
  /// The expression to evaluate for ranking or thresholding while processing a
  /// search request. The <code>RankExpression</code> syntax is based on
  /// JavaScript expressions and supports:
  ///
  /// <ul>
  /// <li>Integer, floating point, hex and octal literals</li>
  /// <li>Shortcut evaluation of logical operators such that an expression <code>a
  /// || b</code> evaluates to the value <code>a</code>, if <code>a</code> is
  /// true, without evaluating <code>b</code> at all</li>
  /// <li>JavaScript order of precedence for operators</li>
  /// <li>Arithmetic operators: <code>+ - * / %</code> </li>
  /// <li>Boolean operators (including the ternary operator)</li>
  /// <li>Bitwise operators</li>
  /// <li>Comparison operators</li>
  /// <li>Common mathematic functions: <code>abs ceil erf exp floor lgamma ln log2
  /// log10 max min sqrt pow</code> </li>
  /// <li>Trigonometric library functions: <code>acosh acos asinh asin atanh atan
  /// cosh cos sinh sin tanh tan</code> </li>
  /// <li>Random generation of a number between 0 and 1: <code>rand</code> </li>
  /// <li>Current time in epoch: <code>time</code> </li>
  /// <li>The <code>min max</code> functions that operate on a variable argument
  /// list</li>
  /// </ul>
  /// Intermediate results are calculated as double precision floating point
  /// values. The final return value of a <code>RankExpression</code> is
  /// automatically converted from floating point to a 32-bit unsigned integer by
  /// rounding to the nearest integer, with a natural floor of 0 and a ceiling of
  /// max(uint32_t), 4294967295. Mathematical errors such as dividing by 0 will
  /// fail during evaluation and return a value of 0.
  ///
  /// The source data for a <code>RankExpression</code> can be the name of an
  /// <code>IndexField</code> of type uint, another <code>RankExpression</code> or
  /// the reserved name <i>text_relevance</i>. The text_relevance source is
  /// defined to return an integer from 0 to 1000 (inclusive) to indicate how
  /// relevant a document is to the search request, taking into account repetition
  /// of search terms in the document and proximity of search terms to each other
  /// in each matching <code>IndexField</code> in the document.
  ///
  /// For more information about using rank expressions to customize ranking, see
  /// the Amazon CloudSearch Developer Guide.
  @_s.JsonKey(name: 'RankExpression')
  final String rankExpression;

  /// The name of a rank expression. Rank expression names must begin with a
  /// letter and can contain the following characters: a-z (lowercase), 0-9, and _
  /// (underscore). Uppercase letters and hyphens are not allowed. The names
  /// "body", "docid", and "text_relevance" are reserved and cannot be specified
  /// as field or rank expression names.
  @_s.JsonKey(name: 'RankName')
  final String rankName;

  NamedRankExpression({
    @_s.required this.rankExpression,
    @_s.required this.rankName,
  });
  factory NamedRankExpression.fromXml(_s.XmlElement elem) {
    return NamedRankExpression(
      rankExpression: _s.extractXmlStringValue(elem, 'RankExpression'),
      rankName: _s.extractXmlStringValue(elem, 'RankName'),
    );
  }

  Map<String, dynamic> toJson() => _$NamedRankExpressionToJson(this);
}

/// The state of processing a change to an option.
enum OptionState {
  @_s.JsonValue('RequiresIndexDocuments')
  requiresIndexDocuments,
  @_s.JsonValue('Processing')
  processing,
  @_s.JsonValue('Active')
  active,
}

extension on String {
  OptionState toOptionState() {
    switch (this) {
      case 'RequiresIndexDocuments':
        return OptionState.requiresIndexDocuments;
      case 'Processing':
        return OptionState.processing;
      case 'Active':
        return OptionState.active;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The status of an option, including when it was last updated and whether it
/// is actively in use for searches.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class OptionStatus {
  /// A timestamp for when this option was created.
  @_s.JsonKey(name: 'CreationDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationDate;

  /// The state of processing a change to an option. Possible values:
  ///
  /// <ul>
  /// <li> <code>RequiresIndexDocuments</code>: the option's latest value will not
  /// be visible in searches until <a>IndexDocuments</a> has been called and
  /// indexing is complete.</li>
  /// <li> <code>Processing</code>: the option's latest value is not yet visible
  /// in all searches but is in the process of being activated. </li>
  /// <li> <code>Active</code>: the option's latest value is completely visible.
  /// Any warnings or messages generated during processing are provided in
  /// <code>Diagnostics</code>.</li>
  /// </ul>
  @_s.JsonKey(name: 'State')
  final OptionState state;

  /// A timestamp for when this option was last updated.
  @_s.JsonKey(name: 'UpdateDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime updateDate;

  /// Indicates that the option will be deleted once processing is complete.
  @_s.JsonKey(name: 'PendingDeletion')
  final bool pendingDeletion;

  /// A unique integer that indicates when this option was last updated.
  @_s.JsonKey(name: 'UpdateVersion')
  final int updateVersion;

  OptionStatus({
    @_s.required this.creationDate,
    @_s.required this.state,
    @_s.required this.updateDate,
    this.pendingDeletion,
    this.updateVersion,
  });
  factory OptionStatus.fromXml(_s.XmlElement elem) {
    return OptionStatus(
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate'),
      state: _s.extractXmlStringValue(elem, 'State')?.toOptionState(),
      updateDate: _s.extractXmlDateTimeValue(elem, 'UpdateDate'),
      pendingDeletion: _s.extractXmlBoolValue(elem, 'PendingDeletion'),
      updateVersion: _s.extractXmlIntValue(elem, 'UpdateVersion'),
    );
  }
}

/// The value of a <code>RankExpression</code> and its current status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class RankExpressionStatus {
  /// The expression that is evaluated for ranking or thresholding while
  /// processing a search request.
  @_s.JsonKey(name: 'Options')
  final NamedRankExpression options;
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  RankExpressionStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory RankExpressionStatus.fromXml(_s.XmlElement elem) {
    return RankExpressionStatus(
      options: _s
          .extractXmlChild(elem, 'Options')
          ?.let((e) => NamedRankExpression.fromXml(e)),
      status: _s
          .extractXmlChild(elem, 'Status')
          ?.let((e) => OptionStatus.fromXml(e)),
    );
  }
}

/// The request was rejected because it attempted to reference a resource that
/// does not exist.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class ResourceNotFoundException implements _s.AwsException {
  ResourceNotFoundException();
  factory ResourceNotFoundException.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return ResourceNotFoundException();
  }
}

/// The endpoint to which service requests can be submitted, including the
/// actual URL prefix for sending requests and the Amazon Resource Name (ARN) so
/// the endpoint can be referenced in other API calls such as
/// <a>UpdateServiceAccessPolicies</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class ServiceEndpoint {
  @_s.JsonKey(name: 'Arn')
  final String arn;
  @_s.JsonKey(name: 'Endpoint')
  final String endpoint;

  ServiceEndpoint({
    this.arn,
    this.endpoint,
  });
  factory ServiceEndpoint.fromXml(_s.XmlElement elem) {
    return ServiceEndpoint(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      endpoint: _s.extractXmlStringValue(elem, 'Endpoint'),
    );
  }
}

/// Identifies the source data for an index field. An optional data
/// transformation can be applied to the source data when populating the index
/// field. By default, the value of the source attribute is copied to the index
/// field.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SourceAttribute {
  /// Identifies the transformation to apply when copying data from a source
  /// attribute.
  @_s.JsonKey(name: 'SourceDataFunction')
  final SourceDataFunction sourceDataFunction;

  /// Copies data from a source document attribute to an <code>IndexField</code>.
  @_s.JsonKey(name: 'SourceDataCopy')
  final SourceData sourceDataCopy;

  /// Maps source document attribute values to new values when populating the
  /// <code>IndexField</code>.
  @_s.JsonKey(name: 'SourceDataMap')
  final SourceDataMap sourceDataMap;

  /// Trims common title words from a source document attribute when populating an
  /// <code>IndexField</code>. This can be used to create an
  /// <code>IndexField</code> you can use for sorting.
  @_s.JsonKey(name: 'SourceDataTrimTitle')
  final SourceDataTrimTitle sourceDataTrimTitle;

  SourceAttribute({
    @_s.required this.sourceDataFunction,
    this.sourceDataCopy,
    this.sourceDataMap,
    this.sourceDataTrimTitle,
  });
  factory SourceAttribute.fromXml(_s.XmlElement elem) {
    return SourceAttribute(
      sourceDataFunction: _s
          .extractXmlStringValue(elem, 'SourceDataFunction')
          ?.toSourceDataFunction(),
      sourceDataCopy: _s
          .extractXmlChild(elem, 'SourceDataCopy')
          ?.let((e) => SourceData.fromXml(e)),
      sourceDataMap: _s
          .extractXmlChild(elem, 'SourceDataMap')
          ?.let((e) => SourceDataMap.fromXml(e)),
      sourceDataTrimTitle: _s
          .extractXmlChild(elem, 'SourceDataTrimTitle')
          ?.let((e) => SourceDataTrimTitle.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() => _$SourceAttributeToJson(this);
}

/// The source attribute name and an optional default value to use if a document
/// doesn't have an attribute of that name.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SourceData {
  /// The name of the document source field to add to this
  /// <code>IndexField</code>.
  @_s.JsonKey(name: 'SourceName')
  final String sourceName;

  /// The default value to use if the source attribute is not specified in a
  /// document. Optional.
  @_s.JsonKey(name: 'DefaultValue')
  final String defaultValue;

  SourceData({
    @_s.required this.sourceName,
    this.defaultValue,
  });
  factory SourceData.fromXml(_s.XmlElement elem) {
    return SourceData(
      sourceName: _s.extractXmlStringValue(elem, 'SourceName'),
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
    );
  }

  Map<String, dynamic> toJson() => _$SourceDataToJson(this);
}

enum SourceDataFunction {
  @_s.JsonValue('Copy')
  copy,
  @_s.JsonValue('TrimTitle')
  trimTitle,
  @_s.JsonValue('Map')
  map,
}

extension on String {
  SourceDataFunction toSourceDataFunction() {
    switch (this) {
      case 'Copy':
        return SourceDataFunction.copy;
      case 'TrimTitle':
        return SourceDataFunction.trimTitle;
      case 'Map':
        return SourceDataFunction.map;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Specifies how to map source attribute values to custom values when
/// populating an <code>IndexField</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SourceDataMap {
  /// The name of the document source field to add to this
  /// <code>IndexField</code>.
  @_s.JsonKey(name: 'SourceName')
  final String sourceName;

  /// A map that translates source field values to custom values.
  @_s.JsonKey(name: 'Cases')
  final Map<String, String> cases;

  /// The default value to use if the source attribute is not specified in a
  /// document. Optional.
  @_s.JsonKey(name: 'DefaultValue')
  final String defaultValue;

  SourceDataMap({
    @_s.required this.sourceName,
    this.cases,
    this.defaultValue,
  });
  factory SourceDataMap.fromXml(_s.XmlElement elem) {
    return SourceDataMap(
      sourceName: _s.extractXmlStringValue(elem, 'SourceName'),
      cases: Map.fromEntries(
        elem.findElements('Cases').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'null'),
                _s.extractXmlStringValue(c, 'null'),
              ),
            ),
      ),
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
    );
  }

  Map<String, dynamic> toJson() => _$SourceDataMapToJson(this);
}

/// Specifies how to trim common words from the beginning of a field to enable
/// title sorting by that field.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SourceDataTrimTitle {
  /// The name of the document source field to add to this
  /// <code>IndexField</code>.
  @_s.JsonKey(name: 'SourceName')
  final String sourceName;

  /// The default value to use if the source attribute is not specified in a
  /// document. Optional.
  @_s.JsonKey(name: 'DefaultValue')
  final String defaultValue;
  @_s.JsonKey(name: 'Language')
  final String language;

  /// The separator that follows the text to trim.
  @_s.JsonKey(name: 'Separator')
  final String separator;

  SourceDataTrimTitle({
    @_s.required this.sourceName,
    this.defaultValue,
    this.language,
    this.separator,
  });
  factory SourceDataTrimTitle.fromXml(_s.XmlElement elem) {
    return SourceDataTrimTitle(
      sourceName: _s.extractXmlStringValue(elem, 'SourceName'),
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      language: _s.extractXmlStringValue(elem, 'Language'),
      separator: _s.extractXmlStringValue(elem, 'Separator'),
    );
  }

  Map<String, dynamic> toJson() => _$SourceDataTrimTitleToJson(this);
}

/// The stemming options configured for this search domain and the current
/// status of those options.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class StemmingOptionsStatus {
  @_s.JsonKey(name: 'Options')
  final String options;
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  StemmingOptionsStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory StemmingOptionsStatus.fromXml(_s.XmlElement elem) {
    return StemmingOptionsStatus(
      options: _s.extractXmlStringValue(elem, 'Options'),
      status: _s
          .extractXmlChild(elem, 'Status')
          ?.let((e) => OptionStatus.fromXml(e)),
    );
  }
}

/// The stopword options configured for this search domain and the current
/// status of those options.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class StopwordOptionsStatus {
  @_s.JsonKey(name: 'Options')
  final String options;
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  StopwordOptionsStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory StopwordOptionsStatus.fromXml(_s.XmlElement elem) {
    return StopwordOptionsStatus(
      options: _s.extractXmlStringValue(elem, 'Options'),
      status: _s
          .extractXmlChild(elem, 'Status')
          ?.let((e) => OptionStatus.fromXml(e)),
    );
  }
}

/// The synonym options configured for this search domain and the current status
/// of those options.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class SynonymOptionsStatus {
  @_s.JsonKey(name: 'Options')
  final String options;
  @_s.JsonKey(name: 'Status')
  final OptionStatus status;

  SynonymOptionsStatus({
    @_s.required this.options,
    @_s.required this.status,
  });
  factory SynonymOptionsStatus.fromXml(_s.XmlElement elem) {
    return SynonymOptionsStatus(
      options: _s.extractXmlStringValue(elem, 'Options'),
      status: _s
          .extractXmlChild(elem, 'Status')
          ?.let((e) => OptionStatus.fromXml(e)),
    );
  }
}

/// Options that define a text field in the search index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TextOptions {
  /// The default value for a text field. Optional.
  @_s.JsonKey(name: 'DefaultValue')
  final String defaultValue;

  /// Specifies whether facets are enabled for this field. Default: False.
  @_s.JsonKey(name: 'FacetEnabled')
  final bool facetEnabled;

  /// Specifies whether values of this field can be returned in search results and
  /// used for ranking. Default: False.
  @_s.JsonKey(name: 'ResultEnabled')
  final bool resultEnabled;

  /// The text processor to apply to this field. Optional. Possible values:
  ///
  /// <ul>
  /// <li> <code>cs_text_no_stemming</code>: turns off stemming for the
  /// field.</li>
  /// </ul>
  /// Default: none
  @_s.JsonKey(name: 'TextProcessor')
  final String textProcessor;

  TextOptions({
    this.defaultValue,
    this.facetEnabled,
    this.resultEnabled,
    this.textProcessor,
  });
  factory TextOptions.fromXml(_s.XmlElement elem) {
    return TextOptions(
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      facetEnabled: _s.extractXmlBoolValue(elem, 'FacetEnabled'),
      resultEnabled: _s.extractXmlBoolValue(elem, 'ResultEnabled'),
      textProcessor: _s.extractXmlStringValue(elem, 'TextProcessor'),
    );
  }

  Map<String, dynamic> toJson() => _$TextOptionsToJson(this);
}

/// Options that define a <code>uint</code> field in the search index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UIntOptions {
  /// The default value for an unsigned integer field. Optional.
  @_s.JsonKey(name: 'DefaultValue')
  final int defaultValue;

  UIntOptions({
    this.defaultValue,
  });
  factory UIntOptions.fromXml(_s.XmlElement elem) {
    return UIntOptions(
      defaultValue: _s.extractXmlIntValue(elem, 'DefaultValue'),
    );
  }

  Map<String, dynamic> toJson() => _$UIntOptionsToJson(this);
}

/// The result of a <code>UpdateAvailabilityOptions</code> request. Contains the
/// status of the domain's availability options.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class UpdateAvailabilityOptionsResponse {
  /// The newly-configured availability options. Indicates whether Multi-AZ is
  /// enabled for the domain.
  @_s.JsonKey(name: 'AvailabilityOptions')
  final AvailabilityOptionsStatus availabilityOptions;

  UpdateAvailabilityOptionsResponse({
    this.availabilityOptions,
  });
  factory UpdateAvailabilityOptionsResponse.fromXml(_s.XmlElement elem) {
    return UpdateAvailabilityOptionsResponse(
      availabilityOptions: _s
          .extractXmlChild(elem, 'AvailabilityOptions')
          ?.let((e) => AvailabilityOptionsStatus.fromXml(e)),
    );
  }
}

/// A response message that contains the status of an updated default search
/// field.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class UpdateDefaultSearchFieldResponse {
  @_s.JsonKey(name: 'DefaultSearchField')
  final DefaultSearchFieldStatus defaultSearchField;

  UpdateDefaultSearchFieldResponse({
    @_s.required this.defaultSearchField,
  });
  factory UpdateDefaultSearchFieldResponse.fromXml(_s.XmlElement elem) {
    return UpdateDefaultSearchFieldResponse(
      defaultSearchField: _s
          .extractXmlChild(elem, 'DefaultSearchField')
          ?.let((e) => DefaultSearchFieldStatus.fromXml(e)),
    );
  }
}

/// A response message that contains the status of updated access policies.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class UpdateServiceAccessPoliciesResponse {
  @_s.JsonKey(name: 'AccessPolicies')
  final AccessPoliciesStatus accessPolicies;

  UpdateServiceAccessPoliciesResponse({
    @_s.required this.accessPolicies,
  });
  factory UpdateServiceAccessPoliciesResponse.fromXml(_s.XmlElement elem) {
    return UpdateServiceAccessPoliciesResponse(
      accessPolicies: _s
          .extractXmlChild(elem, 'AccessPolicies')
          ?.let((e) => AccessPoliciesStatus.fromXml(e)),
    );
  }
}

/// A response message that contains the status of updated stemming options.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class UpdateStemmingOptionsResponse {
  @_s.JsonKey(name: 'Stems')
  final StemmingOptionsStatus stems;

  UpdateStemmingOptionsResponse({
    @_s.required this.stems,
  });
  factory UpdateStemmingOptionsResponse.fromXml(_s.XmlElement elem) {
    return UpdateStemmingOptionsResponse(
      stems: _s
          .extractXmlChild(elem, 'Stems')
          ?.let((e) => StemmingOptionsStatus.fromXml(e)),
    );
  }
}

/// A response message that contains the status of updated stopword options.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class UpdateStopwordOptionsResponse {
  @_s.JsonKey(name: 'Stopwords')
  final StopwordOptionsStatus stopwords;

  UpdateStopwordOptionsResponse({
    @_s.required this.stopwords,
  });
  factory UpdateStopwordOptionsResponse.fromXml(_s.XmlElement elem) {
    return UpdateStopwordOptionsResponse(
      stopwords: _s
          .extractXmlChild(elem, 'Stopwords')
          ?.let((e) => StopwordOptionsStatus.fromXml(e)),
    );
  }
}

/// A response message that contains the status of updated synonym options.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class UpdateSynonymOptionsResponse {
  @_s.JsonKey(name: 'Synonyms')
  final SynonymOptionsStatus synonyms;

  UpdateSynonymOptionsResponse({
    @_s.required this.synonyms,
  });
  factory UpdateSynonymOptionsResponse.fromXml(_s.XmlElement elem) {
    return UpdateSynonymOptionsResponse(
      synonyms: _s
          .extractXmlChild(elem, 'Synonyms')
          ?.let((e) => SynonymOptionsStatus.fromXml(e)),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BaseException': (type, message) => BaseException(message: message),
  'DisabledOperationException': (type, message) => DisabledOperationException(),
  'InternalException': (type, message) => InternalException(),
  'InvalidTypeException': (type, message) => InvalidTypeException(),
  'LimitExceededException': (type, message) => LimitExceededException(),
  'ResourceNotFoundException': (type, message) => ResourceNotFoundException(),
};
