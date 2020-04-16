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

part 'rds-2013-09-09.g.dart';

class RDS {
  final _s.QueryProtocol _protocol;

  RDS({
    @_s.required String region,
    @_s.required _s.AwsClientCredentials credentials,
    _s.Client client,
  }) : _protocol = _s.QueryProtocol(
          client: client,
          service: 'rds',
          region: region,
          credentials: credentials,
        );

  ///
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [SourceNotFoundFault].
  Future<AddSourceIdentifierToSubscriptionResult>
      addSourceIdentifierToSubscription({
    @_s.required String sourceIdentifier,
    @_s.required String subscriptionName,
  }) async {
    ArgumentError.checkNotNull(sourceIdentifier, 'sourceIdentifier');
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final $request = <String, dynamic>{
      'Action': 'AddSourceIdentifierToSubscription',
      'Version': '2013-09-09',
    };
    $request['SourceIdentifier'] = sourceIdentifier;
    $request['SubscriptionName'] = subscriptionName;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'AddSourceIdentifierToSubscriptionResult',
    );
    return AddSourceIdentifierToSubscriptionResult.fromXml($result);
  }

  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  Future<void> addTagsToResource({
    @_s.required String resourceName,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    ArgumentError.checkNotNull(tags, 'tags');
    final $request = <String, dynamic>{
      'Action': 'AddTagsToResource',
      'Version': '2013-09-09',
    };
    $request['ResourceName'] = resourceName;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  ///
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [InvalidDBSecurityGroupStateFault].
  /// May throw [AuthorizationAlreadyExistsFault].
  /// May throw [AuthorizationQuotaExceededFault].
  Future<AuthorizeDBSecurityGroupIngressResult>
      authorizeDBSecurityGroupIngress({
    @_s.required String dBSecurityGroupName,
    String cidrip,
    String eC2SecurityGroupId,
    String eC2SecurityGroupName,
    String eC2SecurityGroupOwnerId,
  }) async {
    ArgumentError.checkNotNull(dBSecurityGroupName, 'dBSecurityGroupName');
    final $request = <String, dynamic>{
      'Action': 'AuthorizeDBSecurityGroupIngress',
      'Version': '2013-09-09',
    };
    $request['DBSecurityGroupName'] = dBSecurityGroupName;
    cidrip?.also((arg) => $request['CIDRIP'] = arg);
    eC2SecurityGroupId?.also((arg) => $request['EC2SecurityGroupId'] = arg);
    eC2SecurityGroupName?.also((arg) => $request['EC2SecurityGroupName'] = arg);
    eC2SecurityGroupOwnerId
        ?.also((arg) => $request['EC2SecurityGroupOwnerId'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'AuthorizeDBSecurityGroupIngressResult',
    );
    return AuthorizeDBSecurityGroupIngressResult.fromXml($result);
  }

  ///
  /// May throw [DBSnapshotAlreadyExistsFault].
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [InvalidDBSnapshotStateFault].
  /// May throw [SnapshotQuotaExceededFault].
  Future<CopyDBSnapshotResult> copyDBSnapshot({
    @_s.required String sourceDBSnapshotIdentifier,
    @_s.required String targetDBSnapshotIdentifier,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        sourceDBSnapshotIdentifier, 'sourceDBSnapshotIdentifier');
    ArgumentError.checkNotNull(
        targetDBSnapshotIdentifier, 'targetDBSnapshotIdentifier');
    final $request = <String, dynamic>{
      'Action': 'CopyDBSnapshot',
      'Version': '2013-09-09',
    };
    $request['SourceDBSnapshotIdentifier'] = sourceDBSnapshotIdentifier;
    $request['TargetDBSnapshotIdentifier'] = targetDBSnapshotIdentifier;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CopyDBSnapshotResult',
    );
    return CopyDBSnapshotResult.fromXml($result);
  }

  ///
  /// May throw [DBInstanceAlreadyExistsFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [InstanceQuotaExceededFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [ProvisionedIopsNotAvailableInAZFault].
  /// May throw [OptionGroupNotFoundFault].
  Future<CreateDBInstanceResult> createDBInstance({
    @_s.required int allocatedStorage,
    @_s.required String dBInstanceClass,
    @_s.required String dBInstanceIdentifier,
    @_s.required String engine,
    @_s.required String masterUserPassword,
    @_s.required String masterUsername,
    bool autoMinorVersionUpgrade,
    String availabilityZone,
    int backupRetentionPeriod,
    String characterSetName,
    String dBName,
    String dBParameterGroupName,
    List<String> dBSecurityGroups,
    String dBSubnetGroupName,
    String engineVersion,
    int iops,
    String licenseModel,
    bool multiAZ,
    String optionGroupName,
    int port,
    String preferredBackupWindow,
    String preferredMaintenanceWindow,
    bool publiclyAccessible,
    List<Tag> tags,
    List<String> vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(allocatedStorage, 'allocatedStorage');
    ArgumentError.checkNotNull(dBInstanceClass, 'dBInstanceClass');
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(engine, 'engine');
    ArgumentError.checkNotNull(masterUserPassword, 'masterUserPassword');
    ArgumentError.checkNotNull(masterUsername, 'masterUsername');
    final $request = <String, dynamic>{
      'Action': 'CreateDBInstance',
      'Version': '2013-09-09',
    };
    $request['AllocatedStorage'] = allocatedStorage;
    $request['DBInstanceClass'] = dBInstanceClass;
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['Engine'] = engine;
    $request['MasterUserPassword'] = masterUserPassword;
    $request['MasterUsername'] = masterUsername;
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    characterSetName?.also((arg) => $request['CharacterSetName'] = arg);
    dBName?.also((arg) => $request['DBName'] = arg);
    dBParameterGroupName?.also((arg) => $request['DBParameterGroupName'] = arg);
    dBSecurityGroups?.also((arg) => $request['DBSecurityGroups'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    licenseModel?.also((arg) => $request['LicenseModel'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateDBInstanceResult',
    );
    return CreateDBInstanceResult.fromXml($result);
  }

  ///
  /// May throw [DBInstanceAlreadyExistsFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [InstanceQuotaExceededFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [ProvisionedIopsNotAvailableInAZFault].
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [DBSubnetGroupNotAllowedFault].
  /// May throw [InvalidDBSubnetGroupFault].
  Future<CreateDBInstanceReadReplicaResult> createDBInstanceReadReplica({
    @_s.required String dBInstanceIdentifier,
    @_s.required String sourceDBInstanceIdentifier,
    bool autoMinorVersionUpgrade,
    String availabilityZone,
    String dBInstanceClass,
    String dBSubnetGroupName,
    int iops,
    String optionGroupName,
    int port,
    bool publiclyAccessible,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(
        sourceDBInstanceIdentifier, 'sourceDBInstanceIdentifier');
    final $request = <String, dynamic>{
      'Action': 'CreateDBInstanceReadReplica',
      'Version': '2013-09-09',
    };
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['SourceDBInstanceIdentifier'] = sourceDBInstanceIdentifier;
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateDBInstanceReadReplicaResult',
    );
    return CreateDBInstanceReadReplicaResult.fromXml($result);
  }

  ///
  /// May throw [DBParameterGroupQuotaExceededFault].
  /// May throw [DBParameterGroupAlreadyExistsFault].
  Future<CreateDBParameterGroupResult> createDBParameterGroup({
    @_s.required String dBParameterGroupFamily,
    @_s.required String dBParameterGroupName,
    @_s.required String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        dBParameterGroupFamily, 'dBParameterGroupFamily');
    ArgumentError.checkNotNull(dBParameterGroupName, 'dBParameterGroupName');
    ArgumentError.checkNotNull(description, 'description');
    final $request = <String, dynamic>{
      'Action': 'CreateDBParameterGroup',
      'Version': '2013-09-09',
    };
    $request['DBParameterGroupFamily'] = dBParameterGroupFamily;
    $request['DBParameterGroupName'] = dBParameterGroupName;
    $request['Description'] = description;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateDBParameterGroupResult',
    );
    return CreateDBParameterGroupResult.fromXml($result);
  }

  ///
  /// May throw [DBSecurityGroupAlreadyExistsFault].
  /// May throw [DBSecurityGroupQuotaExceededFault].
  /// May throw [DBSecurityGroupNotSupportedFault].
  Future<CreateDBSecurityGroupResult> createDBSecurityGroup({
    @_s.required String dBSecurityGroupDescription,
    @_s.required String dBSecurityGroupName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        dBSecurityGroupDescription, 'dBSecurityGroupDescription');
    ArgumentError.checkNotNull(dBSecurityGroupName, 'dBSecurityGroupName');
    final $request = <String, dynamic>{
      'Action': 'CreateDBSecurityGroup',
      'Version': '2013-09-09',
    };
    $request['DBSecurityGroupDescription'] = dBSecurityGroupDescription;
    $request['DBSecurityGroupName'] = dBSecurityGroupName;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateDBSecurityGroupResult',
    );
    return CreateDBSecurityGroupResult.fromXml($result);
  }

  ///
  /// May throw [DBSnapshotAlreadyExistsFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [SnapshotQuotaExceededFault].
  Future<CreateDBSnapshotResult> createDBSnapshot({
    @_s.required String dBInstanceIdentifier,
    @_s.required String dBSnapshotIdentifier,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(dBSnapshotIdentifier, 'dBSnapshotIdentifier');
    final $request = <String, dynamic>{
      'Action': 'CreateDBSnapshot',
      'Version': '2013-09-09',
    };
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['DBSnapshotIdentifier'] = dBSnapshotIdentifier;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateDBSnapshotResult',
    );
    return CreateDBSnapshotResult.fromXml($result);
  }

  ///
  /// May throw [DBSubnetGroupAlreadyExistsFault].
  /// May throw [DBSubnetGroupQuotaExceededFault].
  /// May throw [DBSubnetQuotaExceededFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  Future<CreateDBSubnetGroupResult> createDBSubnetGroup({
    @_s.required String dBSubnetGroupDescription,
    @_s.required String dBSubnetGroupName,
    @_s.required List<String> subnetIds,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        dBSubnetGroupDescription, 'dBSubnetGroupDescription');
    ArgumentError.checkNotNull(dBSubnetGroupName, 'dBSubnetGroupName');
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    final $request = <String, dynamic>{
      'Action': 'CreateDBSubnetGroup',
      'Version': '2013-09-09',
    };
    $request['DBSubnetGroupDescription'] = dBSubnetGroupDescription;
    $request['DBSubnetGroupName'] = dBSubnetGroupName;
    $request['SubnetIds'] = subnetIds;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateDBSubnetGroupResult',
    );
    return CreateDBSubnetGroupResult.fromXml($result);
  }

  ///
  /// May throw [EventSubscriptionQuotaExceededFault].
  /// May throw [SubscriptionAlreadyExistFault].
  /// May throw [SNSInvalidTopicFault].
  /// May throw [SNSNoAuthorizationFault].
  /// May throw [SNSTopicArnNotFoundFault].
  /// May throw [SubscriptionCategoryNotFoundFault].
  /// May throw [SourceNotFoundFault].
  Future<CreateEventSubscriptionResult> createEventSubscription({
    @_s.required String snsTopicArn,
    @_s.required String subscriptionName,
    bool enabled,
    List<String> eventCategories,
    List<String> sourceIds,
    String sourceType,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(snsTopicArn, 'snsTopicArn');
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final $request = <String, dynamic>{
      'Action': 'CreateEventSubscription',
      'Version': '2013-09-09',
    };
    $request['SnsTopicArn'] = snsTopicArn;
    $request['SubscriptionName'] = subscriptionName;
    enabled?.also((arg) => $request['Enabled'] = arg);
    eventCategories?.also((arg) => $request['EventCategories'] = arg);
    sourceIds?.also((arg) => $request['SourceIds'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateEventSubscriptionResult',
    );
    return CreateEventSubscriptionResult.fromXml($result);
  }

  ///
  /// May throw [OptionGroupAlreadyExistsFault].
  /// May throw [OptionGroupQuotaExceededFault].
  Future<CreateOptionGroupResult> createOptionGroup({
    @_s.required String engineName,
    @_s.required String majorEngineVersion,
    @_s.required String optionGroupDescription,
    @_s.required String optionGroupName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(engineName, 'engineName');
    ArgumentError.checkNotNull(majorEngineVersion, 'majorEngineVersion');
    ArgumentError.checkNotNull(
        optionGroupDescription, 'optionGroupDescription');
    ArgumentError.checkNotNull(optionGroupName, 'optionGroupName');
    final $request = <String, dynamic>{
      'Action': 'CreateOptionGroup',
      'Version': '2013-09-09',
    };
    $request['EngineName'] = engineName;
    $request['MajorEngineVersion'] = majorEngineVersion;
    $request['OptionGroupDescription'] = optionGroupDescription;
    $request['OptionGroupName'] = optionGroupName;
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateOptionGroupResult',
    );
    return CreateOptionGroupResult.fromXml($result);
  }

  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBSnapshotAlreadyExistsFault].
  /// May throw [SnapshotQuotaExceededFault].
  Future<DeleteDBInstanceResult> deleteDBInstance({
    @_s.required String dBInstanceIdentifier,
    String finalDBSnapshotIdentifier,
    bool skipFinalSnapshot,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{
      'Action': 'DeleteDBInstance',
      'Version': '2013-09-09',
    };
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    finalDBSnapshotIdentifier
        ?.also((arg) => $request['FinalDBSnapshotIdentifier'] = arg);
    skipFinalSnapshot?.also((arg) => $request['SkipFinalSnapshot'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DeleteDBInstanceResult',
    );
    return DeleteDBInstanceResult.fromXml($result);
  }

  ///
  /// May throw [InvalidDBParameterGroupStateFault].
  /// May throw [DBParameterGroupNotFoundFault].
  Future<void> deleteDBParameterGroup({
    @_s.required String dBParameterGroupName,
  }) async {
    ArgumentError.checkNotNull(dBParameterGroupName, 'dBParameterGroupName');
    final $request = <String, dynamic>{
      'Action': 'DeleteDBParameterGroup',
      'Version': '2013-09-09',
    };
    $request['DBParameterGroupName'] = dBParameterGroupName;
    await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  ///
  /// May throw [InvalidDBSecurityGroupStateFault].
  /// May throw [DBSecurityGroupNotFoundFault].
  Future<void> deleteDBSecurityGroup({
    @_s.required String dBSecurityGroupName,
  }) async {
    ArgumentError.checkNotNull(dBSecurityGroupName, 'dBSecurityGroupName');
    final $request = <String, dynamic>{
      'Action': 'DeleteDBSecurityGroup',
      'Version': '2013-09-09',
    };
    $request['DBSecurityGroupName'] = dBSecurityGroupName;
    await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  ///
  /// May throw [InvalidDBSnapshotStateFault].
  /// May throw [DBSnapshotNotFoundFault].
  Future<DeleteDBSnapshotResult> deleteDBSnapshot({
    @_s.required String dBSnapshotIdentifier,
  }) async {
    ArgumentError.checkNotNull(dBSnapshotIdentifier, 'dBSnapshotIdentifier');
    final $request = <String, dynamic>{
      'Action': 'DeleteDBSnapshot',
      'Version': '2013-09-09',
    };
    $request['DBSnapshotIdentifier'] = dBSnapshotIdentifier;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DeleteDBSnapshotResult',
    );
    return DeleteDBSnapshotResult.fromXml($result);
  }

  ///
  /// May throw [InvalidDBSubnetGroupStateFault].
  /// May throw [InvalidDBSubnetStateFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  Future<void> deleteDBSubnetGroup({
    @_s.required String dBSubnetGroupName,
  }) async {
    ArgumentError.checkNotNull(dBSubnetGroupName, 'dBSubnetGroupName');
    final $request = <String, dynamic>{
      'Action': 'DeleteDBSubnetGroup',
      'Version': '2013-09-09',
    };
    $request['DBSubnetGroupName'] = dBSubnetGroupName;
    await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  ///
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [InvalidEventSubscriptionStateFault].
  Future<DeleteEventSubscriptionResult> deleteEventSubscription({
    @_s.required String subscriptionName,
  }) async {
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final $request = <String, dynamic>{
      'Action': 'DeleteEventSubscription',
      'Version': '2013-09-09',
    };
    $request['SubscriptionName'] = subscriptionName;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DeleteEventSubscriptionResult',
    );
    return DeleteEventSubscriptionResult.fromXml($result);
  }

  ///
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [InvalidOptionGroupStateFault].
  Future<void> deleteOptionGroup({
    @_s.required String optionGroupName,
  }) async {
    ArgumentError.checkNotNull(optionGroupName, 'optionGroupName');
    final $request = <String, dynamic>{
      'Action': 'DeleteOptionGroup',
      'Version': '2013-09-09',
    };
    $request['OptionGroupName'] = optionGroupName;
    await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<DBEngineVersionMessage> describeDBEngineVersions({
    String dBParameterGroupFamily,
    bool defaultOnly,
    String engine,
    String engineVersion,
    List<Filter> filters,
    bool listSupportedCharacterSets,
    String marker,
    int maxRecords,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'DescribeDBEngineVersions',
      'Version': '2013-09-09',
    };
    dBParameterGroupFamily
        ?.also((arg) => $request['DBParameterGroupFamily'] = arg);
    defaultOnly?.also((arg) => $request['DefaultOnly'] = arg);
    engine?.also((arg) => $request['Engine'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    listSupportedCharacterSets
        ?.also((arg) => $request['ListSupportedCharacterSets'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeDBEngineVersionsResult',
    );
    return DBEngineVersionMessage.fromXml($result);
  }

  ///
  /// May throw [DBInstanceNotFoundFault].
  Future<DBInstanceMessage> describeDBInstances({
    String dBInstanceIdentifier,
    List<Filter> filters,
    String marker,
    int maxRecords,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'DescribeDBInstances',
      'Version': '2013-09-09',
    };
    dBInstanceIdentifier?.also((arg) => $request['DBInstanceIdentifier'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeDBInstancesResult',
    );
    return DBInstanceMessage.fromXml($result);
  }

  ///
  /// May throw [DBInstanceNotFoundFault].
  Future<DescribeDBLogFilesResponse> describeDBLogFiles({
    @_s.required String dBInstanceIdentifier,
    int fileLastWritten,
    int fileSize,
    String filenameContains,
    List<Filter> filters,
    String marker,
    int maxRecords,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{
      'Action': 'DescribeDBLogFiles',
      'Version': '2013-09-09',
    };
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    fileLastWritten?.also((arg) => $request['FileLastWritten'] = arg);
    fileSize?.also((arg) => $request['FileSize'] = arg);
    filenameContains?.also((arg) => $request['FilenameContains'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeDBLogFilesResult',
    );
    return DescribeDBLogFilesResponse.fromXml($result);
  }

  ///
  /// May throw [DBParameterGroupNotFoundFault].
  Future<DBParameterGroupsMessage> describeDBParameterGroups({
    String dBParameterGroupName,
    List<Filter> filters,
    String marker,
    int maxRecords,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'DescribeDBParameterGroups',
      'Version': '2013-09-09',
    };
    dBParameterGroupName?.also((arg) => $request['DBParameterGroupName'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeDBParameterGroupsResult',
    );
    return DBParameterGroupsMessage.fromXml($result);
  }

  ///
  /// May throw [DBParameterGroupNotFoundFault].
  Future<DBParameterGroupDetails> describeDBParameters({
    @_s.required String dBParameterGroupName,
    List<Filter> filters,
    String marker,
    int maxRecords,
    String source,
  }) async {
    ArgumentError.checkNotNull(dBParameterGroupName, 'dBParameterGroupName');
    final $request = <String, dynamic>{
      'Action': 'DescribeDBParameters',
      'Version': '2013-09-09',
    };
    $request['DBParameterGroupName'] = dBParameterGroupName;
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    source?.also((arg) => $request['Source'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeDBParametersResult',
    );
    return DBParameterGroupDetails.fromXml($result);
  }

  ///
  /// May throw [DBSecurityGroupNotFoundFault].
  Future<DBSecurityGroupMessage> describeDBSecurityGroups({
    String dBSecurityGroupName,
    List<Filter> filters,
    String marker,
    int maxRecords,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'DescribeDBSecurityGroups',
      'Version': '2013-09-09',
    };
    dBSecurityGroupName?.also((arg) => $request['DBSecurityGroupName'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeDBSecurityGroupsResult',
    );
    return DBSecurityGroupMessage.fromXml($result);
  }

  ///
  /// May throw [DBSnapshotNotFoundFault].
  Future<DBSnapshotMessage> describeDBSnapshots({
    String dBInstanceIdentifier,
    String dBSnapshotIdentifier,
    List<Filter> filters,
    String marker,
    int maxRecords,
    String snapshotType,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'DescribeDBSnapshots',
      'Version': '2013-09-09',
    };
    dBInstanceIdentifier?.also((arg) => $request['DBInstanceIdentifier'] = arg);
    dBSnapshotIdentifier?.also((arg) => $request['DBSnapshotIdentifier'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    snapshotType?.also((arg) => $request['SnapshotType'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeDBSnapshotsResult',
    );
    return DBSnapshotMessage.fromXml($result);
  }

  ///
  /// May throw [DBSubnetGroupNotFoundFault].
  Future<DBSubnetGroupMessage> describeDBSubnetGroups({
    String dBSubnetGroupName,
    List<Filter> filters,
    String marker,
    int maxRecords,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'DescribeDBSubnetGroups',
      'Version': '2013-09-09',
    };
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeDBSubnetGroupsResult',
    );
    return DBSubnetGroupMessage.fromXml($result);
  }

  Future<DescribeEngineDefaultParametersResult>
      describeEngineDefaultParameters({
    @_s.required String dBParameterGroupFamily,
    List<Filter> filters,
    String marker,
    int maxRecords,
  }) async {
    ArgumentError.checkNotNull(
        dBParameterGroupFamily, 'dBParameterGroupFamily');
    final $request = <String, dynamic>{
      'Action': 'DescribeEngineDefaultParameters',
      'Version': '2013-09-09',
    };
    $request['DBParameterGroupFamily'] = dBParameterGroupFamily;
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeEngineDefaultParametersResult',
    );
    return DescribeEngineDefaultParametersResult.fromXml($result);
  }

  Future<EventCategoriesMessage> describeEventCategories({
    List<Filter> filters,
    String sourceType,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'DescribeEventCategories',
      'Version': '2013-09-09',
    };
    filters?.also((arg) => $request['Filters'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeEventCategoriesResult',
    );
    return EventCategoriesMessage.fromXml($result);
  }

  ///
  /// May throw [SubscriptionNotFoundFault].
  Future<EventSubscriptionsMessage> describeEventSubscriptions({
    List<Filter> filters,
    String marker,
    int maxRecords,
    String subscriptionName,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'DescribeEventSubscriptions',
      'Version': '2013-09-09',
    };
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    subscriptionName?.also((arg) => $request['SubscriptionName'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeEventSubscriptionsResult',
    );
    return EventSubscriptionsMessage.fromXml($result);
  }

  Future<EventsMessage> describeEvents({
    int duration,
    DateTime endTime,
    List<String> eventCategories,
    List<Filter> filters,
    String marker,
    int maxRecords,
    String sourceIdentifier,
    SourceType sourceType,
    DateTime startTime,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'DescribeEvents',
      'Version': '2013-09-09',
    };
    duration?.also((arg) => $request['Duration'] = arg);
    endTime?.also((arg) => $request['EndTime'] = arg);
    eventCategories?.also((arg) => $request['EventCategories'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    sourceIdentifier?.also((arg) => $request['SourceIdentifier'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg);
    startTime?.also((arg) => $request['StartTime'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeEventsResult',
    );
    return EventsMessage.fromXml($result);
  }

  Future<OptionGroupOptionsMessage> describeOptionGroupOptions({
    @_s.required String engineName,
    List<Filter> filters,
    String majorEngineVersion,
    String marker,
    int maxRecords,
  }) async {
    ArgumentError.checkNotNull(engineName, 'engineName');
    final $request = <String, dynamic>{
      'Action': 'DescribeOptionGroupOptions',
      'Version': '2013-09-09',
    };
    $request['EngineName'] = engineName;
    filters?.also((arg) => $request['Filters'] = arg);
    majorEngineVersion?.also((arg) => $request['MajorEngineVersion'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeOptionGroupOptionsResult',
    );
    return OptionGroupOptionsMessage.fromXml($result);
  }

  ///
  /// May throw [OptionGroupNotFoundFault].
  Future<OptionGroups> describeOptionGroups({
    String engineName,
    List<Filter> filters,
    String majorEngineVersion,
    String marker,
    int maxRecords,
    String optionGroupName,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'DescribeOptionGroups',
      'Version': '2013-09-09',
    };
    engineName?.also((arg) => $request['EngineName'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    majorEngineVersion?.also((arg) => $request['MajorEngineVersion'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeOptionGroupsResult',
    );
    return OptionGroups.fromXml($result);
  }

  Future<OrderableDBInstanceOptionsMessage> describeOrderableDBInstanceOptions({
    @_s.required String engine,
    String dBInstanceClass,
    String engineVersion,
    List<Filter> filters,
    String licenseModel,
    String marker,
    int maxRecords,
    bool vpc,
  }) async {
    ArgumentError.checkNotNull(engine, 'engine');
    final $request = <String, dynamic>{
      'Action': 'DescribeOrderableDBInstanceOptions',
      'Version': '2013-09-09',
    };
    $request['Engine'] = engine;
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    licenseModel?.also((arg) => $request['LicenseModel'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    vpc?.also((arg) => $request['Vpc'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeOrderableDBInstanceOptionsResult',
    );
    return OrderableDBInstanceOptionsMessage.fromXml($result);
  }

  ///
  /// May throw [ReservedDBInstanceNotFoundFault].
  Future<ReservedDBInstanceMessage> describeReservedDBInstances({
    String dBInstanceClass,
    String duration,
    List<Filter> filters,
    String marker,
    int maxRecords,
    bool multiAZ,
    String offeringType,
    String productDescription,
    String reservedDBInstanceId,
    String reservedDBInstancesOfferingId,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'DescribeReservedDBInstances',
      'Version': '2013-09-09',
    };
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    duration?.also((arg) => $request['Duration'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    offeringType?.also((arg) => $request['OfferingType'] = arg);
    productDescription?.also((arg) => $request['ProductDescription'] = arg);
    reservedDBInstanceId?.also((arg) => $request['ReservedDBInstanceId'] = arg);
    reservedDBInstancesOfferingId
        ?.also((arg) => $request['ReservedDBInstancesOfferingId'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeReservedDBInstancesResult',
    );
    return ReservedDBInstanceMessage.fromXml($result);
  }

  ///
  /// May throw [ReservedDBInstancesOfferingNotFoundFault].
  Future<ReservedDBInstancesOfferingMessage>
      describeReservedDBInstancesOfferings({
    String dBInstanceClass,
    String duration,
    List<Filter> filters,
    String marker,
    int maxRecords,
    bool multiAZ,
    String offeringType,
    String productDescription,
    String reservedDBInstancesOfferingId,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'DescribeReservedDBInstancesOfferings',
      'Version': '2013-09-09',
    };
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    duration?.also((arg) => $request['Duration'] = arg);
    filters?.also((arg) => $request['Filters'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    offeringType?.also((arg) => $request['OfferingType'] = arg);
    productDescription?.also((arg) => $request['ProductDescription'] = arg);
    reservedDBInstancesOfferingId
        ?.also((arg) => $request['ReservedDBInstancesOfferingId'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeReservedDBInstancesOfferingsResult',
    );
    return ReservedDBInstancesOfferingMessage.fromXml($result);
  }

  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBLogFileNotFoundFault].
  Future<DownloadDBLogFilePortionDetails> downloadDBLogFilePortion({
    @_s.required String dBInstanceIdentifier,
    @_s.required String logFileName,
    String marker,
    int numberOfLines,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(logFileName, 'logFileName');
    final $request = <String, dynamic>{
      'Action': 'DownloadDBLogFilePortion',
      'Version': '2013-09-09',
    };
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['LogFileName'] = logFileName;
    marker?.also((arg) => $request['Marker'] = arg);
    numberOfLines?.also((arg) => $request['NumberOfLines'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DownloadDBLogFilePortionResult',
    );
    return DownloadDBLogFilePortionDetails.fromXml($result);
  }

  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  Future<TagListMessage> listTagsForResource({
    @_s.required String resourceName,
    List<Filter> filters,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    final $request = <String, dynamic>{
      'Action': 'ListTagsForResource',
      'Version': '2013-09-09',
    };
    $request['ResourceName'] = resourceName;
    filters?.also((arg) => $request['Filters'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ListTagsForResourceResult',
    );
    return TagListMessage.fromXml($result);
  }

  ///
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [InvalidDBSecurityGroupStateFault].
  /// May throw [DBInstanceAlreadyExistsFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [ProvisionedIopsNotAvailableInAZFault].
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [DBUpgradeDependencyFailureFault].
  Future<ModifyDBInstanceResult> modifyDBInstance({
    @_s.required String dBInstanceIdentifier,
    int allocatedStorage,
    bool allowMajorVersionUpgrade,
    bool applyImmediately,
    bool autoMinorVersionUpgrade,
    int backupRetentionPeriod,
    String dBInstanceClass,
    String dBParameterGroupName,
    List<String> dBSecurityGroups,
    String engineVersion,
    int iops,
    String masterUserPassword,
    bool multiAZ,
    String newDBInstanceIdentifier,
    String optionGroupName,
    String preferredBackupWindow,
    String preferredMaintenanceWindow,
    List<String> vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{
      'Action': 'ModifyDBInstance',
      'Version': '2013-09-09',
    };
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    allocatedStorage?.also((arg) => $request['AllocatedStorage'] = arg);
    allowMajorVersionUpgrade
        ?.also((arg) => $request['AllowMajorVersionUpgrade'] = arg);
    applyImmediately?.also((arg) => $request['ApplyImmediately'] = arg);
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    dBParameterGroupName?.also((arg) => $request['DBParameterGroupName'] = arg);
    dBSecurityGroups?.also((arg) => $request['DBSecurityGroups'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    masterUserPassword?.also((arg) => $request['MasterUserPassword'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    newDBInstanceIdentifier
        ?.also((arg) => $request['NewDBInstanceIdentifier'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ModifyDBInstanceResult',
    );
    return ModifyDBInstanceResult.fromXml($result);
  }

  ///
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [InvalidDBParameterGroupStateFault].
  Future<DBParameterGroupNameMessage> modifyDBParameterGroup({
    @_s.required String dBParameterGroupName,
    @_s.required List<Parameter> parameters,
  }) async {
    ArgumentError.checkNotNull(dBParameterGroupName, 'dBParameterGroupName');
    ArgumentError.checkNotNull(parameters, 'parameters');
    final $request = <String, dynamic>{
      'Action': 'ModifyDBParameterGroup',
      'Version': '2013-09-09',
    };
    $request['DBParameterGroupName'] = dBParameterGroupName;
    $request['Parameters'] = parameters;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ModifyDBParameterGroupResult',
    );
    return DBParameterGroupNameMessage.fromXml($result);
  }

  ///
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetQuotaExceededFault].
  /// May throw [SubnetAlreadyInUse].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  Future<ModifyDBSubnetGroupResult> modifyDBSubnetGroup({
    @_s.required String dBSubnetGroupName,
    @_s.required List<String> subnetIds,
    String dBSubnetGroupDescription,
  }) async {
    ArgumentError.checkNotNull(dBSubnetGroupName, 'dBSubnetGroupName');
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    final $request = <String, dynamic>{
      'Action': 'ModifyDBSubnetGroup',
      'Version': '2013-09-09',
    };
    $request['DBSubnetGroupName'] = dBSubnetGroupName;
    $request['SubnetIds'] = subnetIds;
    dBSubnetGroupDescription
        ?.also((arg) => $request['DBSubnetGroupDescription'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ModifyDBSubnetGroupResult',
    );
    return ModifyDBSubnetGroupResult.fromXml($result);
  }

  ///
  /// May throw [EventSubscriptionQuotaExceededFault].
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [SNSInvalidTopicFault].
  /// May throw [SNSNoAuthorizationFault].
  /// May throw [SNSTopicArnNotFoundFault].
  /// May throw [SubscriptionCategoryNotFoundFault].
  Future<ModifyEventSubscriptionResult> modifyEventSubscription({
    @_s.required String subscriptionName,
    bool enabled,
    List<String> eventCategories,
    String snsTopicArn,
    String sourceType,
  }) async {
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final $request = <String, dynamic>{
      'Action': 'ModifyEventSubscription',
      'Version': '2013-09-09',
    };
    $request['SubscriptionName'] = subscriptionName;
    enabled?.also((arg) => $request['Enabled'] = arg);
    eventCategories?.also((arg) => $request['EventCategories'] = arg);
    snsTopicArn?.also((arg) => $request['SnsTopicArn'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ModifyEventSubscriptionResult',
    );
    return ModifyEventSubscriptionResult.fromXml($result);
  }

  ///
  /// May throw [InvalidOptionGroupStateFault].
  /// May throw [OptionGroupNotFoundFault].
  Future<ModifyOptionGroupResult> modifyOptionGroup({
    @_s.required String optionGroupName,
    bool applyImmediately,
    List<OptionConfiguration> optionsToInclude,
    List<String> optionsToRemove,
  }) async {
    ArgumentError.checkNotNull(optionGroupName, 'optionGroupName');
    final $request = <String, dynamic>{
      'Action': 'ModifyOptionGroup',
      'Version': '2013-09-09',
    };
    $request['OptionGroupName'] = optionGroupName;
    applyImmediately?.also((arg) => $request['ApplyImmediately'] = arg);
    optionsToInclude?.also((arg) => $request['OptionsToInclude'] = arg);
    optionsToRemove?.also((arg) => $request['OptionsToRemove'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ModifyOptionGroupResult',
    );
    return ModifyOptionGroupResult.fromXml($result);
  }

  ///
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBInstanceNotFoundFault].
  Future<PromoteReadReplicaResult> promoteReadReplica({
    @_s.required String dBInstanceIdentifier,
    int backupRetentionPeriod,
    String preferredBackupWindow,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{
      'Action': 'PromoteReadReplica',
      'Version': '2013-09-09',
    };
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'PromoteReadReplicaResult',
    );
    return PromoteReadReplicaResult.fromXml($result);
  }

  ///
  /// May throw [ReservedDBInstancesOfferingNotFoundFault].
  /// May throw [ReservedDBInstanceAlreadyExistsFault].
  /// May throw [ReservedDBInstanceQuotaExceededFault].
  Future<PurchaseReservedDBInstancesOfferingResult>
      purchaseReservedDBInstancesOffering({
    @_s.required String reservedDBInstancesOfferingId,
    int dBInstanceCount,
    String reservedDBInstanceId,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        reservedDBInstancesOfferingId, 'reservedDBInstancesOfferingId');
    final $request = <String, dynamic>{
      'Action': 'PurchaseReservedDBInstancesOffering',
      'Version': '2013-09-09',
    };
    $request['ReservedDBInstancesOfferingId'] = reservedDBInstancesOfferingId;
    dBInstanceCount?.also((arg) => $request['DBInstanceCount'] = arg);
    reservedDBInstanceId?.also((arg) => $request['ReservedDBInstanceId'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'PurchaseReservedDBInstancesOfferingResult',
    );
    return PurchaseReservedDBInstancesOfferingResult.fromXml($result);
  }

  ///
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBInstanceNotFoundFault].
  Future<RebootDBInstanceResult> rebootDBInstance({
    @_s.required String dBInstanceIdentifier,
    bool forceFailover,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{
      'Action': 'RebootDBInstance',
      'Version': '2013-09-09',
    };
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    forceFailover?.also((arg) => $request['ForceFailover'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'RebootDBInstanceResult',
    );
    return RebootDBInstanceResult.fromXml($result);
  }

  ///
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [SourceNotFoundFault].
  Future<RemoveSourceIdentifierFromSubscriptionResult>
      removeSourceIdentifierFromSubscription({
    @_s.required String sourceIdentifier,
    @_s.required String subscriptionName,
  }) async {
    ArgumentError.checkNotNull(sourceIdentifier, 'sourceIdentifier');
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final $request = <String, dynamic>{
      'Action': 'RemoveSourceIdentifierFromSubscription',
      'Version': '2013-09-09',
    };
    $request['SourceIdentifier'] = sourceIdentifier;
    $request['SubscriptionName'] = subscriptionName;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'RemoveSourceIdentifierFromSubscriptionResult',
    );
    return RemoveSourceIdentifierFromSubscriptionResult.fromXml($result);
  }

  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  Future<void> removeTagsFromResource({
    @_s.required String resourceName,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $request = <String, dynamic>{
      'Action': 'RemoveTagsFromResource',
      'Version': '2013-09-09',
    };
    $request['ResourceName'] = resourceName;
    $request['TagKeys'] = tagKeys;
    await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  ///
  /// May throw [InvalidDBParameterGroupStateFault].
  /// May throw [DBParameterGroupNotFoundFault].
  Future<DBParameterGroupNameMessage> resetDBParameterGroup({
    @_s.required String dBParameterGroupName,
    List<Parameter> parameters,
    bool resetAllParameters,
  }) async {
    ArgumentError.checkNotNull(dBParameterGroupName, 'dBParameterGroupName');
    final $request = <String, dynamic>{
      'Action': 'ResetDBParameterGroup',
      'Version': '2013-09-09',
    };
    $request['DBParameterGroupName'] = dBParameterGroupName;
    parameters?.also((arg) => $request['Parameters'] = arg);
    resetAllParameters?.also((arg) => $request['ResetAllParameters'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ResetDBParameterGroupResult',
    );
    return DBParameterGroupNameMessage.fromXml($result);
  }

  ///
  /// May throw [DBInstanceAlreadyExistsFault].
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [InstanceQuotaExceededFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [InvalidDBSnapshotStateFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidRestoreFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  /// May throw [ProvisionedIopsNotAvailableInAZFault].
  /// May throw [OptionGroupNotFoundFault].
  Future<RestoreDBInstanceFromDBSnapshotResult>
      restoreDBInstanceFromDBSnapshot({
    @_s.required String dBInstanceIdentifier,
    @_s.required String dBSnapshotIdentifier,
    bool autoMinorVersionUpgrade,
    String availabilityZone,
    String dBInstanceClass,
    String dBName,
    String dBSubnetGroupName,
    String engine,
    int iops,
    String licenseModel,
    bool multiAZ,
    String optionGroupName,
    int port,
    bool publiclyAccessible,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(dBSnapshotIdentifier, 'dBSnapshotIdentifier');
    final $request = <String, dynamic>{
      'Action': 'RestoreDBInstanceFromDBSnapshot',
      'Version': '2013-09-09',
    };
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['DBSnapshotIdentifier'] = dBSnapshotIdentifier;
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    dBName?.also((arg) => $request['DBName'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    engine?.also((arg) => $request['Engine'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    licenseModel?.also((arg) => $request['LicenseModel'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'RestoreDBInstanceFromDBSnapshotResult',
    );
    return RestoreDBInstanceFromDBSnapshotResult.fromXml($result);
  }

  ///
  /// May throw [DBInstanceAlreadyExistsFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InstanceQuotaExceededFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [PointInTimeRestoreNotEnabledFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidRestoreFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  /// May throw [ProvisionedIopsNotAvailableInAZFault].
  /// May throw [OptionGroupNotFoundFault].
  Future<RestoreDBInstanceToPointInTimeResult> restoreDBInstanceToPointInTime({
    @_s.required String sourceDBInstanceIdentifier,
    @_s.required String targetDBInstanceIdentifier,
    bool autoMinorVersionUpgrade,
    String availabilityZone,
    String dBInstanceClass,
    String dBName,
    String dBSubnetGroupName,
    String engine,
    int iops,
    String licenseModel,
    bool multiAZ,
    String optionGroupName,
    int port,
    bool publiclyAccessible,
    DateTime restoreTime,
    List<Tag> tags,
    bool useLatestRestorableTime,
  }) async {
    ArgumentError.checkNotNull(
        sourceDBInstanceIdentifier, 'sourceDBInstanceIdentifier');
    ArgumentError.checkNotNull(
        targetDBInstanceIdentifier, 'targetDBInstanceIdentifier');
    final $request = <String, dynamic>{
      'Action': 'RestoreDBInstanceToPointInTime',
      'Version': '2013-09-09',
    };
    $request['SourceDBInstanceIdentifier'] = sourceDBInstanceIdentifier;
    $request['TargetDBInstanceIdentifier'] = targetDBInstanceIdentifier;
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    dBName?.also((arg) => $request['DBName'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    engine?.also((arg) => $request['Engine'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    licenseModel?.also((arg) => $request['LicenseModel'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    restoreTime?.also((arg) => $request['RestoreTime'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    useLatestRestorableTime
        ?.also((arg) => $request['UseLatestRestorableTime'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'RestoreDBInstanceToPointInTimeResult',
    );
    return RestoreDBInstanceToPointInTimeResult.fromXml($result);
  }

  ///
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [AuthorizationNotFoundFault].
  /// May throw [InvalidDBSecurityGroupStateFault].
  Future<RevokeDBSecurityGroupIngressResult> revokeDBSecurityGroupIngress({
    @_s.required String dBSecurityGroupName,
    String cidrip,
    String eC2SecurityGroupId,
    String eC2SecurityGroupName,
    String eC2SecurityGroupOwnerId,
  }) async {
    ArgumentError.checkNotNull(dBSecurityGroupName, 'dBSecurityGroupName');
    final $request = <String, dynamic>{
      'Action': 'RevokeDBSecurityGroupIngress',
      'Version': '2013-09-09',
    };
    $request['DBSecurityGroupName'] = dBSecurityGroupName;
    cidrip?.also((arg) => $request['CIDRIP'] = arg);
    eC2SecurityGroupId?.also((arg) => $request['EC2SecurityGroupId'] = arg);
    eC2SecurityGroupName?.also((arg) => $request['EC2SecurityGroupName'] = arg);
    eC2SecurityGroupOwnerId
        ?.also((arg) => $request['EC2SecurityGroupOwnerId'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'RevokeDBSecurityGroupIngressResult',
    );
    return RevokeDBSecurityGroupIngressResult.fromXml($result);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class AddSourceIdentifierToSubscriptionResult {
  @_s.JsonKey(name: 'EventSubscription')
  final EventSubscription eventSubscription;

  AddSourceIdentifierToSubscriptionResult({
    this.eventSubscription,
  });
  factory AddSourceIdentifierToSubscriptionResult.fromXml(_s.XmlElement elem) {
    return AddSourceIdentifierToSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let((e) => EventSubscription.fromXml(e)),
    );
  }
}

enum ApplyMethod {
  @_s.JsonValue('immediate')
  immediate,
  @_s.JsonValue('pending-reboot')
  pendingReboot,
}

extension on String {
  ApplyMethod toApplyMethod() {
    switch (this) {
      case 'immediate':
        return ApplyMethod.immediate;
      case 'pending-reboot':
        return ApplyMethod.pendingReboot;
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class AuthorizeDBSecurityGroupIngressResult {
  @_s.JsonKey(name: 'DBSecurityGroup')
  final DBSecurityGroup dBSecurityGroup;

  AuthorizeDBSecurityGroupIngressResult({
    this.dBSecurityGroup,
  });
  factory AuthorizeDBSecurityGroupIngressResult.fromXml(_s.XmlElement elem) {
    return AuthorizeDBSecurityGroupIngressResult(
      dBSecurityGroup: _s
          .extractXmlChild(elem, 'DBSecurityGroup')
          ?.let((e) => DBSecurityGroup.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class AvailabilityZone {
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'ProvisionedIopsCapable')
  final bool provisionedIopsCapable;

  AvailabilityZone({
    this.name,
    this.provisionedIopsCapable,
  });
  factory AvailabilityZone.fromXml(_s.XmlElement elem) {
    return AvailabilityZone(
      name: _s.extractXmlStringValue(elem, 'Name'),
      provisionedIopsCapable:
          _s.extractXmlBoolValue(elem, 'ProvisionedIopsCapable'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class CharacterSet {
  @_s.JsonKey(name: 'CharacterSetDescription')
  final String characterSetDescription;
  @_s.JsonKey(name: 'CharacterSetName')
  final String characterSetName;

  CharacterSet({
    this.characterSetDescription,
    this.characterSetName,
  });
  factory CharacterSet.fromXml(_s.XmlElement elem) {
    return CharacterSet(
      characterSetDescription:
          _s.extractXmlStringValue(elem, 'CharacterSetDescription'),
      characterSetName: _s.extractXmlStringValue(elem, 'CharacterSetName'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class CopyDBSnapshotResult {
  @_s.JsonKey(name: 'DBSnapshot')
  final DBSnapshot dBSnapshot;

  CopyDBSnapshotResult({
    this.dBSnapshot,
  });
  factory CopyDBSnapshotResult.fromXml(_s.XmlElement elem) {
    return CopyDBSnapshotResult(
      dBSnapshot: _s
          .extractXmlChild(elem, 'DBSnapshot')
          ?.let((e) => DBSnapshot.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class CreateDBInstanceReadReplicaResult {
  @_s.JsonKey(name: 'DBInstance')
  final DBInstance dBInstance;

  CreateDBInstanceReadReplicaResult({
    this.dBInstance,
  });
  factory CreateDBInstanceReadReplicaResult.fromXml(_s.XmlElement elem) {
    return CreateDBInstanceReadReplicaResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class CreateDBInstanceResult {
  @_s.JsonKey(name: 'DBInstance')
  final DBInstance dBInstance;

  CreateDBInstanceResult({
    this.dBInstance,
  });
  factory CreateDBInstanceResult.fromXml(_s.XmlElement elem) {
    return CreateDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class CreateDBParameterGroupResult {
  @_s.JsonKey(name: 'DBParameterGroup')
  final DBParameterGroup dBParameterGroup;

  CreateDBParameterGroupResult({
    this.dBParameterGroup,
  });
  factory CreateDBParameterGroupResult.fromXml(_s.XmlElement elem) {
    return CreateDBParameterGroupResult(
      dBParameterGroup: _s
          .extractXmlChild(elem, 'DBParameterGroup')
          ?.let((e) => DBParameterGroup.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class CreateDBSecurityGroupResult {
  @_s.JsonKey(name: 'DBSecurityGroup')
  final DBSecurityGroup dBSecurityGroup;

  CreateDBSecurityGroupResult({
    this.dBSecurityGroup,
  });
  factory CreateDBSecurityGroupResult.fromXml(_s.XmlElement elem) {
    return CreateDBSecurityGroupResult(
      dBSecurityGroup: _s
          .extractXmlChild(elem, 'DBSecurityGroup')
          ?.let((e) => DBSecurityGroup.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class CreateDBSnapshotResult {
  @_s.JsonKey(name: 'DBSnapshot')
  final DBSnapshot dBSnapshot;

  CreateDBSnapshotResult({
    this.dBSnapshot,
  });
  factory CreateDBSnapshotResult.fromXml(_s.XmlElement elem) {
    return CreateDBSnapshotResult(
      dBSnapshot: _s
          .extractXmlChild(elem, 'DBSnapshot')
          ?.let((e) => DBSnapshot.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class CreateDBSubnetGroupResult {
  @_s.JsonKey(name: 'DBSubnetGroup')
  final DBSubnetGroup dBSubnetGroup;

  CreateDBSubnetGroupResult({
    this.dBSubnetGroup,
  });
  factory CreateDBSubnetGroupResult.fromXml(_s.XmlElement elem) {
    return CreateDBSubnetGroupResult(
      dBSubnetGroup: _s
          .extractXmlChild(elem, 'DBSubnetGroup')
          ?.let((e) => DBSubnetGroup.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class CreateEventSubscriptionResult {
  @_s.JsonKey(name: 'EventSubscription')
  final EventSubscription eventSubscription;

  CreateEventSubscriptionResult({
    this.eventSubscription,
  });
  factory CreateEventSubscriptionResult.fromXml(_s.XmlElement elem) {
    return CreateEventSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let((e) => EventSubscription.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class CreateOptionGroupResult {
  @_s.JsonKey(name: 'OptionGroup')
  final OptionGroup optionGroup;

  CreateOptionGroupResult({
    this.optionGroup,
  });
  factory CreateOptionGroupResult.fromXml(_s.XmlElement elem) {
    return CreateOptionGroupResult(
      optionGroup: _s
          .extractXmlChild(elem, 'OptionGroup')
          ?.let((e) => OptionGroup.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DBEngineVersion {
  @_s.JsonKey(name: 'DBEngineDescription')
  final String dBEngineDescription;
  @_s.JsonKey(name: 'DBEngineVersionDescription')
  final String dBEngineVersionDescription;
  @_s.JsonKey(name: 'DBParameterGroupFamily')
  final String dBParameterGroupFamily;
  @_s.JsonKey(name: 'DefaultCharacterSet')
  final CharacterSet defaultCharacterSet;
  @_s.JsonKey(name: 'Engine')
  final String engine;
  @_s.JsonKey(name: 'EngineVersion')
  final String engineVersion;
  @_s.JsonKey(name: 'SupportedCharacterSets')
  final List<CharacterSet> supportedCharacterSets;

  DBEngineVersion({
    this.dBEngineDescription,
    this.dBEngineVersionDescription,
    this.dBParameterGroupFamily,
    this.defaultCharacterSet,
    this.engine,
    this.engineVersion,
    this.supportedCharacterSets,
  });
  factory DBEngineVersion.fromXml(_s.XmlElement elem) {
    return DBEngineVersion(
      dBEngineDescription:
          _s.extractXmlStringValue(elem, 'DBEngineDescription'),
      dBEngineVersionDescription:
          _s.extractXmlStringValue(elem, 'DBEngineVersionDescription'),
      dBParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'DBParameterGroupFamily'),
      defaultCharacterSet: _s
          .extractXmlChild(elem, 'DefaultCharacterSet')
          ?.let((e) => CharacterSet.fromXml(e)),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      supportedCharacterSets: _s
          .extractXmlChild(elem, 'SupportedCharacterSets')
          ?.let((elem) => elem
              .findElements('CharacterSet')
              .map((c) => CharacterSet.fromXml(c))
              .toList()),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DBEngineVersionMessage {
  @_s.JsonKey(name: 'DBEngineVersions')
  final List<DBEngineVersion> dBEngineVersions;
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DBEngineVersionMessage({
    this.dBEngineVersions,
    this.marker,
  });
  factory DBEngineVersionMessage.fromXml(_s.XmlElement elem) {
    return DBEngineVersionMessage(
      dBEngineVersions: _s.extractXmlChild(elem, 'DBEngineVersions')?.let(
          (elem) => elem
              .findElements('DBEngineVersion')
              .map((c) => DBEngineVersion.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DBInstance {
  @_s.JsonKey(name: 'AllocatedStorage')
  final int allocatedStorage;
  @_s.JsonKey(name: 'AutoMinorVersionUpgrade')
  final bool autoMinorVersionUpgrade;
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;
  @_s.JsonKey(name: 'BackupRetentionPeriod')
  final int backupRetentionPeriod;
  @_s.JsonKey(name: 'CharacterSetName')
  final String characterSetName;
  @_s.JsonKey(name: 'DBInstanceClass')
  final String dBInstanceClass;
  @_s.JsonKey(name: 'DBInstanceIdentifier')
  final String dBInstanceIdentifier;
  @_s.JsonKey(name: 'DBInstanceStatus')
  final String dBInstanceStatus;
  @_s.JsonKey(name: 'DBName')
  final String dBName;
  @_s.JsonKey(name: 'DBParameterGroups')
  final List<DBParameterGroupStatus> dBParameterGroups;
  @_s.JsonKey(name: 'DBSecurityGroups')
  final List<DBSecurityGroupMembership> dBSecurityGroups;
  @_s.JsonKey(name: 'DBSubnetGroup')
  final DBSubnetGroup dBSubnetGroup;
  @_s.JsonKey(name: 'Endpoint')
  final Endpoint endpoint;
  @_s.JsonKey(name: 'Engine')
  final String engine;
  @_s.JsonKey(name: 'EngineVersion')
  final String engineVersion;
  @_s.JsonKey(
      name: 'InstanceCreateTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime instanceCreateTime;
  @_s.JsonKey(name: 'Iops')
  final int iops;
  @_s.JsonKey(
      name: 'LatestRestorableTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime latestRestorableTime;
  @_s.JsonKey(name: 'LicenseModel')
  final String licenseModel;
  @_s.JsonKey(name: 'MasterUsername')
  final String masterUsername;
  @_s.JsonKey(name: 'MultiAZ')
  final bool multiAZ;
  @_s.JsonKey(name: 'OptionGroupMemberships')
  final List<OptionGroupMembership> optionGroupMemberships;
  @_s.JsonKey(name: 'PendingModifiedValues')
  final PendingModifiedValues pendingModifiedValues;
  @_s.JsonKey(name: 'PreferredBackupWindow')
  final String preferredBackupWindow;
  @_s.JsonKey(name: 'PreferredMaintenanceWindow')
  final String preferredMaintenanceWindow;
  @_s.JsonKey(name: 'PubliclyAccessible')
  final bool publiclyAccessible;
  @_s.JsonKey(name: 'ReadReplicaDBInstanceIdentifiers')
  final List<String> readReplicaDBInstanceIdentifiers;
  @_s.JsonKey(name: 'ReadReplicaSourceDBInstanceIdentifier')
  final String readReplicaSourceDBInstanceIdentifier;
  @_s.JsonKey(name: 'SecondaryAvailabilityZone')
  final String secondaryAvailabilityZone;
  @_s.JsonKey(name: 'StatusInfos')
  final List<DBInstanceStatusInfo> statusInfos;
  @_s.JsonKey(name: 'VpcSecurityGroups')
  final List<VpcSecurityGroupMembership> vpcSecurityGroups;

  DBInstance({
    this.allocatedStorage,
    this.autoMinorVersionUpgrade,
    this.availabilityZone,
    this.backupRetentionPeriod,
    this.characterSetName,
    this.dBInstanceClass,
    this.dBInstanceIdentifier,
    this.dBInstanceStatus,
    this.dBName,
    this.dBParameterGroups,
    this.dBSecurityGroups,
    this.dBSubnetGroup,
    this.endpoint,
    this.engine,
    this.engineVersion,
    this.instanceCreateTime,
    this.iops,
    this.latestRestorableTime,
    this.licenseModel,
    this.masterUsername,
    this.multiAZ,
    this.optionGroupMemberships,
    this.pendingModifiedValues,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.publiclyAccessible,
    this.readReplicaDBInstanceIdentifiers,
    this.readReplicaSourceDBInstanceIdentifier,
    this.secondaryAvailabilityZone,
    this.statusInfos,
    this.vpcSecurityGroups,
  });
  factory DBInstance.fromXml(_s.XmlElement elem) {
    return DBInstance(
      allocatedStorage: _s.extractXmlIntValue(elem, 'AllocatedStorage'),
      autoMinorVersionUpgrade:
          _s.extractXmlBoolValue(elem, 'AutoMinorVersionUpgrade'),
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      backupRetentionPeriod:
          _s.extractXmlIntValue(elem, 'BackupRetentionPeriod'),
      characterSetName: _s.extractXmlStringValue(elem, 'CharacterSetName'),
      dBInstanceClass: _s.extractXmlStringValue(elem, 'DBInstanceClass'),
      dBInstanceIdentifier:
          _s.extractXmlStringValue(elem, 'DBInstanceIdentifier'),
      dBInstanceStatus: _s.extractXmlStringValue(elem, 'DBInstanceStatus'),
      dBName: _s.extractXmlStringValue(elem, 'DBName'),
      dBParameterGroups: _s.extractXmlChild(elem, 'DBParameterGroups')?.let(
          (elem) => elem
              .findElements('DBParameterGroup')
              .map((c) => DBParameterGroupStatus.fromXml(c))
              .toList()),
      dBSecurityGroups: _s.extractXmlChild(elem, 'DBSecurityGroups')?.let(
          (elem) => elem
              .findElements('DBSecurityGroup')
              .map((c) => DBSecurityGroupMembership.fromXml(c))
              .toList()),
      dBSubnetGroup: _s
          .extractXmlChild(elem, 'DBSubnetGroup')
          ?.let((e) => DBSubnetGroup.fromXml(e)),
      endpoint:
          _s.extractXmlChild(elem, 'Endpoint')?.let((e) => Endpoint.fromXml(e)),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      instanceCreateTime:
          _s.extractXmlDateTimeValue(elem, 'InstanceCreateTime'),
      iops: _s.extractXmlIntValue(elem, 'Iops'),
      latestRestorableTime:
          _s.extractXmlDateTimeValue(elem, 'LatestRestorableTime'),
      licenseModel: _s.extractXmlStringValue(elem, 'LicenseModel'),
      masterUsername: _s.extractXmlStringValue(elem, 'MasterUsername'),
      multiAZ: _s.extractXmlBoolValue(elem, 'MultiAZ'),
      optionGroupMemberships: _s
          .extractXmlChild(elem, 'OptionGroupMemberships')
          ?.let((elem) => elem
              .findElements('OptionGroupMembership')
              .map((c) => OptionGroupMembership.fromXml(c))
              .toList()),
      pendingModifiedValues: _s
          .extractXmlChild(elem, 'PendingModifiedValues')
          ?.let((e) => PendingModifiedValues.fromXml(e)),
      preferredBackupWindow:
          _s.extractXmlStringValue(elem, 'PreferredBackupWindow'),
      preferredMaintenanceWindow:
          _s.extractXmlStringValue(elem, 'PreferredMaintenanceWindow'),
      publiclyAccessible: _s.extractXmlBoolValue(elem, 'PubliclyAccessible'),
      readReplicaDBInstanceIdentifiers: _s
          .extractXmlChild(elem, 'ReadReplicaDBInstanceIdentifiers')
          ?.let((elem) => _s.extractXmlStringListValues(
              elem, 'ReadReplicaDBInstanceIdentifier')),
      readReplicaSourceDBInstanceIdentifier: _s.extractXmlStringValue(
          elem, 'ReadReplicaSourceDBInstanceIdentifier'),
      secondaryAvailabilityZone:
          _s.extractXmlStringValue(elem, 'SecondaryAvailabilityZone'),
      statusInfos: _s.extractXmlChild(elem, 'StatusInfos')?.let((elem) => elem
          .findElements('DBInstanceStatusInfo')
          .map((c) => DBInstanceStatusInfo.fromXml(c))
          .toList()),
      vpcSecurityGroups: _s.extractXmlChild(elem, 'VpcSecurityGroups')?.let(
          (elem) => elem
              .findElements('VpcSecurityGroupMembership')
              .map((c) => VpcSecurityGroupMembership.fromXml(c))
              .toList()),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DBInstanceMessage {
  @_s.JsonKey(name: 'DBInstances')
  final List<DBInstance> dBInstances;
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DBInstanceMessage({
    this.dBInstances,
    this.marker,
  });
  factory DBInstanceMessage.fromXml(_s.XmlElement elem) {
    return DBInstanceMessage(
      dBInstances: _s.extractXmlChild(elem, 'DBInstances')?.let((elem) => elem
          .findElements('DBInstance')
          .map((c) => DBInstance.fromXml(c))
          .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DBInstanceStatusInfo {
  @_s.JsonKey(name: 'Message')
  final String message;
  @_s.JsonKey(name: 'Normal')
  final bool normal;
  @_s.JsonKey(name: 'Status')
  final String status;
  @_s.JsonKey(name: 'StatusType')
  final String statusType;

  DBInstanceStatusInfo({
    this.message,
    this.normal,
    this.status,
    this.statusType,
  });
  factory DBInstanceStatusInfo.fromXml(_s.XmlElement elem) {
    return DBInstanceStatusInfo(
      message: _s.extractXmlStringValue(elem, 'Message'),
      normal: _s.extractXmlBoolValue(elem, 'Normal'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      statusType: _s.extractXmlStringValue(elem, 'StatusType'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DBParameterGroup {
  @_s.JsonKey(name: 'DBParameterGroupFamily')
  final String dBParameterGroupFamily;
  @_s.JsonKey(name: 'DBParameterGroupName')
  final String dBParameterGroupName;
  @_s.JsonKey(name: 'Description')
  final String description;

  DBParameterGroup({
    this.dBParameterGroupFamily,
    this.dBParameterGroupName,
    this.description,
  });
  factory DBParameterGroup.fromXml(_s.XmlElement elem) {
    return DBParameterGroup(
      dBParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'DBParameterGroupFamily'),
      dBParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBParameterGroupName'),
      description: _s.extractXmlStringValue(elem, 'Description'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DBParameterGroupDetails {
  @_s.JsonKey(name: 'Marker')
  final String marker;
  @_s.JsonKey(name: 'Parameters')
  final List<Parameter> parameters;

  DBParameterGroupDetails({
    this.marker,
    this.parameters,
  });
  factory DBParameterGroupDetails.fromXml(_s.XmlElement elem) {
    return DBParameterGroupDetails(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) => elem
          .findElements('Parameter')
          .map((c) => Parameter.fromXml(c))
          .toList()),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DBParameterGroupNameMessage {
  @_s.JsonKey(name: 'DBParameterGroupName')
  final String dBParameterGroupName;

  DBParameterGroupNameMessage({
    this.dBParameterGroupName,
  });
  factory DBParameterGroupNameMessage.fromXml(_s.XmlElement elem) {
    return DBParameterGroupNameMessage(
      dBParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBParameterGroupName'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DBParameterGroupStatus {
  @_s.JsonKey(name: 'DBParameterGroupName')
  final String dBParameterGroupName;
  @_s.JsonKey(name: 'ParameterApplyStatus')
  final String parameterApplyStatus;

  DBParameterGroupStatus({
    this.dBParameterGroupName,
    this.parameterApplyStatus,
  });
  factory DBParameterGroupStatus.fromXml(_s.XmlElement elem) {
    return DBParameterGroupStatus(
      dBParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBParameterGroupName'),
      parameterApplyStatus:
          _s.extractXmlStringValue(elem, 'ParameterApplyStatus'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DBParameterGroupsMessage {
  @_s.JsonKey(name: 'DBParameterGroups')
  final List<DBParameterGroup> dBParameterGroups;
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DBParameterGroupsMessage({
    this.dBParameterGroups,
    this.marker,
  });
  factory DBParameterGroupsMessage.fromXml(_s.XmlElement elem) {
    return DBParameterGroupsMessage(
      dBParameterGroups: _s.extractXmlChild(elem, 'DBParameterGroups')?.let(
          (elem) => elem
              .findElements('DBParameterGroup')
              .map((c) => DBParameterGroup.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DBSecurityGroup {
  @_s.JsonKey(name: 'DBSecurityGroupDescription')
  final String dBSecurityGroupDescription;
  @_s.JsonKey(name: 'DBSecurityGroupName')
  final String dBSecurityGroupName;
  @_s.JsonKey(name: 'EC2SecurityGroups')
  final List<EC2SecurityGroup> eC2SecurityGroups;
  @_s.JsonKey(name: 'IPRanges')
  final List<IPRange> iPRanges;
  @_s.JsonKey(name: 'OwnerId')
  final String ownerId;
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  DBSecurityGroup({
    this.dBSecurityGroupDescription,
    this.dBSecurityGroupName,
    this.eC2SecurityGroups,
    this.iPRanges,
    this.ownerId,
    this.vpcId,
  });
  factory DBSecurityGroup.fromXml(_s.XmlElement elem) {
    return DBSecurityGroup(
      dBSecurityGroupDescription:
          _s.extractXmlStringValue(elem, 'DBSecurityGroupDescription'),
      dBSecurityGroupName:
          _s.extractXmlStringValue(elem, 'DBSecurityGroupName'),
      eC2SecurityGroups: _s.extractXmlChild(elem, 'EC2SecurityGroups')?.let(
          (elem) => elem
              .findElements('EC2SecurityGroup')
              .map((c) => EC2SecurityGroup.fromXml(c))
              .toList()),
      iPRanges: _s.extractXmlChild(elem, 'IPRanges')?.let((elem) =>
          elem.findElements('IPRange').map((c) => IPRange.fromXml(c)).toList()),
      ownerId: _s.extractXmlStringValue(elem, 'OwnerId'),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DBSecurityGroupMembership {
  @_s.JsonKey(name: 'DBSecurityGroupName')
  final String dBSecurityGroupName;
  @_s.JsonKey(name: 'Status')
  final String status;

  DBSecurityGroupMembership({
    this.dBSecurityGroupName,
    this.status,
  });
  factory DBSecurityGroupMembership.fromXml(_s.XmlElement elem) {
    return DBSecurityGroupMembership(
      dBSecurityGroupName:
          _s.extractXmlStringValue(elem, 'DBSecurityGroupName'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DBSecurityGroupMessage {
  @_s.JsonKey(name: 'DBSecurityGroups')
  final List<DBSecurityGroup> dBSecurityGroups;
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DBSecurityGroupMessage({
    this.dBSecurityGroups,
    this.marker,
  });
  factory DBSecurityGroupMessage.fromXml(_s.XmlElement elem) {
    return DBSecurityGroupMessage(
      dBSecurityGroups: _s.extractXmlChild(elem, 'DBSecurityGroups')?.let(
          (elem) => elem
              .findElements('DBSecurityGroup')
              .map((c) => DBSecurityGroup.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DBSnapshot {
  @_s.JsonKey(name: 'AllocatedStorage')
  final int allocatedStorage;
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;
  @_s.JsonKey(name: 'DBInstanceIdentifier')
  final String dBInstanceIdentifier;
  @_s.JsonKey(name: 'DBSnapshotIdentifier')
  final String dBSnapshotIdentifier;
  @_s.JsonKey(name: 'Engine')
  final String engine;
  @_s.JsonKey(name: 'EngineVersion')
  final String engineVersion;
  @_s.JsonKey(
      name: 'InstanceCreateTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime instanceCreateTime;
  @_s.JsonKey(name: 'Iops')
  final int iops;
  @_s.JsonKey(name: 'LicenseModel')
  final String licenseModel;
  @_s.JsonKey(name: 'MasterUsername')
  final String masterUsername;
  @_s.JsonKey(name: 'OptionGroupName')
  final String optionGroupName;
  @_s.JsonKey(name: 'PercentProgress')
  final int percentProgress;
  @_s.JsonKey(name: 'Port')
  final int port;
  @_s.JsonKey(
      name: 'SnapshotCreateTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime snapshotCreateTime;
  @_s.JsonKey(name: 'SnapshotType')
  final String snapshotType;
  @_s.JsonKey(name: 'SourceRegion')
  final String sourceRegion;
  @_s.JsonKey(name: 'Status')
  final String status;
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  DBSnapshot({
    this.allocatedStorage,
    this.availabilityZone,
    this.dBInstanceIdentifier,
    this.dBSnapshotIdentifier,
    this.engine,
    this.engineVersion,
    this.instanceCreateTime,
    this.iops,
    this.licenseModel,
    this.masterUsername,
    this.optionGroupName,
    this.percentProgress,
    this.port,
    this.snapshotCreateTime,
    this.snapshotType,
    this.sourceRegion,
    this.status,
    this.vpcId,
  });
  factory DBSnapshot.fromXml(_s.XmlElement elem) {
    return DBSnapshot(
      allocatedStorage: _s.extractXmlIntValue(elem, 'AllocatedStorage'),
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      dBInstanceIdentifier:
          _s.extractXmlStringValue(elem, 'DBInstanceIdentifier'),
      dBSnapshotIdentifier:
          _s.extractXmlStringValue(elem, 'DBSnapshotIdentifier'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      instanceCreateTime:
          _s.extractXmlDateTimeValue(elem, 'InstanceCreateTime'),
      iops: _s.extractXmlIntValue(elem, 'Iops'),
      licenseModel: _s.extractXmlStringValue(elem, 'LicenseModel'),
      masterUsername: _s.extractXmlStringValue(elem, 'MasterUsername'),
      optionGroupName: _s.extractXmlStringValue(elem, 'OptionGroupName'),
      percentProgress: _s.extractXmlIntValue(elem, 'PercentProgress'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      snapshotCreateTime:
          _s.extractXmlDateTimeValue(elem, 'SnapshotCreateTime'),
      snapshotType: _s.extractXmlStringValue(elem, 'SnapshotType'),
      sourceRegion: _s.extractXmlStringValue(elem, 'SourceRegion'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DBSnapshotMessage {
  @_s.JsonKey(name: 'DBSnapshots')
  final List<DBSnapshot> dBSnapshots;
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DBSnapshotMessage({
    this.dBSnapshots,
    this.marker,
  });
  factory DBSnapshotMessage.fromXml(_s.XmlElement elem) {
    return DBSnapshotMessage(
      dBSnapshots: _s.extractXmlChild(elem, 'DBSnapshots')?.let((elem) => elem
          .findElements('DBSnapshot')
          .map((c) => DBSnapshot.fromXml(c))
          .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DBSubnetGroup {
  @_s.JsonKey(name: 'DBSubnetGroupDescription')
  final String dBSubnetGroupDescription;
  @_s.JsonKey(name: 'DBSubnetGroupName')
  final String dBSubnetGroupName;
  @_s.JsonKey(name: 'SubnetGroupStatus')
  final String subnetGroupStatus;
  @_s.JsonKey(name: 'Subnets')
  final List<Subnet> subnets;
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  DBSubnetGroup({
    this.dBSubnetGroupDescription,
    this.dBSubnetGroupName,
    this.subnetGroupStatus,
    this.subnets,
    this.vpcId,
  });
  factory DBSubnetGroup.fromXml(_s.XmlElement elem) {
    return DBSubnetGroup(
      dBSubnetGroupDescription:
          _s.extractXmlStringValue(elem, 'DBSubnetGroupDescription'),
      dBSubnetGroupName: _s.extractXmlStringValue(elem, 'DBSubnetGroupName'),
      subnetGroupStatus: _s.extractXmlStringValue(elem, 'SubnetGroupStatus'),
      subnets: _s.extractXmlChild(elem, 'Subnets')?.let((elem) =>
          elem.findElements('Subnet').map((c) => Subnet.fromXml(c)).toList()),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DBSubnetGroupMessage {
  @_s.JsonKey(name: 'DBSubnetGroups')
  final List<DBSubnetGroup> dBSubnetGroups;
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DBSubnetGroupMessage({
    this.dBSubnetGroups,
    this.marker,
  });
  factory DBSubnetGroupMessage.fromXml(_s.XmlElement elem) {
    return DBSubnetGroupMessage(
      dBSubnetGroups: _s.extractXmlChild(elem, 'DBSubnetGroups')?.let((elem) =>
          elem
              .findElements('DBSubnetGroup')
              .map((c) => DBSubnetGroup.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DeleteDBInstanceResult {
  @_s.JsonKey(name: 'DBInstance')
  final DBInstance dBInstance;

  DeleteDBInstanceResult({
    this.dBInstance,
  });
  factory DeleteDBInstanceResult.fromXml(_s.XmlElement elem) {
    return DeleteDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DeleteDBSnapshotResult {
  @_s.JsonKey(name: 'DBSnapshot')
  final DBSnapshot dBSnapshot;

  DeleteDBSnapshotResult({
    this.dBSnapshot,
  });
  factory DeleteDBSnapshotResult.fromXml(_s.XmlElement elem) {
    return DeleteDBSnapshotResult(
      dBSnapshot: _s
          .extractXmlChild(elem, 'DBSnapshot')
          ?.let((e) => DBSnapshot.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DeleteEventSubscriptionResult {
  @_s.JsonKey(name: 'EventSubscription')
  final EventSubscription eventSubscription;

  DeleteEventSubscriptionResult({
    this.eventSubscription,
  });
  factory DeleteEventSubscriptionResult.fromXml(_s.XmlElement elem) {
    return DeleteEventSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let((e) => EventSubscription.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DescribeDBLogFilesDetails {
  @_s.JsonKey(name: 'LastWritten')
  final int lastWritten;
  @_s.JsonKey(name: 'LogFileName')
  final String logFileName;
  @_s.JsonKey(name: 'Size')
  final int size;

  DescribeDBLogFilesDetails({
    this.lastWritten,
    this.logFileName,
    this.size,
  });
  factory DescribeDBLogFilesDetails.fromXml(_s.XmlElement elem) {
    return DescribeDBLogFilesDetails(
      lastWritten: _s.extractXmlIntValue(elem, 'LastWritten'),
      logFileName: _s.extractXmlStringValue(elem, 'LogFileName'),
      size: _s.extractXmlIntValue(elem, 'Size'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DescribeDBLogFilesResponse {
  @_s.JsonKey(name: 'DescribeDBLogFiles')
  final List<DescribeDBLogFilesDetails> describeDBLogFiles;
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DescribeDBLogFilesResponse({
    this.describeDBLogFiles,
    this.marker,
  });
  factory DescribeDBLogFilesResponse.fromXml(_s.XmlElement elem) {
    return DescribeDBLogFilesResponse(
      describeDBLogFiles: _s.extractXmlChild(elem, 'DescribeDBLogFiles')?.let(
          (elem) => elem
              .findElements('DescribeDBLogFilesDetails')
              .map((c) => DescribeDBLogFilesDetails.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DescribeEngineDefaultParametersResult {
  @_s.JsonKey(name: 'EngineDefaults')
  final EngineDefaults engineDefaults;

  DescribeEngineDefaultParametersResult({
    this.engineDefaults,
  });
  factory DescribeEngineDefaultParametersResult.fromXml(_s.XmlElement elem) {
    return DescribeEngineDefaultParametersResult(
      engineDefaults: _s
          .extractXmlChild(elem, 'EngineDefaults')
          ?.let((e) => EngineDefaults.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class DownloadDBLogFilePortionDetails {
  @_s.JsonKey(name: 'AdditionalDataPending')
  final bool additionalDataPending;
  @_s.JsonKey(name: 'LogFileData')
  final String logFileData;
  @_s.JsonKey(name: 'Marker')
  final String marker;

  DownloadDBLogFilePortionDetails({
    this.additionalDataPending,
    this.logFileData,
    this.marker,
  });
  factory DownloadDBLogFilePortionDetails.fromXml(_s.XmlElement elem) {
    return DownloadDBLogFilePortionDetails(
      additionalDataPending:
          _s.extractXmlBoolValue(elem, 'AdditionalDataPending'),
      logFileData: _s.extractXmlStringValue(elem, 'LogFileData'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class EC2SecurityGroup {
  @_s.JsonKey(name: 'EC2SecurityGroupId')
  final String eC2SecurityGroupId;
  @_s.JsonKey(name: 'EC2SecurityGroupName')
  final String eC2SecurityGroupName;
  @_s.JsonKey(name: 'EC2SecurityGroupOwnerId')
  final String eC2SecurityGroupOwnerId;
  @_s.JsonKey(name: 'Status')
  final String status;

  EC2SecurityGroup({
    this.eC2SecurityGroupId,
    this.eC2SecurityGroupName,
    this.eC2SecurityGroupOwnerId,
    this.status,
  });
  factory EC2SecurityGroup.fromXml(_s.XmlElement elem) {
    return EC2SecurityGroup(
      eC2SecurityGroupId: _s.extractXmlStringValue(elem, 'EC2SecurityGroupId'),
      eC2SecurityGroupName:
          _s.extractXmlStringValue(elem, 'EC2SecurityGroupName'),
      eC2SecurityGroupOwnerId:
          _s.extractXmlStringValue(elem, 'EC2SecurityGroupOwnerId'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class Endpoint {
  @_s.JsonKey(name: 'Address')
  final String address;
  @_s.JsonKey(name: 'Port')
  final int port;

  Endpoint({
    this.address,
    this.port,
  });
  factory Endpoint.fromXml(_s.XmlElement elem) {
    return Endpoint(
      address: _s.extractXmlStringValue(elem, 'Address'),
      port: _s.extractXmlIntValue(elem, 'Port'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class EngineDefaults {
  @_s.JsonKey(name: 'DBParameterGroupFamily')
  final String dBParameterGroupFamily;
  @_s.JsonKey(name: 'Marker')
  final String marker;
  @_s.JsonKey(name: 'Parameters')
  final List<Parameter> parameters;

  EngineDefaults({
    this.dBParameterGroupFamily,
    this.marker,
    this.parameters,
  });
  factory EngineDefaults.fromXml(_s.XmlElement elem) {
    return EngineDefaults(
      dBParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'DBParameterGroupFamily'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) => elem
          .findElements('Parameter')
          .map((c) => Parameter.fromXml(c))
          .toList()),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class Event {
  @_s.JsonKey(name: 'Date', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime date;
  @_s.JsonKey(name: 'EventCategories')
  final List<String> eventCategories;
  @_s.JsonKey(name: 'Message')
  final String message;
  @_s.JsonKey(name: 'SourceIdentifier')
  final String sourceIdentifier;
  @_s.JsonKey(name: 'SourceType')
  final SourceType sourceType;

  Event({
    this.date,
    this.eventCategories,
    this.message,
    this.sourceIdentifier,
    this.sourceType,
  });
  factory Event.fromXml(_s.XmlElement elem) {
    return Event(
      date: _s.extractXmlDateTimeValue(elem, 'Date'),
      eventCategories: _s
          .extractXmlChild(elem, 'EventCategories')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'EventCategory')),
      message: _s.extractXmlStringValue(elem, 'Message'),
      sourceIdentifier: _s.extractXmlStringValue(elem, 'SourceIdentifier'),
      sourceType: _s.extractXmlStringValue(elem, 'SourceType')?.toSourceType(),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class EventCategoriesMap {
  @_s.JsonKey(name: 'EventCategories')
  final List<String> eventCategories;
  @_s.JsonKey(name: 'SourceType')
  final String sourceType;

  EventCategoriesMap({
    this.eventCategories,
    this.sourceType,
  });
  factory EventCategoriesMap.fromXml(_s.XmlElement elem) {
    return EventCategoriesMap(
      eventCategories: _s
          .extractXmlChild(elem, 'EventCategories')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'EventCategory')),
      sourceType: _s.extractXmlStringValue(elem, 'SourceType'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class EventCategoriesMessage {
  @_s.JsonKey(name: 'EventCategoriesMapList')
  final List<EventCategoriesMap> eventCategoriesMapList;

  EventCategoriesMessage({
    this.eventCategoriesMapList,
  });
  factory EventCategoriesMessage.fromXml(_s.XmlElement elem) {
    return EventCategoriesMessage(
      eventCategoriesMapList: _s
          .extractXmlChild(elem, 'EventCategoriesMapList')
          ?.let((elem) => elem
              .findElements('EventCategoriesMap')
              .map((c) => EventCategoriesMap.fromXml(c))
              .toList()),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class EventSubscription {
  @_s.JsonKey(name: 'CustSubscriptionId')
  final String custSubscriptionId;
  @_s.JsonKey(name: 'CustomerAwsId')
  final String customerAwsId;
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;
  @_s.JsonKey(name: 'EventCategoriesList')
  final List<String> eventCategoriesList;
  @_s.JsonKey(name: 'SnsTopicArn')
  final String snsTopicArn;
  @_s.JsonKey(name: 'SourceIdsList')
  final List<String> sourceIdsList;
  @_s.JsonKey(name: 'SourceType')
  final String sourceType;
  @_s.JsonKey(name: 'Status')
  final String status;
  @_s.JsonKey(name: 'SubscriptionCreationTime')
  final String subscriptionCreationTime;

  EventSubscription({
    this.custSubscriptionId,
    this.customerAwsId,
    this.enabled,
    this.eventCategoriesList,
    this.snsTopicArn,
    this.sourceIdsList,
    this.sourceType,
    this.status,
    this.subscriptionCreationTime,
  });
  factory EventSubscription.fromXml(_s.XmlElement elem) {
    return EventSubscription(
      custSubscriptionId: _s.extractXmlStringValue(elem, 'CustSubscriptionId'),
      customerAwsId: _s.extractXmlStringValue(elem, 'CustomerAwsId'),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      eventCategoriesList: _s
          .extractXmlChild(elem, 'EventCategoriesList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'EventCategory')),
      snsTopicArn: _s.extractXmlStringValue(elem, 'SnsTopicArn'),
      sourceIdsList: _s
          .extractXmlChild(elem, 'SourceIdsList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'SourceId')),
      sourceType: _s.extractXmlStringValue(elem, 'SourceType'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      subscriptionCreationTime:
          _s.extractXmlStringValue(elem, 'SubscriptionCreationTime'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class EventSubscriptionsMessage {
  @_s.JsonKey(name: 'EventSubscriptionsList')
  final List<EventSubscription> eventSubscriptionsList;
  @_s.JsonKey(name: 'Marker')
  final String marker;

  EventSubscriptionsMessage({
    this.eventSubscriptionsList,
    this.marker,
  });
  factory EventSubscriptionsMessage.fromXml(_s.XmlElement elem) {
    return EventSubscriptionsMessage(
      eventSubscriptionsList: _s
          .extractXmlChild(elem, 'EventSubscriptionsList')
          ?.let((elem) => elem
              .findElements('EventSubscription')
              .map((c) => EventSubscription.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class EventsMessage {
  @_s.JsonKey(name: 'Events')
  final List<Event> events;
  @_s.JsonKey(name: 'Marker')
  final String marker;

  EventsMessage({
    this.events,
    this.marker,
  });
  factory EventsMessage.fromXml(_s.XmlElement elem) {
    return EventsMessage(
      events: _s.extractXmlChild(elem, 'Events')?.let((elem) =>
          elem.findElements('Event').map((c) => Event.fromXml(c)).toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  Filter({
    @_s.required this.name,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class IPRange {
  @_s.JsonKey(name: 'CIDRIP')
  final String cidrip;
  @_s.JsonKey(name: 'Status')
  final String status;

  IPRange({
    this.cidrip,
    this.status,
  });
  factory IPRange.fromXml(_s.XmlElement elem) {
    return IPRange(
      cidrip: _s.extractXmlStringValue(elem, 'CIDRIP'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class ModifyDBInstanceResult {
  @_s.JsonKey(name: 'DBInstance')
  final DBInstance dBInstance;

  ModifyDBInstanceResult({
    this.dBInstance,
  });
  factory ModifyDBInstanceResult.fromXml(_s.XmlElement elem) {
    return ModifyDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class ModifyDBSubnetGroupResult {
  @_s.JsonKey(name: 'DBSubnetGroup')
  final DBSubnetGroup dBSubnetGroup;

  ModifyDBSubnetGroupResult({
    this.dBSubnetGroup,
  });
  factory ModifyDBSubnetGroupResult.fromXml(_s.XmlElement elem) {
    return ModifyDBSubnetGroupResult(
      dBSubnetGroup: _s
          .extractXmlChild(elem, 'DBSubnetGroup')
          ?.let((e) => DBSubnetGroup.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class ModifyEventSubscriptionResult {
  @_s.JsonKey(name: 'EventSubscription')
  final EventSubscription eventSubscription;

  ModifyEventSubscriptionResult({
    this.eventSubscription,
  });
  factory ModifyEventSubscriptionResult.fromXml(_s.XmlElement elem) {
    return ModifyEventSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let((e) => EventSubscription.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class ModifyOptionGroupResult {
  @_s.JsonKey(name: 'OptionGroup')
  final OptionGroup optionGroup;

  ModifyOptionGroupResult({
    this.optionGroup,
  });
  factory ModifyOptionGroupResult.fromXml(_s.XmlElement elem) {
    return ModifyOptionGroupResult(
      optionGroup: _s
          .extractXmlChild(elem, 'OptionGroup')
          ?.let((e) => OptionGroup.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class Option {
  @_s.JsonKey(name: 'DBSecurityGroupMemberships')
  final List<DBSecurityGroupMembership> dBSecurityGroupMemberships;
  @_s.JsonKey(name: 'OptionDescription')
  final String optionDescription;
  @_s.JsonKey(name: 'OptionName')
  final String optionName;
  @_s.JsonKey(name: 'OptionSettings')
  final List<OptionSetting> optionSettings;
  @_s.JsonKey(name: 'Permanent')
  final bool permanent;
  @_s.JsonKey(name: 'Persistent')
  final bool persistent;
  @_s.JsonKey(name: 'Port')
  final int port;
  @_s.JsonKey(name: 'VpcSecurityGroupMemberships')
  final List<VpcSecurityGroupMembership> vpcSecurityGroupMemberships;

  Option({
    this.dBSecurityGroupMemberships,
    this.optionDescription,
    this.optionName,
    this.optionSettings,
    this.permanent,
    this.persistent,
    this.port,
    this.vpcSecurityGroupMemberships,
  });
  factory Option.fromXml(_s.XmlElement elem) {
    return Option(
      dBSecurityGroupMemberships: _s
          .extractXmlChild(elem, 'DBSecurityGroupMemberships')
          ?.let((elem) => elem
              .findElements('DBSecurityGroup')
              .map((c) => DBSecurityGroupMembership.fromXml(c))
              .toList()),
      optionDescription: _s.extractXmlStringValue(elem, 'OptionDescription'),
      optionName: _s.extractXmlStringValue(elem, 'OptionName'),
      optionSettings: _s.extractXmlChild(elem, 'OptionSettings')?.let((elem) =>
          elem
              .findElements('OptionSetting')
              .map((c) => OptionSetting.fromXml(c))
              .toList()),
      permanent: _s.extractXmlBoolValue(elem, 'Permanent'),
      persistent: _s.extractXmlBoolValue(elem, 'Persistent'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      vpcSecurityGroupMemberships: _s
          .extractXmlChild(elem, 'VpcSecurityGroupMemberships')
          ?.let((elem) => elem
              .findElements('VpcSecurityGroupMembership')
              .map((c) => VpcSecurityGroupMembership.fromXml(c))
              .toList()),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OptionConfiguration {
  @_s.JsonKey(name: 'OptionName')
  final String optionName;
  @_s.JsonKey(name: 'DBSecurityGroupMemberships')
  final List<String> dBSecurityGroupMemberships;
  @_s.JsonKey(name: 'OptionSettings')
  final List<OptionSetting> optionSettings;
  @_s.JsonKey(name: 'Port')
  final int port;
  @_s.JsonKey(name: 'VpcSecurityGroupMemberships')
  final List<String> vpcSecurityGroupMemberships;

  OptionConfiguration({
    @_s.required this.optionName,
    this.dBSecurityGroupMemberships,
    this.optionSettings,
    this.port,
    this.vpcSecurityGroupMemberships,
  });
  Map<String, dynamic> toJson() => _$OptionConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class OptionGroup {
  @_s.JsonKey(name: 'AllowsVpcAndNonVpcInstanceMemberships')
  final bool allowsVpcAndNonVpcInstanceMemberships;
  @_s.JsonKey(name: 'EngineName')
  final String engineName;
  @_s.JsonKey(name: 'MajorEngineVersion')
  final String majorEngineVersion;
  @_s.JsonKey(name: 'OptionGroupDescription')
  final String optionGroupDescription;
  @_s.JsonKey(name: 'OptionGroupName')
  final String optionGroupName;
  @_s.JsonKey(name: 'Options')
  final List<Option> options;
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  OptionGroup({
    this.allowsVpcAndNonVpcInstanceMemberships,
    this.engineName,
    this.majorEngineVersion,
    this.optionGroupDescription,
    this.optionGroupName,
    this.options,
    this.vpcId,
  });
  factory OptionGroup.fromXml(_s.XmlElement elem) {
    return OptionGroup(
      allowsVpcAndNonVpcInstanceMemberships:
          _s.extractXmlBoolValue(elem, 'AllowsVpcAndNonVpcInstanceMemberships'),
      engineName: _s.extractXmlStringValue(elem, 'EngineName'),
      majorEngineVersion: _s.extractXmlStringValue(elem, 'MajorEngineVersion'),
      optionGroupDescription:
          _s.extractXmlStringValue(elem, 'OptionGroupDescription'),
      optionGroupName: _s.extractXmlStringValue(elem, 'OptionGroupName'),
      options: _s.extractXmlChild(elem, 'Options')?.let((elem) =>
          elem.findElements('Option').map((c) => Option.fromXml(c)).toList()),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class OptionGroupMembership {
  @_s.JsonKey(name: 'OptionGroupName')
  final String optionGroupName;
  @_s.JsonKey(name: 'Status')
  final String status;

  OptionGroupMembership({
    this.optionGroupName,
    this.status,
  });
  factory OptionGroupMembership.fromXml(_s.XmlElement elem) {
    return OptionGroupMembership(
      optionGroupName: _s.extractXmlStringValue(elem, 'OptionGroupName'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class OptionGroupOption {
  @_s.JsonKey(name: 'DefaultPort')
  final int defaultPort;
  @_s.JsonKey(name: 'Description')
  final String description;
  @_s.JsonKey(name: 'EngineName')
  final String engineName;
  @_s.JsonKey(name: 'MajorEngineVersion')
  final String majorEngineVersion;
  @_s.JsonKey(name: 'MinimumRequiredMinorEngineVersion')
  final String minimumRequiredMinorEngineVersion;
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'OptionGroupOptionSettings')
  final List<OptionGroupOptionSetting> optionGroupOptionSettings;
  @_s.JsonKey(name: 'OptionsDependedOn')
  final List<String> optionsDependedOn;
  @_s.JsonKey(name: 'Permanent')
  final bool permanent;
  @_s.JsonKey(name: 'Persistent')
  final bool persistent;
  @_s.JsonKey(name: 'PortRequired')
  final bool portRequired;

  OptionGroupOption({
    this.defaultPort,
    this.description,
    this.engineName,
    this.majorEngineVersion,
    this.minimumRequiredMinorEngineVersion,
    this.name,
    this.optionGroupOptionSettings,
    this.optionsDependedOn,
    this.permanent,
    this.persistent,
    this.portRequired,
  });
  factory OptionGroupOption.fromXml(_s.XmlElement elem) {
    return OptionGroupOption(
      defaultPort: _s.extractXmlIntValue(elem, 'DefaultPort'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      engineName: _s.extractXmlStringValue(elem, 'EngineName'),
      majorEngineVersion: _s.extractXmlStringValue(elem, 'MajorEngineVersion'),
      minimumRequiredMinorEngineVersion:
          _s.extractXmlStringValue(elem, 'MinimumRequiredMinorEngineVersion'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      optionGroupOptionSettings: _s
          .extractXmlChild(elem, 'OptionGroupOptionSettings')
          ?.let((elem) => elem
              .findElements('OptionGroupOptionSetting')
              .map((c) => OptionGroupOptionSetting.fromXml(c))
              .toList()),
      optionsDependedOn: _s
          .extractXmlChild(elem, 'OptionsDependedOn')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'OptionName')),
      permanent: _s.extractXmlBoolValue(elem, 'Permanent'),
      persistent: _s.extractXmlBoolValue(elem, 'Persistent'),
      portRequired: _s.extractXmlBoolValue(elem, 'PortRequired'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class OptionGroupOptionSetting {
  @_s.JsonKey(name: 'AllowedValues')
  final String allowedValues;
  @_s.JsonKey(name: 'ApplyType')
  final String applyType;
  @_s.JsonKey(name: 'DefaultValue')
  final String defaultValue;
  @_s.JsonKey(name: 'IsModifiable')
  final bool isModifiable;
  @_s.JsonKey(name: 'SettingDescription')
  final String settingDescription;
  @_s.JsonKey(name: 'SettingName')
  final String settingName;

  OptionGroupOptionSetting({
    this.allowedValues,
    this.applyType,
    this.defaultValue,
    this.isModifiable,
    this.settingDescription,
    this.settingName,
  });
  factory OptionGroupOptionSetting.fromXml(_s.XmlElement elem) {
    return OptionGroupOptionSetting(
      allowedValues: _s.extractXmlStringValue(elem, 'AllowedValues'),
      applyType: _s.extractXmlStringValue(elem, 'ApplyType'),
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      isModifiable: _s.extractXmlBoolValue(elem, 'IsModifiable'),
      settingDescription: _s.extractXmlStringValue(elem, 'SettingDescription'),
      settingName: _s.extractXmlStringValue(elem, 'SettingName'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class OptionGroupOptionsMessage {
  @_s.JsonKey(name: 'Marker')
  final String marker;
  @_s.JsonKey(name: 'OptionGroupOptions')
  final List<OptionGroupOption> optionGroupOptions;

  OptionGroupOptionsMessage({
    this.marker,
    this.optionGroupOptions,
  });
  factory OptionGroupOptionsMessage.fromXml(_s.XmlElement elem) {
    return OptionGroupOptionsMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      optionGroupOptions: _s.extractXmlChild(elem, 'OptionGroupOptions')?.let(
          (elem) => elem
              .findElements('OptionGroupOption')
              .map((c) => OptionGroupOption.fromXml(c))
              .toList()),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class OptionGroups {
  @_s.JsonKey(name: 'Marker')
  final String marker;
  @_s.JsonKey(name: 'OptionGroupsList')
  final List<OptionGroup> optionGroupsList;

  OptionGroups({
    this.marker,
    this.optionGroupsList,
  });
  factory OptionGroups.fromXml(_s.XmlElement elem) {
    return OptionGroups(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      optionGroupsList: _s.extractXmlChild(elem, 'OptionGroupsList')?.let(
          (elem) => elem
              .findElements('OptionGroup')
              .map((c) => OptionGroup.fromXml(c))
              .toList()),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OptionSetting {
  @_s.JsonKey(name: 'AllowedValues')
  final String allowedValues;
  @_s.JsonKey(name: 'ApplyType')
  final String applyType;
  @_s.JsonKey(name: 'DataType')
  final String dataType;
  @_s.JsonKey(name: 'DefaultValue')
  final String defaultValue;
  @_s.JsonKey(name: 'Description')
  final String description;
  @_s.JsonKey(name: 'IsCollection')
  final bool isCollection;
  @_s.JsonKey(name: 'IsModifiable')
  final bool isModifiable;
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'Value')
  final String value;

  OptionSetting({
    this.allowedValues,
    this.applyType,
    this.dataType,
    this.defaultValue,
    this.description,
    this.isCollection,
    this.isModifiable,
    this.name,
    this.value,
  });
  factory OptionSetting.fromXml(_s.XmlElement elem) {
    return OptionSetting(
      allowedValues: _s.extractXmlStringValue(elem, 'AllowedValues'),
      applyType: _s.extractXmlStringValue(elem, 'ApplyType'),
      dataType: _s.extractXmlStringValue(elem, 'DataType'),
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      isCollection: _s.extractXmlBoolValue(elem, 'IsCollection'),
      isModifiable: _s.extractXmlBoolValue(elem, 'IsModifiable'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() => _$OptionSettingToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class OrderableDBInstanceOption {
  @_s.JsonKey(name: 'AvailabilityZones')
  final List<AvailabilityZone> availabilityZones;
  @_s.JsonKey(name: 'DBInstanceClass')
  final String dBInstanceClass;
  @_s.JsonKey(name: 'Engine')
  final String engine;
  @_s.JsonKey(name: 'EngineVersion')
  final String engineVersion;
  @_s.JsonKey(name: 'LicenseModel')
  final String licenseModel;
  @_s.JsonKey(name: 'MultiAZCapable')
  final bool multiAZCapable;
  @_s.JsonKey(name: 'ReadReplicaCapable')
  final bool readReplicaCapable;
  @_s.JsonKey(name: 'Vpc')
  final bool vpc;

  OrderableDBInstanceOption({
    this.availabilityZones,
    this.dBInstanceClass,
    this.engine,
    this.engineVersion,
    this.licenseModel,
    this.multiAZCapable,
    this.readReplicaCapable,
    this.vpc,
  });
  factory OrderableDBInstanceOption.fromXml(_s.XmlElement elem) {
    return OrderableDBInstanceOption(
      availabilityZones: _s.extractXmlChild(elem, 'AvailabilityZones')?.let(
          (elem) => elem
              .findElements('AvailabilityZone')
              .map((c) => AvailabilityZone.fromXml(c))
              .toList()),
      dBInstanceClass: _s.extractXmlStringValue(elem, 'DBInstanceClass'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      licenseModel: _s.extractXmlStringValue(elem, 'LicenseModel'),
      multiAZCapable: _s.extractXmlBoolValue(elem, 'MultiAZCapable'),
      readReplicaCapable: _s.extractXmlBoolValue(elem, 'ReadReplicaCapable'),
      vpc: _s.extractXmlBoolValue(elem, 'Vpc'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class OrderableDBInstanceOptionsMessage {
  @_s.JsonKey(name: 'Marker')
  final String marker;
  @_s.JsonKey(name: 'OrderableDBInstanceOptions')
  final List<OrderableDBInstanceOption> orderableDBInstanceOptions;

  OrderableDBInstanceOptionsMessage({
    this.marker,
    this.orderableDBInstanceOptions,
  });
  factory OrderableDBInstanceOptionsMessage.fromXml(_s.XmlElement elem) {
    return OrderableDBInstanceOptionsMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      orderableDBInstanceOptions: _s
          .extractXmlChild(elem, 'OrderableDBInstanceOptions')
          ?.let((elem) => elem
              .findElements('OrderableDBInstanceOption')
              .map((c) => OrderableDBInstanceOption.fromXml(c))
              .toList()),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Parameter {
  @_s.JsonKey(name: 'AllowedValues')
  final String allowedValues;
  @_s.JsonKey(name: 'ApplyMethod')
  final ApplyMethod applyMethod;
  @_s.JsonKey(name: 'ApplyType')
  final String applyType;
  @_s.JsonKey(name: 'DataType')
  final String dataType;
  @_s.JsonKey(name: 'Description')
  final String description;
  @_s.JsonKey(name: 'IsModifiable')
  final bool isModifiable;
  @_s.JsonKey(name: 'MinimumEngineVersion')
  final String minimumEngineVersion;
  @_s.JsonKey(name: 'ParameterName')
  final String parameterName;
  @_s.JsonKey(name: 'ParameterValue')
  final String parameterValue;
  @_s.JsonKey(name: 'Source')
  final String source;

  Parameter({
    this.allowedValues,
    this.applyMethod,
    this.applyType,
    this.dataType,
    this.description,
    this.isModifiable,
    this.minimumEngineVersion,
    this.parameterName,
    this.parameterValue,
    this.source,
  });
  factory Parameter.fromXml(_s.XmlElement elem) {
    return Parameter(
      allowedValues: _s.extractXmlStringValue(elem, 'AllowedValues'),
      applyMethod:
          _s.extractXmlStringValue(elem, 'ApplyMethod')?.toApplyMethod(),
      applyType: _s.extractXmlStringValue(elem, 'ApplyType'),
      dataType: _s.extractXmlStringValue(elem, 'DataType'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      isModifiable: _s.extractXmlBoolValue(elem, 'IsModifiable'),
      minimumEngineVersion:
          _s.extractXmlStringValue(elem, 'MinimumEngineVersion'),
      parameterName: _s.extractXmlStringValue(elem, 'ParameterName'),
      parameterValue: _s.extractXmlStringValue(elem, 'ParameterValue'),
      source: _s.extractXmlStringValue(elem, 'Source'),
    );
  }

  Map<String, dynamic> toJson() => _$ParameterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class PendingModifiedValues {
  @_s.JsonKey(name: 'AllocatedStorage')
  final int allocatedStorage;
  @_s.JsonKey(name: 'BackupRetentionPeriod')
  final int backupRetentionPeriod;
  @_s.JsonKey(name: 'DBInstanceClass')
  final String dBInstanceClass;
  @_s.JsonKey(name: 'DBInstanceIdentifier')
  final String dBInstanceIdentifier;
  @_s.JsonKey(name: 'EngineVersion')
  final String engineVersion;
  @_s.JsonKey(name: 'Iops')
  final int iops;
  @_s.JsonKey(name: 'MasterUserPassword')
  final String masterUserPassword;
  @_s.JsonKey(name: 'MultiAZ')
  final bool multiAZ;
  @_s.JsonKey(name: 'Port')
  final int port;

  PendingModifiedValues({
    this.allocatedStorage,
    this.backupRetentionPeriod,
    this.dBInstanceClass,
    this.dBInstanceIdentifier,
    this.engineVersion,
    this.iops,
    this.masterUserPassword,
    this.multiAZ,
    this.port,
  });
  factory PendingModifiedValues.fromXml(_s.XmlElement elem) {
    return PendingModifiedValues(
      allocatedStorage: _s.extractXmlIntValue(elem, 'AllocatedStorage'),
      backupRetentionPeriod:
          _s.extractXmlIntValue(elem, 'BackupRetentionPeriod'),
      dBInstanceClass: _s.extractXmlStringValue(elem, 'DBInstanceClass'),
      dBInstanceIdentifier:
          _s.extractXmlStringValue(elem, 'DBInstanceIdentifier'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      iops: _s.extractXmlIntValue(elem, 'Iops'),
      masterUserPassword: _s.extractXmlStringValue(elem, 'MasterUserPassword'),
      multiAZ: _s.extractXmlBoolValue(elem, 'MultiAZ'),
      port: _s.extractXmlIntValue(elem, 'Port'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class PromoteReadReplicaResult {
  @_s.JsonKey(name: 'DBInstance')
  final DBInstance dBInstance;

  PromoteReadReplicaResult({
    this.dBInstance,
  });
  factory PromoteReadReplicaResult.fromXml(_s.XmlElement elem) {
    return PromoteReadReplicaResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class PurchaseReservedDBInstancesOfferingResult {
  @_s.JsonKey(name: 'ReservedDBInstance')
  final ReservedDBInstance reservedDBInstance;

  PurchaseReservedDBInstancesOfferingResult({
    this.reservedDBInstance,
  });
  factory PurchaseReservedDBInstancesOfferingResult.fromXml(
      _s.XmlElement elem) {
    return PurchaseReservedDBInstancesOfferingResult(
      reservedDBInstance: _s
          .extractXmlChild(elem, 'ReservedDBInstance')
          ?.let((e) => ReservedDBInstance.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class RebootDBInstanceResult {
  @_s.JsonKey(name: 'DBInstance')
  final DBInstance dBInstance;

  RebootDBInstanceResult({
    this.dBInstance,
  });
  factory RebootDBInstanceResult.fromXml(_s.XmlElement elem) {
    return RebootDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class RecurringCharge {
  @_s.JsonKey(name: 'RecurringChargeAmount')
  final double recurringChargeAmount;
  @_s.JsonKey(name: 'RecurringChargeFrequency')
  final String recurringChargeFrequency;

  RecurringCharge({
    this.recurringChargeAmount,
    this.recurringChargeFrequency,
  });
  factory RecurringCharge.fromXml(_s.XmlElement elem) {
    return RecurringCharge(
      recurringChargeAmount:
          _s.extractXmlDoubleValue(elem, 'RecurringChargeAmount'),
      recurringChargeFrequency:
          _s.extractXmlStringValue(elem, 'RecurringChargeFrequency'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class RemoveSourceIdentifierFromSubscriptionResult {
  @_s.JsonKey(name: 'EventSubscription')
  final EventSubscription eventSubscription;

  RemoveSourceIdentifierFromSubscriptionResult({
    this.eventSubscription,
  });
  factory RemoveSourceIdentifierFromSubscriptionResult.fromXml(
      _s.XmlElement elem) {
    return RemoveSourceIdentifierFromSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let((e) => EventSubscription.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class ReservedDBInstance {
  @_s.JsonKey(name: 'CurrencyCode')
  final String currencyCode;
  @_s.JsonKey(name: 'DBInstanceClass')
  final String dBInstanceClass;
  @_s.JsonKey(name: 'DBInstanceCount')
  final int dBInstanceCount;
  @_s.JsonKey(name: 'Duration')
  final int duration;
  @_s.JsonKey(name: 'FixedPrice')
  final double fixedPrice;
  @_s.JsonKey(name: 'MultiAZ')
  final bool multiAZ;
  @_s.JsonKey(name: 'OfferingType')
  final String offeringType;
  @_s.JsonKey(name: 'ProductDescription')
  final String productDescription;
  @_s.JsonKey(name: 'RecurringCharges')
  final List<RecurringCharge> recurringCharges;
  @_s.JsonKey(name: 'ReservedDBInstanceId')
  final String reservedDBInstanceId;
  @_s.JsonKey(name: 'ReservedDBInstancesOfferingId')
  final String reservedDBInstancesOfferingId;
  @_s.JsonKey(name: 'StartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime startTime;
  @_s.JsonKey(name: 'State')
  final String state;
  @_s.JsonKey(name: 'UsagePrice')
  final double usagePrice;

  ReservedDBInstance({
    this.currencyCode,
    this.dBInstanceClass,
    this.dBInstanceCount,
    this.duration,
    this.fixedPrice,
    this.multiAZ,
    this.offeringType,
    this.productDescription,
    this.recurringCharges,
    this.reservedDBInstanceId,
    this.reservedDBInstancesOfferingId,
    this.startTime,
    this.state,
    this.usagePrice,
  });
  factory ReservedDBInstance.fromXml(_s.XmlElement elem) {
    return ReservedDBInstance(
      currencyCode: _s.extractXmlStringValue(elem, 'CurrencyCode'),
      dBInstanceClass: _s.extractXmlStringValue(elem, 'DBInstanceClass'),
      dBInstanceCount: _s.extractXmlIntValue(elem, 'DBInstanceCount'),
      duration: _s.extractXmlIntValue(elem, 'Duration'),
      fixedPrice: _s.extractXmlDoubleValue(elem, 'FixedPrice'),
      multiAZ: _s.extractXmlBoolValue(elem, 'MultiAZ'),
      offeringType: _s.extractXmlStringValue(elem, 'OfferingType'),
      productDescription: _s.extractXmlStringValue(elem, 'ProductDescription'),
      recurringCharges: _s.extractXmlChild(elem, 'RecurringCharges')?.let(
          (elem) => elem
              .findElements('RecurringCharge')
              .map((c) => RecurringCharge.fromXml(c))
              .toList()),
      reservedDBInstanceId:
          _s.extractXmlStringValue(elem, 'ReservedDBInstanceId'),
      reservedDBInstancesOfferingId:
          _s.extractXmlStringValue(elem, 'ReservedDBInstancesOfferingId'),
      startTime: _s.extractXmlDateTimeValue(elem, 'StartTime'),
      state: _s.extractXmlStringValue(elem, 'State'),
      usagePrice: _s.extractXmlDoubleValue(elem, 'UsagePrice'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class ReservedDBInstanceMessage {
  @_s.JsonKey(name: 'Marker')
  final String marker;
  @_s.JsonKey(name: 'ReservedDBInstances')
  final List<ReservedDBInstance> reservedDBInstances;

  ReservedDBInstanceMessage({
    this.marker,
    this.reservedDBInstances,
  });
  factory ReservedDBInstanceMessage.fromXml(_s.XmlElement elem) {
    return ReservedDBInstanceMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      reservedDBInstances: _s.extractXmlChild(elem, 'ReservedDBInstances')?.let(
          (elem) => elem
              .findElements('ReservedDBInstance')
              .map((c) => ReservedDBInstance.fromXml(c))
              .toList()),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class ReservedDBInstancesOffering {
  @_s.JsonKey(name: 'CurrencyCode')
  final String currencyCode;
  @_s.JsonKey(name: 'DBInstanceClass')
  final String dBInstanceClass;
  @_s.JsonKey(name: 'Duration')
  final int duration;
  @_s.JsonKey(name: 'FixedPrice')
  final double fixedPrice;
  @_s.JsonKey(name: 'MultiAZ')
  final bool multiAZ;
  @_s.JsonKey(name: 'OfferingType')
  final String offeringType;
  @_s.JsonKey(name: 'ProductDescription')
  final String productDescription;
  @_s.JsonKey(name: 'RecurringCharges')
  final List<RecurringCharge> recurringCharges;
  @_s.JsonKey(name: 'ReservedDBInstancesOfferingId')
  final String reservedDBInstancesOfferingId;
  @_s.JsonKey(name: 'UsagePrice')
  final double usagePrice;

  ReservedDBInstancesOffering({
    this.currencyCode,
    this.dBInstanceClass,
    this.duration,
    this.fixedPrice,
    this.multiAZ,
    this.offeringType,
    this.productDescription,
    this.recurringCharges,
    this.reservedDBInstancesOfferingId,
    this.usagePrice,
  });
  factory ReservedDBInstancesOffering.fromXml(_s.XmlElement elem) {
    return ReservedDBInstancesOffering(
      currencyCode: _s.extractXmlStringValue(elem, 'CurrencyCode'),
      dBInstanceClass: _s.extractXmlStringValue(elem, 'DBInstanceClass'),
      duration: _s.extractXmlIntValue(elem, 'Duration'),
      fixedPrice: _s.extractXmlDoubleValue(elem, 'FixedPrice'),
      multiAZ: _s.extractXmlBoolValue(elem, 'MultiAZ'),
      offeringType: _s.extractXmlStringValue(elem, 'OfferingType'),
      productDescription: _s.extractXmlStringValue(elem, 'ProductDescription'),
      recurringCharges: _s.extractXmlChild(elem, 'RecurringCharges')?.let(
          (elem) => elem
              .findElements('RecurringCharge')
              .map((c) => RecurringCharge.fromXml(c))
              .toList()),
      reservedDBInstancesOfferingId:
          _s.extractXmlStringValue(elem, 'ReservedDBInstancesOfferingId'),
      usagePrice: _s.extractXmlDoubleValue(elem, 'UsagePrice'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class ReservedDBInstancesOfferingMessage {
  @_s.JsonKey(name: 'Marker')
  final String marker;
  @_s.JsonKey(name: 'ReservedDBInstancesOfferings')
  final List<ReservedDBInstancesOffering> reservedDBInstancesOfferings;

  ReservedDBInstancesOfferingMessage({
    this.marker,
    this.reservedDBInstancesOfferings,
  });
  factory ReservedDBInstancesOfferingMessage.fromXml(_s.XmlElement elem) {
    return ReservedDBInstancesOfferingMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      reservedDBInstancesOfferings: _s
          .extractXmlChild(elem, 'ReservedDBInstancesOfferings')
          ?.let((elem) => elem
              .findElements('ReservedDBInstancesOffering')
              .map((c) => ReservedDBInstancesOffering.fromXml(c))
              .toList()),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class RestoreDBInstanceFromDBSnapshotResult {
  @_s.JsonKey(name: 'DBInstance')
  final DBInstance dBInstance;

  RestoreDBInstanceFromDBSnapshotResult({
    this.dBInstance,
  });
  factory RestoreDBInstanceFromDBSnapshotResult.fromXml(_s.XmlElement elem) {
    return RestoreDBInstanceFromDBSnapshotResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class RestoreDBInstanceToPointInTimeResult {
  @_s.JsonKey(name: 'DBInstance')
  final DBInstance dBInstance;

  RestoreDBInstanceToPointInTimeResult({
    this.dBInstance,
  });
  factory RestoreDBInstanceToPointInTimeResult.fromXml(_s.XmlElement elem) {
    return RestoreDBInstanceToPointInTimeResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class RevokeDBSecurityGroupIngressResult {
  @_s.JsonKey(name: 'DBSecurityGroup')
  final DBSecurityGroup dBSecurityGroup;

  RevokeDBSecurityGroupIngressResult({
    this.dBSecurityGroup,
  });
  factory RevokeDBSecurityGroupIngressResult.fromXml(_s.XmlElement elem) {
    return RevokeDBSecurityGroupIngressResult(
      dBSecurityGroup: _s
          .extractXmlChild(elem, 'DBSecurityGroup')
          ?.let((e) => DBSecurityGroup.fromXml(e)),
    );
  }
}

enum SourceType {
  @_s.JsonValue('db-instance')
  dbInstance,
  @_s.JsonValue('db-parameter-group')
  dbParameterGroup,
  @_s.JsonValue('db-security-group')
  dbSecurityGroup,
  @_s.JsonValue('db-snapshot')
  dbSnapshot,
}

extension on String {
  SourceType toSourceType() {
    switch (this) {
      case 'db-instance':
        return SourceType.dbInstance;
      case 'db-parameter-group':
        return SourceType.dbParameterGroup;
      case 'db-security-group':
        return SourceType.dbSecurityGroup;
      case 'db-snapshot':
        return SourceType.dbSnapshot;
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class Subnet {
  @_s.JsonKey(name: 'SubnetAvailabilityZone')
  final AvailabilityZone subnetAvailabilityZone;
  @_s.JsonKey(name: 'SubnetIdentifier')
  final String subnetIdentifier;
  @_s.JsonKey(name: 'SubnetStatus')
  final String subnetStatus;

  Subnet({
    this.subnetAvailabilityZone,
    this.subnetIdentifier,
    this.subnetStatus,
  });
  factory Subnet.fromXml(_s.XmlElement elem) {
    return Subnet(
      subnetAvailabilityZone: _s
          .extractXmlChild(elem, 'SubnetAvailabilityZone')
          ?.let((e) => AvailabilityZone.fromXml(e)),
      subnetIdentifier: _s.extractXmlStringValue(elem, 'SubnetIdentifier'),
      subnetStatus: _s.extractXmlStringValue(elem, 'SubnetStatus'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Tag {
  @_s.JsonKey(name: 'Key')
  final String key;
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class TagListMessage {
  @_s.JsonKey(name: 'TagList')
  final List<Tag> tagList;

  TagListMessage({
    this.tagList,
  });
  factory TagListMessage.fromXml(_s.XmlElement elem) {
    return TagListMessage(
      tagList: _s.extractXmlChild(elem, 'TagList')?.let((elem) =>
          elem.findElements('Tag').map((c) => Tag.fromXml(c)).toList()),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class VpcSecurityGroupMembership {
  @_s.JsonKey(name: 'Status')
  final String status;
  @_s.JsonKey(name: 'VpcSecurityGroupId')
  final String vpcSecurityGroupId;

  VpcSecurityGroupMembership({
    this.status,
    this.vpcSecurityGroupId,
  });
  factory VpcSecurityGroupMembership.fromXml(_s.XmlElement elem) {
    return VpcSecurityGroupMembership(
      status: _s.extractXmlStringValue(elem, 'Status'),
      vpcSecurityGroupId: _s.extractXmlStringValue(elem, 'VpcSecurityGroupId'),
    );
  }
}

class AuthorizationAlreadyExistsFault extends _s.GenericAwsException {
  AuthorizationAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'AuthorizationAlreadyExistsFault',
            message: message);
}

class AuthorizationNotFoundFault extends _s.GenericAwsException {
  AuthorizationNotFoundFault({String type, String message})
      : super(type: type, code: 'AuthorizationNotFoundFault', message: message);
}

class AuthorizationQuotaExceededFault extends _s.GenericAwsException {
  AuthorizationQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'AuthorizationQuotaExceededFault',
            message: message);
}

class DBInstanceAlreadyExistsFault extends _s.GenericAwsException {
  DBInstanceAlreadyExistsFault({String type, String message})
      : super(
            type: type, code: 'DBInstanceAlreadyExistsFault', message: message);
}

class DBInstanceNotFoundFault extends _s.GenericAwsException {
  DBInstanceNotFoundFault({String type, String message})
      : super(type: type, code: 'DBInstanceNotFoundFault', message: message);
}

class DBLogFileNotFoundFault extends _s.GenericAwsException {
  DBLogFileNotFoundFault({String type, String message})
      : super(type: type, code: 'DBLogFileNotFoundFault', message: message);
}

class DBParameterGroupAlreadyExistsFault extends _s.GenericAwsException {
  DBParameterGroupAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'DBParameterGroupAlreadyExistsFault',
            message: message);
}

class DBParameterGroupNotFoundFault extends _s.GenericAwsException {
  DBParameterGroupNotFoundFault({String type, String message})
      : super(
            type: type,
            code: 'DBParameterGroupNotFoundFault',
            message: message);
}

class DBParameterGroupQuotaExceededFault extends _s.GenericAwsException {
  DBParameterGroupQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'DBParameterGroupQuotaExceededFault',
            message: message);
}

class DBSecurityGroupAlreadyExistsFault extends _s.GenericAwsException {
  DBSecurityGroupAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'DBSecurityGroupAlreadyExistsFault',
            message: message);
}

class DBSecurityGroupNotFoundFault extends _s.GenericAwsException {
  DBSecurityGroupNotFoundFault({String type, String message})
      : super(
            type: type, code: 'DBSecurityGroupNotFoundFault', message: message);
}

class DBSecurityGroupNotSupportedFault extends _s.GenericAwsException {
  DBSecurityGroupNotSupportedFault({String type, String message})
      : super(
            type: type,
            code: 'DBSecurityGroupNotSupportedFault',
            message: message);
}

class DBSecurityGroupQuotaExceededFault extends _s.GenericAwsException {
  DBSecurityGroupQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'DBSecurityGroupQuotaExceededFault',
            message: message);
}

class DBSnapshotAlreadyExistsFault extends _s.GenericAwsException {
  DBSnapshotAlreadyExistsFault({String type, String message})
      : super(
            type: type, code: 'DBSnapshotAlreadyExistsFault', message: message);
}

class DBSnapshotNotFoundFault extends _s.GenericAwsException {
  DBSnapshotNotFoundFault({String type, String message})
      : super(type: type, code: 'DBSnapshotNotFoundFault', message: message);
}

class DBSubnetGroupAlreadyExistsFault extends _s.GenericAwsException {
  DBSubnetGroupAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'DBSubnetGroupAlreadyExistsFault',
            message: message);
}

class DBSubnetGroupDoesNotCoverEnoughAZs extends _s.GenericAwsException {
  DBSubnetGroupDoesNotCoverEnoughAZs({String type, String message})
      : super(
            type: type,
            code: 'DBSubnetGroupDoesNotCoverEnoughAZs',
            message: message);
}

class DBSubnetGroupNotAllowedFault extends _s.GenericAwsException {
  DBSubnetGroupNotAllowedFault({String type, String message})
      : super(
            type: type, code: 'DBSubnetGroupNotAllowedFault', message: message);
}

class DBSubnetGroupNotFoundFault extends _s.GenericAwsException {
  DBSubnetGroupNotFoundFault({String type, String message})
      : super(type: type, code: 'DBSubnetGroupNotFoundFault', message: message);
}

class DBSubnetGroupQuotaExceededFault extends _s.GenericAwsException {
  DBSubnetGroupQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'DBSubnetGroupQuotaExceededFault',
            message: message);
}

class DBSubnetQuotaExceededFault extends _s.GenericAwsException {
  DBSubnetQuotaExceededFault({String type, String message})
      : super(type: type, code: 'DBSubnetQuotaExceededFault', message: message);
}

class DBUpgradeDependencyFailureFault extends _s.GenericAwsException {
  DBUpgradeDependencyFailureFault({String type, String message})
      : super(
            type: type,
            code: 'DBUpgradeDependencyFailureFault',
            message: message);
}

class EventSubscriptionQuotaExceededFault extends _s.GenericAwsException {
  EventSubscriptionQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'EventSubscriptionQuotaExceededFault',
            message: message);
}

class InstanceQuotaExceededFault extends _s.GenericAwsException {
  InstanceQuotaExceededFault({String type, String message})
      : super(type: type, code: 'InstanceQuotaExceededFault', message: message);
}

class InsufficientDBInstanceCapacityFault extends _s.GenericAwsException {
  InsufficientDBInstanceCapacityFault({String type, String message})
      : super(
            type: type,
            code: 'InsufficientDBInstanceCapacityFault',
            message: message);
}

class InvalidDBInstanceStateFault extends _s.GenericAwsException {
  InvalidDBInstanceStateFault({String type, String message})
      : super(
            type: type, code: 'InvalidDBInstanceStateFault', message: message);
}

class InvalidDBParameterGroupStateFault extends _s.GenericAwsException {
  InvalidDBParameterGroupStateFault({String type, String message})
      : super(
            type: type,
            code: 'InvalidDBParameterGroupStateFault',
            message: message);
}

class InvalidDBSecurityGroupStateFault extends _s.GenericAwsException {
  InvalidDBSecurityGroupStateFault({String type, String message})
      : super(
            type: type,
            code: 'InvalidDBSecurityGroupStateFault',
            message: message);
}

class InvalidDBSnapshotStateFault extends _s.GenericAwsException {
  InvalidDBSnapshotStateFault({String type, String message})
      : super(
            type: type, code: 'InvalidDBSnapshotStateFault', message: message);
}

class InvalidDBSubnetGroupFault extends _s.GenericAwsException {
  InvalidDBSubnetGroupFault({String type, String message})
      : super(type: type, code: 'InvalidDBSubnetGroupFault', message: message);
}

class InvalidDBSubnetGroupStateFault extends _s.GenericAwsException {
  InvalidDBSubnetGroupStateFault({String type, String message})
      : super(
            type: type,
            code: 'InvalidDBSubnetGroupStateFault',
            message: message);
}

class InvalidDBSubnetStateFault extends _s.GenericAwsException {
  InvalidDBSubnetStateFault({String type, String message})
      : super(type: type, code: 'InvalidDBSubnetStateFault', message: message);
}

class InvalidEventSubscriptionStateFault extends _s.GenericAwsException {
  InvalidEventSubscriptionStateFault({String type, String message})
      : super(
            type: type,
            code: 'InvalidEventSubscriptionStateFault',
            message: message);
}

class InvalidOptionGroupStateFault extends _s.GenericAwsException {
  InvalidOptionGroupStateFault({String type, String message})
      : super(
            type: type, code: 'InvalidOptionGroupStateFault', message: message);
}

class InvalidRestoreFault extends _s.GenericAwsException {
  InvalidRestoreFault({String type, String message})
      : super(type: type, code: 'InvalidRestoreFault', message: message);
}

class InvalidSubnet extends _s.GenericAwsException {
  InvalidSubnet({String type, String message})
      : super(type: type, code: 'InvalidSubnet', message: message);
}

class InvalidVPCNetworkStateFault extends _s.GenericAwsException {
  InvalidVPCNetworkStateFault({String type, String message})
      : super(
            type: type, code: 'InvalidVPCNetworkStateFault', message: message);
}

class OptionGroupAlreadyExistsFault extends _s.GenericAwsException {
  OptionGroupAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'OptionGroupAlreadyExistsFault',
            message: message);
}

class OptionGroupNotFoundFault extends _s.GenericAwsException {
  OptionGroupNotFoundFault({String type, String message})
      : super(type: type, code: 'OptionGroupNotFoundFault', message: message);
}

class OptionGroupQuotaExceededFault extends _s.GenericAwsException {
  OptionGroupQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'OptionGroupQuotaExceededFault',
            message: message);
}

class PointInTimeRestoreNotEnabledFault extends _s.GenericAwsException {
  PointInTimeRestoreNotEnabledFault({String type, String message})
      : super(
            type: type,
            code: 'PointInTimeRestoreNotEnabledFault',
            message: message);
}

class ProvisionedIopsNotAvailableInAZFault extends _s.GenericAwsException {
  ProvisionedIopsNotAvailableInAZFault({String type, String message})
      : super(
            type: type,
            code: 'ProvisionedIopsNotAvailableInAZFault',
            message: message);
}

class ReservedDBInstanceAlreadyExistsFault extends _s.GenericAwsException {
  ReservedDBInstanceAlreadyExistsFault({String type, String message})
      : super(
            type: type,
            code: 'ReservedDBInstanceAlreadyExistsFault',
            message: message);
}

class ReservedDBInstanceNotFoundFault extends _s.GenericAwsException {
  ReservedDBInstanceNotFoundFault({String type, String message})
      : super(
            type: type,
            code: 'ReservedDBInstanceNotFoundFault',
            message: message);
}

class ReservedDBInstanceQuotaExceededFault extends _s.GenericAwsException {
  ReservedDBInstanceQuotaExceededFault({String type, String message})
      : super(
            type: type,
            code: 'ReservedDBInstanceQuotaExceededFault',
            message: message);
}

class ReservedDBInstancesOfferingNotFoundFault extends _s.GenericAwsException {
  ReservedDBInstancesOfferingNotFoundFault({String type, String message})
      : super(
            type: type,
            code: 'ReservedDBInstancesOfferingNotFoundFault',
            message: message);
}

class SNSInvalidTopicFault extends _s.GenericAwsException {
  SNSInvalidTopicFault({String type, String message})
      : super(type: type, code: 'SNSInvalidTopicFault', message: message);
}

class SNSNoAuthorizationFault extends _s.GenericAwsException {
  SNSNoAuthorizationFault({String type, String message})
      : super(type: type, code: 'SNSNoAuthorizationFault', message: message);
}

class SNSTopicArnNotFoundFault extends _s.GenericAwsException {
  SNSTopicArnNotFoundFault({String type, String message})
      : super(type: type, code: 'SNSTopicArnNotFoundFault', message: message);
}

class SnapshotQuotaExceededFault extends _s.GenericAwsException {
  SnapshotQuotaExceededFault({String type, String message})
      : super(type: type, code: 'SnapshotQuotaExceededFault', message: message);
}

class SourceNotFoundFault extends _s.GenericAwsException {
  SourceNotFoundFault({String type, String message})
      : super(type: type, code: 'SourceNotFoundFault', message: message);
}

class StorageQuotaExceededFault extends _s.GenericAwsException {
  StorageQuotaExceededFault({String type, String message})
      : super(type: type, code: 'StorageQuotaExceededFault', message: message);
}

class SubnetAlreadyInUse extends _s.GenericAwsException {
  SubnetAlreadyInUse({String type, String message})
      : super(type: type, code: 'SubnetAlreadyInUse', message: message);
}

class SubscriptionAlreadyExistFault extends _s.GenericAwsException {
  SubscriptionAlreadyExistFault({String type, String message})
      : super(
            type: type,
            code: 'SubscriptionAlreadyExistFault',
            message: message);
}

class SubscriptionCategoryNotFoundFault extends _s.GenericAwsException {
  SubscriptionCategoryNotFoundFault({String type, String message})
      : super(
            type: type,
            code: 'SubscriptionCategoryNotFoundFault',
            message: message);
}

class SubscriptionNotFoundFault extends _s.GenericAwsException {
  SubscriptionNotFoundFault({String type, String message})
      : super(type: type, code: 'SubscriptionNotFoundFault', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AuthorizationAlreadyExistsFault': (type, message) =>
      AuthorizationAlreadyExistsFault(type: type, message: message),
  'AuthorizationNotFoundFault': (type, message) =>
      AuthorizationNotFoundFault(type: type, message: message),
  'AuthorizationQuotaExceededFault': (type, message) =>
      AuthorizationQuotaExceededFault(type: type, message: message),
  'DBInstanceAlreadyExistsFault': (type, message) =>
      DBInstanceAlreadyExistsFault(type: type, message: message),
  'DBInstanceNotFoundFault': (type, message) =>
      DBInstanceNotFoundFault(type: type, message: message),
  'DBLogFileNotFoundFault': (type, message) =>
      DBLogFileNotFoundFault(type: type, message: message),
  'DBParameterGroupAlreadyExistsFault': (type, message) =>
      DBParameterGroupAlreadyExistsFault(type: type, message: message),
  'DBParameterGroupNotFoundFault': (type, message) =>
      DBParameterGroupNotFoundFault(type: type, message: message),
  'DBParameterGroupQuotaExceededFault': (type, message) =>
      DBParameterGroupQuotaExceededFault(type: type, message: message),
  'DBSecurityGroupAlreadyExistsFault': (type, message) =>
      DBSecurityGroupAlreadyExistsFault(type: type, message: message),
  'DBSecurityGroupNotFoundFault': (type, message) =>
      DBSecurityGroupNotFoundFault(type: type, message: message),
  'DBSecurityGroupNotSupportedFault': (type, message) =>
      DBSecurityGroupNotSupportedFault(type: type, message: message),
  'DBSecurityGroupQuotaExceededFault': (type, message) =>
      DBSecurityGroupQuotaExceededFault(type: type, message: message),
  'DBSnapshotAlreadyExistsFault': (type, message) =>
      DBSnapshotAlreadyExistsFault(type: type, message: message),
  'DBSnapshotNotFoundFault': (type, message) =>
      DBSnapshotNotFoundFault(type: type, message: message),
  'DBSubnetGroupAlreadyExistsFault': (type, message) =>
      DBSubnetGroupAlreadyExistsFault(type: type, message: message),
  'DBSubnetGroupDoesNotCoverEnoughAZs': (type, message) =>
      DBSubnetGroupDoesNotCoverEnoughAZs(type: type, message: message),
  'DBSubnetGroupNotAllowedFault': (type, message) =>
      DBSubnetGroupNotAllowedFault(type: type, message: message),
  'DBSubnetGroupNotFoundFault': (type, message) =>
      DBSubnetGroupNotFoundFault(type: type, message: message),
  'DBSubnetGroupQuotaExceededFault': (type, message) =>
      DBSubnetGroupQuotaExceededFault(type: type, message: message),
  'DBSubnetQuotaExceededFault': (type, message) =>
      DBSubnetQuotaExceededFault(type: type, message: message),
  'DBUpgradeDependencyFailureFault': (type, message) =>
      DBUpgradeDependencyFailureFault(type: type, message: message),
  'EventSubscriptionQuotaExceededFault': (type, message) =>
      EventSubscriptionQuotaExceededFault(type: type, message: message),
  'InstanceQuotaExceededFault': (type, message) =>
      InstanceQuotaExceededFault(type: type, message: message),
  'InsufficientDBInstanceCapacityFault': (type, message) =>
      InsufficientDBInstanceCapacityFault(type: type, message: message),
  'InvalidDBInstanceStateFault': (type, message) =>
      InvalidDBInstanceStateFault(type: type, message: message),
  'InvalidDBParameterGroupStateFault': (type, message) =>
      InvalidDBParameterGroupStateFault(type: type, message: message),
  'InvalidDBSecurityGroupStateFault': (type, message) =>
      InvalidDBSecurityGroupStateFault(type: type, message: message),
  'InvalidDBSnapshotStateFault': (type, message) =>
      InvalidDBSnapshotStateFault(type: type, message: message),
  'InvalidDBSubnetGroupFault': (type, message) =>
      InvalidDBSubnetGroupFault(type: type, message: message),
  'InvalidDBSubnetGroupStateFault': (type, message) =>
      InvalidDBSubnetGroupStateFault(type: type, message: message),
  'InvalidDBSubnetStateFault': (type, message) =>
      InvalidDBSubnetStateFault(type: type, message: message),
  'InvalidEventSubscriptionStateFault': (type, message) =>
      InvalidEventSubscriptionStateFault(type: type, message: message),
  'InvalidOptionGroupStateFault': (type, message) =>
      InvalidOptionGroupStateFault(type: type, message: message),
  'InvalidRestoreFault': (type, message) =>
      InvalidRestoreFault(type: type, message: message),
  'InvalidSubnet': (type, message) =>
      InvalidSubnet(type: type, message: message),
  'InvalidVPCNetworkStateFault': (type, message) =>
      InvalidVPCNetworkStateFault(type: type, message: message),
  'OptionGroupAlreadyExistsFault': (type, message) =>
      OptionGroupAlreadyExistsFault(type: type, message: message),
  'OptionGroupNotFoundFault': (type, message) =>
      OptionGroupNotFoundFault(type: type, message: message),
  'OptionGroupQuotaExceededFault': (type, message) =>
      OptionGroupQuotaExceededFault(type: type, message: message),
  'PointInTimeRestoreNotEnabledFault': (type, message) =>
      PointInTimeRestoreNotEnabledFault(type: type, message: message),
  'ProvisionedIopsNotAvailableInAZFault': (type, message) =>
      ProvisionedIopsNotAvailableInAZFault(type: type, message: message),
  'ReservedDBInstanceAlreadyExistsFault': (type, message) =>
      ReservedDBInstanceAlreadyExistsFault(type: type, message: message),
  'ReservedDBInstanceNotFoundFault': (type, message) =>
      ReservedDBInstanceNotFoundFault(type: type, message: message),
  'ReservedDBInstanceQuotaExceededFault': (type, message) =>
      ReservedDBInstanceQuotaExceededFault(type: type, message: message),
  'ReservedDBInstancesOfferingNotFoundFault': (type, message) =>
      ReservedDBInstancesOfferingNotFoundFault(type: type, message: message),
  'SNSInvalidTopicFault': (type, message) =>
      SNSInvalidTopicFault(type: type, message: message),
  'SNSNoAuthorizationFault': (type, message) =>
      SNSNoAuthorizationFault(type: type, message: message),
  'SNSTopicArnNotFoundFault': (type, message) =>
      SNSTopicArnNotFoundFault(type: type, message: message),
  'SnapshotQuotaExceededFault': (type, message) =>
      SnapshotQuotaExceededFault(type: type, message: message),
  'SourceNotFoundFault': (type, message) =>
      SourceNotFoundFault(type: type, message: message),
  'StorageQuotaExceededFault': (type, message) =>
      StorageQuotaExceededFault(type: type, message: message),
  'SubnetAlreadyInUse': (type, message) =>
      SubnetAlreadyInUse(type: type, message: message),
  'SubscriptionAlreadyExistFault': (type, message) =>
      SubscriptionAlreadyExistFault(type: type, message: message),
  'SubscriptionCategoryNotFoundFault': (type, message) =>
      SubscriptionCategoryNotFoundFault(type: type, message: message),
  'SubscriptionNotFoundFault': (type, message) =>
      SubscriptionNotFoundFault(type: type, message: message),
};
