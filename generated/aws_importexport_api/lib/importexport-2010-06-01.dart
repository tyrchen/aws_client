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

/// transferring large amounts of data between the AWS cloud and portable
/// storage devices that you mail to us. AWS Import/Export transfers data
/// directly onto and off of your storage devices using Amazon's high-speed
/// internal network and bypassing the Internet. For large data sets, AWS
/// Import/Export is often faster than Internet transfer and more cost effective
/// than upgrading your connectivity.
class ImportExport {
  final _s.QueryProtocol _protocol;

  ImportExport({
    @_s.required String region,
    @_s.required _s.AwsClientCredentials credentials,
    _s.Client client,
  }) : _protocol = _s.QueryProtocol(
          client: client,
          service: 'importexport',
          region: region,
          credentials: credentials,
        );

  /// This operation cancels a specified job. Only the job owner can cancel it.
  /// The operation fails if the job has already started or is complete.
  ///
  /// May throw [InvalidJobIdException].
  /// May throw [ExpiredJobIdException].
  /// May throw [CanceledJobIdException].
  /// May throw [UnableToCancelJobIdException].
  /// May throw [InvalidAccessKeyIdException].
  /// May throw [InvalidVersionException].
  Future<CancelJobOutput> cancelJob({
    @_s.required String jobId,
    String aPIVersion,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    final $request = <String, dynamic>{
      'Action': 'CancelJob',
      'Version': '2010-06-01',
    };
    $request['JobId'] = jobId;
    aPIVersion?.also((arg) => $request['APIVersion'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/?Operation=CancelJob',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CancelJobResult',
    );
    return CancelJobOutput.fromXml($result);
  }

  /// This operation initiates the process of scheduling an upload or download
  /// of your data. You include in the request a manifest that describes the
  /// data transfer specifics. The response to the request includes a job ID,
  /// which you can use in other operations, a signature that you use to
  /// identify your storage device, and the address where you should ship your
  /// storage device.
  ///
  /// May throw [MissingParameterException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidAccessKeyIdException].
  /// May throw [InvalidAddressException].
  /// May throw [InvalidManifestFieldException].
  /// May throw [MissingManifestFieldException].
  /// May throw [NoSuchBucketException].
  /// May throw [MissingCustomsException].
  /// May throw [InvalidCustomsException].
  /// May throw [InvalidFileSystemException].
  /// May throw [MultipleRegionsException].
  /// May throw [BucketPermissionException].
  /// May throw [MalformedManifestException].
  /// May throw [CreateJobQuotaExceededException].
  /// May throw [InvalidJobIdException].
  /// May throw [InvalidVersionException].
  Future<CreateJobOutput> createJob({
    @_s.required JobType jobType,
    @_s.required String manifest,
    @_s.required bool validateOnly,
    String aPIVersion,
    String manifestAddendum,
  }) async {
    ArgumentError.checkNotNull(jobType, 'jobType');
    ArgumentError.checkNotNull(manifest, 'manifest');
    ArgumentError.checkNotNull(validateOnly, 'validateOnly');
    final $request = <String, dynamic>{
      'Action': 'CreateJob',
      'Version': '2010-06-01',
    };
    $request['JobType'] = jobType;
    $request['Manifest'] = manifest;
    $request['ValidateOnly'] = validateOnly;
    aPIVersion?.also((arg) => $request['APIVersion'] = arg);
    manifestAddendum?.also((arg) => $request['ManifestAddendum'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/?Operation=CreateJob',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateJobResult',
    );
    return CreateJobOutput.fromXml($result);
  }

  /// This operation generates a pre-paid UPS shipping label that you will use
  /// to ship your device to AWS for processing.
  ///
  /// May throw [InvalidJobIdException].
  /// May throw [ExpiredJobIdException].
  /// May throw [CanceledJobIdException].
  /// May throw [InvalidAccessKeyIdException].
  /// May throw [InvalidAddressException].
  /// May throw [InvalidVersionException].
  /// May throw [InvalidParameterException].
  Future<GetShippingLabelOutput> getShippingLabel({
    @_s.required List<String> jobIds,
    String aPIVersion,
    String city,
    String company,
    String country,
    String name,
    String phoneNumber,
    String postalCode,
    String stateOrProvince,
    String street1,
    String street2,
    String street3,
  }) async {
    ArgumentError.checkNotNull(jobIds, 'jobIds');
    final $request = <String, dynamic>{
      'Action': 'GetShippingLabel',
      'Version': '2010-06-01',
    };
    $request['jobIds'] = jobIds;
    aPIVersion?.also((arg) => $request['APIVersion'] = arg);
    city?.also((arg) => $request['city'] = arg);
    company?.also((arg) => $request['company'] = arg);
    country?.also((arg) => $request['country'] = arg);
    name?.also((arg) => $request['name'] = arg);
    phoneNumber?.also((arg) => $request['phoneNumber'] = arg);
    postalCode?.also((arg) => $request['postalCode'] = arg);
    stateOrProvince?.also((arg) => $request['stateOrProvince'] = arg);
    street1?.also((arg) => $request['street1'] = arg);
    street2?.also((arg) => $request['street2'] = arg);
    street3?.also((arg) => $request['street3'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/?Operation=GetShippingLabel',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'GetShippingLabelResult',
    );
    return GetShippingLabelOutput.fromXml($result);
  }

  /// This operation returns information about a job, including where the job is
  /// in the processing pipeline, the status of the results, and the signature
  /// value associated with the job. You can only return information about jobs
  /// you own.
  ///
  /// May throw [InvalidJobIdException].
  /// May throw [ExpiredJobIdException].
  /// May throw [CanceledJobIdException].
  /// May throw [InvalidAccessKeyIdException].
  /// May throw [InvalidVersionException].
  Future<GetStatusOutput> getStatus({
    @_s.required String jobId,
    String aPIVersion,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    final $request = <String, dynamic>{
      'Action': 'GetStatus',
      'Version': '2010-06-01',
    };
    $request['JobId'] = jobId;
    aPIVersion?.also((arg) => $request['APIVersion'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/?Operation=GetStatus',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'GetStatusResult',
    );
    return GetStatusOutput.fromXml($result);
  }

  /// This operation returns the jobs associated with the requester. AWS
  /// Import/Export lists the jobs in reverse chronological order based on the
  /// date of creation. For example if Job Test1 was created 2009Dec30 and Test2
  /// was created 2010Feb05, the ListJobs operation would return Test2 followed
  /// by Test1.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidAccessKeyIdException].
  /// May throw [InvalidVersionException].
  Future<ListJobsOutput> listJobs({
    String aPIVersion,
    String marker,
    int maxJobs,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'ListJobs',
      'Version': '2010-06-01',
    };
    aPIVersion?.also((arg) => $request['APIVersion'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxJobs?.also((arg) => $request['MaxJobs'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/?Operation=ListJobs',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ListJobsResult',
    );
    return ListJobsOutput.fromXml($result);
  }

  /// You use this operation to change the parameters specified in the original
  /// manifest file by supplying a new manifest file. The manifest file attached
  /// to this request replaces the original manifest file. You can only use the
  /// operation after a CreateJob request but before the data transfer starts
  /// and you can only use it on jobs you own.
  ///
  /// May throw [MissingParameterException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidAccessKeyIdException].
  /// May throw [InvalidAddressException].
  /// May throw [InvalidManifestFieldException].
  /// May throw [InvalidJobIdException].
  /// May throw [MissingManifestFieldException].
  /// May throw [NoSuchBucketException].
  /// May throw [ExpiredJobIdException].
  /// May throw [CanceledJobIdException].
  /// May throw [MissingCustomsException].
  /// May throw [InvalidCustomsException].
  /// May throw [InvalidFileSystemException].
  /// May throw [MultipleRegionsException].
  /// May throw [BucketPermissionException].
  /// May throw [MalformedManifestException].
  /// May throw [UnableToUpdateJobIdException].
  /// May throw [InvalidVersionException].
  Future<UpdateJobOutput> updateJob({
    @_s.required String jobId,
    @_s.required JobType jobType,
    @_s.required String manifest,
    @_s.required bool validateOnly,
    String aPIVersion,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    ArgumentError.checkNotNull(jobType, 'jobType');
    ArgumentError.checkNotNull(manifest, 'manifest');
    ArgumentError.checkNotNull(validateOnly, 'validateOnly');
    final $request = <String, dynamic>{
      'Action': 'UpdateJob',
      'Version': '2010-06-01',
    };
    $request['JobId'] = jobId;
    $request['JobType'] = jobType;
    $request['Manifest'] = manifest;
    $request['ValidateOnly'] = validateOnly;
    aPIVersion?.also((arg) => $request['APIVersion'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/?Operation=UpdateJob',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'UpdateJobResult',
    );
    return UpdateJobOutput.fromXml($result);
  }
}

/// A discrete item that contains the description and URL of an artifact (such
/// as a PDF).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class Artifact {
  @_s.JsonKey(name: 'Description')
  final String description;
  @_s.JsonKey(name: 'URL')
  final String url;

  Artifact({
    this.description,
    this.url,
  });
  factory Artifact.fromXml(_s.XmlElement elem) {
    return Artifact(
      description: _s.extractXmlStringValue(elem, 'Description'),
      url: _s.extractXmlStringValue(elem, 'URL'),
    );
  }
}

/// The account specified does not have the appropriate bucket permissions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class BucketPermissionException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  BucketPermissionException({
    this.message,
  });
  factory BucketPermissionException.fromXml(_s.XmlElement elem) {
    return BucketPermissionException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// Output structure for the CancelJob operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class CancelJobOutput {
  @_s.JsonKey(name: 'Success')
  final bool success;

  CancelJobOutput({
    this.success,
  });
  factory CancelJobOutput.fromXml(_s.XmlElement elem) {
    return CancelJobOutput(
      success: _s.extractXmlBoolValue(elem, 'Success'),
    );
  }
}

/// The specified job ID has been canceled and is no longer valid.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class CanceledJobIdException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  CanceledJobIdException({
    this.message,
  });
  factory CanceledJobIdException.fromXml(_s.XmlElement elem) {
    return CanceledJobIdException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// Output structure for the CreateJob operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class CreateJobOutput {
  @_s.JsonKey(name: 'ArtifactList')
  final List<Artifact> artifactList;
  @_s.JsonKey(name: 'JobId')
  final String jobId;
  @_s.JsonKey(name: 'JobType')
  final JobType jobType;
  @_s.JsonKey(name: 'Signature')
  final String signature;
  @_s.JsonKey(name: 'SignatureFileContents')
  final String signatureFileContents;
  @_s.JsonKey(name: 'WarningMessage')
  final String warningMessage;

  CreateJobOutput({
    this.artifactList,
    this.jobId,
    this.jobType,
    this.signature,
    this.signatureFileContents,
    this.warningMessage,
  });
  factory CreateJobOutput.fromXml(_s.XmlElement elem) {
    return CreateJobOutput(
      artifactList: _s.extractXmlChild(elem, 'ArtifactList')?.let((elem) => elem
          .findElements('ArtifactList')
          .map((c) => Artifact.fromXml(c))
          .toList()),
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
      jobType: _s.extractXmlStringValue(elem, 'JobType')?.toJobType(),
      signature: _s.extractXmlStringValue(elem, 'Signature'),
      signatureFileContents:
          _s.extractXmlStringValue(elem, 'SignatureFileContents'),
      warningMessage: _s.extractXmlStringValue(elem, 'WarningMessage'),
    );
  }
}

/// Each account can create only a certain number of jobs per day. If you need
/// to create more than this, please contact awsimportexport@amazon.com to
/// explain your particular use case.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class CreateJobQuotaExceededException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  CreateJobQuotaExceededException({
    this.message,
  });
  factory CreateJobQuotaExceededException.fromXml(_s.XmlElement elem) {
    return CreateJobQuotaExceededException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// Indicates that the specified job has expired out of the system.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class ExpiredJobIdException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  ExpiredJobIdException({
    this.message,
  });
  factory ExpiredJobIdException.fromXml(_s.XmlElement elem) {
    return ExpiredJobIdException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class GetShippingLabelOutput {
  @_s.JsonKey(name: 'ShippingLabelURL')
  final String shippingLabelURL;
  @_s.JsonKey(name: 'Warning')
  final String warning;

  GetShippingLabelOutput({
    this.shippingLabelURL,
    this.warning,
  });
  factory GetShippingLabelOutput.fromXml(_s.XmlElement elem) {
    return GetShippingLabelOutput(
      shippingLabelURL: _s.extractXmlStringValue(elem, 'ShippingLabelURL'),
      warning: _s.extractXmlStringValue(elem, 'Warning'),
    );
  }
}

/// Output structure for the GetStatus operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class GetStatusOutput {
  @_s.JsonKey(name: 'ArtifactList')
  final List<Artifact> artifactList;
  @_s.JsonKey(name: 'Carrier')
  final String carrier;
  @_s.JsonKey(name: 'CreationDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationDate;
  @_s.JsonKey(name: 'CurrentManifest')
  final String currentManifest;
  @_s.JsonKey(name: 'ErrorCount')
  final int errorCount;
  @_s.JsonKey(name: 'JobId')
  final String jobId;
  @_s.JsonKey(name: 'JobType')
  final JobType jobType;
  @_s.JsonKey(name: 'LocationCode')
  final String locationCode;
  @_s.JsonKey(name: 'LocationMessage')
  final String locationMessage;
  @_s.JsonKey(name: 'LogBucket')
  final String logBucket;
  @_s.JsonKey(name: 'LogKey')
  final String logKey;
  @_s.JsonKey(name: 'ProgressCode')
  final String progressCode;
  @_s.JsonKey(name: 'ProgressMessage')
  final String progressMessage;
  @_s.JsonKey(name: 'Signature')
  final String signature;
  @_s.JsonKey(name: 'SignatureFileContents')
  final String signatureFileContents;
  @_s.JsonKey(name: 'TrackingNumber')
  final String trackingNumber;

  GetStatusOutput({
    this.artifactList,
    this.carrier,
    this.creationDate,
    this.currentManifest,
    this.errorCount,
    this.jobId,
    this.jobType,
    this.locationCode,
    this.locationMessage,
    this.logBucket,
    this.logKey,
    this.progressCode,
    this.progressMessage,
    this.signature,
    this.signatureFileContents,
    this.trackingNumber,
  });
  factory GetStatusOutput.fromXml(_s.XmlElement elem) {
    return GetStatusOutput(
      artifactList: _s.extractXmlChild(elem, 'ArtifactList')?.let((elem) => elem
          .findElements('ArtifactList')
          .map((c) => Artifact.fromXml(c))
          .toList()),
      carrier: _s.extractXmlStringValue(elem, 'Carrier'),
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate'),
      currentManifest: _s.extractXmlStringValue(elem, 'CurrentManifest'),
      errorCount: _s.extractXmlIntValue(elem, 'ErrorCount'),
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
      jobType: _s.extractXmlStringValue(elem, 'JobType')?.toJobType(),
      locationCode: _s.extractXmlStringValue(elem, 'LocationCode'),
      locationMessage: _s.extractXmlStringValue(elem, 'LocationMessage'),
      logBucket: _s.extractXmlStringValue(elem, 'LogBucket'),
      logKey: _s.extractXmlStringValue(elem, 'LogKey'),
      progressCode: _s.extractXmlStringValue(elem, 'ProgressCode'),
      progressMessage: _s.extractXmlStringValue(elem, 'ProgressMessage'),
      signature: _s.extractXmlStringValue(elem, 'Signature'),
      signatureFileContents:
          _s.extractXmlStringValue(elem, 'SignatureFileContents'),
      trackingNumber: _s.extractXmlStringValue(elem, 'TrackingNumber'),
    );
  }
}

/// The AWS Access Key ID specified in the request did not match the manifest's
/// accessKeyId value. The manifest and the request authentication must use the
/// same AWS Access Key ID.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class InvalidAccessKeyIdException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  InvalidAccessKeyIdException({
    this.message,
  });
  factory InvalidAccessKeyIdException.fromXml(_s.XmlElement elem) {
    return InvalidAccessKeyIdException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// The address specified in the manifest is invalid.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class InvalidAddressException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  InvalidAddressException({
    this.message,
  });
  factory InvalidAddressException.fromXml(_s.XmlElement elem) {
    return InvalidAddressException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// One or more customs parameters was invalid. Please correct and resubmit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class InvalidCustomsException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  InvalidCustomsException({
    this.message,
  });
  factory InvalidCustomsException.fromXml(_s.XmlElement elem) {
    return InvalidCustomsException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// File system specified in export manifest is invalid.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class InvalidFileSystemException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  InvalidFileSystemException({
    this.message,
  });
  factory InvalidFileSystemException.fromXml(_s.XmlElement elem) {
    return InvalidFileSystemException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// The JOBID was missing, not found, or not associated with the AWS account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class InvalidJobIdException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  InvalidJobIdException({
    this.message,
  });
  factory InvalidJobIdException.fromXml(_s.XmlElement elem) {
    return InvalidJobIdException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// One or more manifest fields was invalid. Please correct and resubmit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class InvalidManifestFieldException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  InvalidManifestFieldException({
    this.message,
  });
  factory InvalidManifestFieldException.fromXml(_s.XmlElement elem) {
    return InvalidManifestFieldException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// One or more parameters had an invalid value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class InvalidParameterException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  InvalidParameterException({
    this.message,
  });
  factory InvalidParameterException.fromXml(_s.XmlElement elem) {
    return InvalidParameterException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// The client tool version is invalid.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class InvalidVersionException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  InvalidVersionException({
    this.message,
  });
  factory InvalidVersionException.fromXml(_s.XmlElement elem) {
    return InvalidVersionException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// Representation of a job returned by the ListJobs operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class Job {
  @_s.JsonKey(name: 'CreationDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationDate;
  @_s.JsonKey(name: 'IsCanceled')
  final bool isCanceled;
  @_s.JsonKey(name: 'JobId')
  final String jobId;
  @_s.JsonKey(name: 'JobType')
  final JobType jobType;

  Job({
    this.creationDate,
    this.isCanceled,
    this.jobId,
    this.jobType,
  });
  factory Job.fromXml(_s.XmlElement elem) {
    return Job(
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate'),
      isCanceled: _s.extractXmlBoolValue(elem, 'IsCanceled'),
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
      jobType: _s.extractXmlStringValue(elem, 'JobType')?.toJobType(),
    );
  }
}

/// Specifies whether the job to initiate is an import or export job.
enum JobType {
  @_s.JsonValue('Import')
  import,
  @_s.JsonValue('Export')
  export,
}

extension on String {
  JobType toJobType() {
    switch (this) {
      case 'Import':
        return JobType.import;
      case 'Export':
        return JobType.export;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Output structure for the ListJobs operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class ListJobsOutput {
  @_s.JsonKey(name: 'IsTruncated')
  final bool isTruncated;
  @_s.JsonKey(name: 'Jobs')
  final List<Job> jobs;

  ListJobsOutput({
    this.isTruncated,
    this.jobs,
  });
  factory ListJobsOutput.fromXml(_s.XmlElement elem) {
    return ListJobsOutput(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      jobs: _s.extractXmlChild(elem, 'Jobs')?.let((elem) =>
          elem.findElements('Jobs').map((c) => Job.fromXml(c)).toList()),
    );
  }
}

/// Your manifest is not well-formed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class MalformedManifestException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  MalformedManifestException({
    this.message,
  });
  factory MalformedManifestException.fromXml(_s.XmlElement elem) {
    return MalformedManifestException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// One or more required customs parameters was missing from the manifest.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class MissingCustomsException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  MissingCustomsException({
    this.message,
  });
  factory MissingCustomsException.fromXml(_s.XmlElement elem) {
    return MissingCustomsException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// One or more required fields were missing from the manifest file. Please
/// correct and resubmit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class MissingManifestFieldException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  MissingManifestFieldException({
    this.message,
  });
  factory MissingManifestFieldException.fromXml(_s.XmlElement elem) {
    return MissingManifestFieldException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// One or more required parameters was missing from the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class MissingParameterException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  MissingParameterException({
    this.message,
  });
  factory MissingParameterException.fromXml(_s.XmlElement elem) {
    return MissingParameterException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// Your manifest file contained buckets from multiple regions. A job is
/// restricted to buckets from one region. Please correct and resubmit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class MultipleRegionsException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  MultipleRegionsException({
    this.message,
  });
  factory MultipleRegionsException.fromXml(_s.XmlElement elem) {
    return MultipleRegionsException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// The specified bucket does not exist. Create the specified bucket or change
/// the manifest's bucket, exportBucket, or logBucket field to a bucket that the
/// account, as specified by the manifest's Access Key ID, has write permissions
/// to.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class NoSuchBucketException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  NoSuchBucketException({
    this.message,
  });
  factory NoSuchBucketException.fromXml(_s.XmlElement elem) {
    return NoSuchBucketException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// AWS Import/Export cannot cancel the job
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class UnableToCancelJobIdException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  UnableToCancelJobIdException({
    this.message,
  });
  factory UnableToCancelJobIdException.fromXml(_s.XmlElement elem) {
    return UnableToCancelJobIdException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// AWS Import/Export cannot update the job
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class UnableToUpdateJobIdException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  UnableToUpdateJobIdException({
    this.message,
  });
  factory UnableToUpdateJobIdException.fromXml(_s.XmlElement elem) {
    return UnableToUpdateJobIdException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// Output structure for the UpateJob operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: false)
class UpdateJobOutput {
  @_s.JsonKey(name: 'ArtifactList')
  final List<Artifact> artifactList;
  @_s.JsonKey(name: 'Success')
  final bool success;
  @_s.JsonKey(name: 'WarningMessage')
  final String warningMessage;

  UpdateJobOutput({
    this.artifactList,
    this.success,
    this.warningMessage,
  });
  factory UpdateJobOutput.fromXml(_s.XmlElement elem) {
    return UpdateJobOutput(
      artifactList: _s.extractXmlChild(elem, 'ArtifactList')?.let((elem) => elem
          .findElements('ArtifactList')
          .map((c) => Artifact.fromXml(c))
          .toList()),
      success: _s.extractXmlBoolValue(elem, 'Success'),
      warningMessage: _s.extractXmlStringValue(elem, 'WarningMessage'),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BucketPermissionException': (type, message) =>
      BucketPermissionException(message: message),
  'CanceledJobIdException': (type, message) =>
      CanceledJobIdException(message: message),
  'CreateJobQuotaExceededException': (type, message) =>
      CreateJobQuotaExceededException(message: message),
  'ExpiredJobIdException': (type, message) =>
      ExpiredJobIdException(message: message),
  'InvalidAccessKeyIdException': (type, message) =>
      InvalidAccessKeyIdException(message: message),
  'InvalidAddressException': (type, message) =>
      InvalidAddressException(message: message),
  'InvalidCustomsException': (type, message) =>
      InvalidCustomsException(message: message),
  'InvalidFileSystemException': (type, message) =>
      InvalidFileSystemException(message: message),
  'InvalidJobIdException': (type, message) =>
      InvalidJobIdException(message: message),
  'InvalidManifestFieldException': (type, message) =>
      InvalidManifestFieldException(message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(message: message),
  'InvalidVersionException': (type, message) =>
      InvalidVersionException(message: message),
  'MalformedManifestException': (type, message) =>
      MalformedManifestException(message: message),
  'MissingCustomsException': (type, message) =>
      MissingCustomsException(message: message),
  'MissingManifestFieldException': (type, message) =>
      MissingManifestFieldException(message: message),
  'MissingParameterException': (type, message) =>
      MissingParameterException(message: message),
  'MultipleRegionsException': (type, message) =>
      MultipleRegionsException(message: message),
  'NoSuchBucketException': (type, message) =>
      NoSuchBucketException(message: message),
  'UnableToCancelJobIdException': (type, message) =>
      UnableToCancelJobIdException(message: message),
  'UnableToUpdateJobIdException': (type, message) =>
      UnableToUpdateJobIdException(message: message),
};
