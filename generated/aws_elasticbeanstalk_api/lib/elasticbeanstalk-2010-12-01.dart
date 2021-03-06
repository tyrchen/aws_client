// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show Uint8ListConverter, Uint8ListListConverter;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// AWS Elastic Beanstalk makes it easy for you to create, deploy, and manage
/// scalable, fault-tolerant applications running on the Amazon Web Services
/// cloud.
class ElasticBeanstalk {
  final _s.QueryProtocol _protocol;

  ElasticBeanstalk({
    @_s.required String region,
    @_s.required _s.AwsClientCredentials credentials,
    _s.Client client,
  }) : _protocol = _s.QueryProtocol(
          client: client,
          service: 'elasticbeanstalk',
          region: region,
          credentials: credentials,
        );

  /// Cancels in-progress environment configuration update or application
  /// version deployment.
  ///
  /// May throw [InsufficientPrivilegesException].
  ///
  /// Parameter [environmentId] :
  /// This specifies the ID of the environment with the in-progress update that
  /// you want to cancel.
  ///
  /// Parameter [environmentName] :
  /// This specifies the name of the environment with the in-progress update
  /// that you want to cancel.
  Future<void> abortEnvironmentUpdate({
    String environmentId,
    String environmentName,
  }) async {
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    final $request = <String, dynamic>{
      'Action': 'AbortEnvironmentUpdate',
      'Version': '2010-12-01',
    };
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Applies a scheduled managed action immediately. A managed action can be
  /// applied only if its status is <code>Scheduled</code>. Get the status and
  /// action ID of a managed action with
  /// <a>DescribeEnvironmentManagedActions</a>.
  ///
  /// May throw [ElasticBeanstalkServiceException].
  /// May throw [ManagedActionInvalidStateException].
  ///
  /// Parameter [actionId] :
  /// The action ID of the scheduled managed action to execute.
  ///
  /// Parameter [environmentId] :
  /// The environment ID of the target environment.
  ///
  /// Parameter [environmentName] :
  /// The name of the target environment.
  Future<ApplyEnvironmentManagedActionResult> applyEnvironmentManagedAction({
    @_s.required String actionId,
    String environmentId,
    String environmentName,
  }) async {
    ArgumentError.checkNotNull(actionId, 'actionId');
    final $request = <String, dynamic>{
      'Action': 'ApplyEnvironmentManagedAction',
      'Version': '2010-12-01',
    };
    $request['ActionId'] = actionId;
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ApplyEnvironmentManagedActionResult',
    );
    return ApplyEnvironmentManagedActionResult.fromXml($result);
  }

  /// Checks if the specified CNAME is available.
  ///
  /// Parameter [cNAMEPrefix] :
  /// The prefix used when this CNAME is reserved.
  Future<CheckDNSAvailabilityResultMessage> checkDNSAvailability({
    @_s.required String cNAMEPrefix,
  }) async {
    ArgumentError.checkNotNull(cNAMEPrefix, 'cNAMEPrefix');
    _s.validateStringLength(
      'cNAMEPrefix',
      cNAMEPrefix,
      4,
      63,
    );
    final $request = <String, dynamic>{
      'Action': 'CheckDNSAvailability',
      'Version': '2010-12-01',
    };
    $request['CNAMEPrefix'] = cNAMEPrefix;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CheckDNSAvailabilityResult',
    );
    return CheckDNSAvailabilityResultMessage.fromXml($result);
  }

  /// Create or update a group of environments that each run a separate
  /// component of a single application. Takes a list of version labels that
  /// specify application source bundles for each of the environments to create
  /// or update. The name of each environment and other required information
  /// must be included in the source bundles in an environment manifest named
  /// <code>env.yaml</code>. See <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-mgmt-compose.html">Compose
  /// Environments</a> for details.
  ///
  /// May throw [TooManyEnvironmentsException].
  /// May throw [InsufficientPrivilegesException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application to which the specified source bundles belong.
  ///
  /// Parameter [groupName] :
  /// The name of the group to which the target environments belong. Specify a
  /// group name only if the environment name defined in each target
  /// environment's manifest ends with a + (plus) character. See <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html">Environment
  /// Manifest (env.yaml)</a> for details.
  ///
  /// Parameter [versionLabels] :
  /// A list of version labels, specifying one or more application source
  /// bundles that belong to the target application. Each source bundle must
  /// include an environment manifest that specifies the name of the environment
  /// and the name of the solution stack to use, and optionally can specify
  /// environment links to create.
  Future<EnvironmentDescriptionsMessage> composeEnvironments({
    String applicationName,
    String groupName,
    List<String> versionLabels,
  }) async {
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      19,
    );
    final $request = <String, dynamic>{
      'Action': 'ComposeEnvironments',
      'Version': '2010-12-01',
    };
    applicationName?.also((arg) => $request['ApplicationName'] = arg);
    groupName?.also((arg) => $request['GroupName'] = arg);
    versionLabels?.also((arg) => $request['VersionLabels'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ComposeEnvironmentsResult',
    );
    return EnvironmentDescriptionsMessage.fromXml($result);
  }

  /// Creates an application that has one configuration template named
  /// <code>default</code> and no application versions.
  ///
  /// May throw [TooManyApplicationsException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application.
  ///
  /// Constraint: This name must be unique within your account. If the specified
  /// name already exists, the action returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [description] :
  /// Describes the application.
  ///
  /// Parameter [resourceLifecycleConfig] :
  /// Specify an application resource lifecycle configuration to prevent your
  /// application from accumulating too many versions.
  ///
  /// Parameter [tags] :
  /// Specifies the tags applied to the application.
  ///
  /// Elastic Beanstalk applies these tags only to the application. Environments
  /// that you create in the application don't inherit the tags.
  Future<ApplicationDescriptionMessage> createApplication({
    @_s.required String applicationName,
    String description,
    ApplicationResourceLifecycleConfig resourceLifecycleConfig,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      200,
    );
    final $request = <String, dynamic>{
      'Action': 'CreateApplication',
      'Version': '2010-12-01',
    };
    $request['ApplicationName'] = applicationName;
    description?.also((arg) => $request['Description'] = arg);
    resourceLifecycleConfig
        ?.also((arg) => $request['ResourceLifecycleConfig'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateApplicationResult',
    );
    return ApplicationDescriptionMessage.fromXml($result);
  }

  /// Creates an application version for the specified application. You can
  /// create an application version from a source bundle in Amazon S3, a commit
  /// in AWS CodeCommit, or the output of an AWS CodeBuild build as follows:
  ///
  /// Specify a commit in an AWS CodeCommit repository with
  /// <code>SourceBuildInformation</code>.
  ///
  /// Specify a build in an AWS CodeBuild with
  /// <code>SourceBuildInformation</code> and <code>BuildConfiguration</code>.
  ///
  /// Specify a source bundle in S3 with <code>SourceBundle</code>
  ///
  /// Omit both <code>SourceBuildInformation</code> and
  /// <code>SourceBundle</code> to use the default sample application.
  /// <note>
  /// Once you create an application version with a specified Amazon S3 bucket
  /// and key location, you cannot change that Amazon S3 location. If you change
  /// the Amazon S3 location, you receive an exception when you attempt to
  /// launch an environment from the application version.
  /// </note>
  ///
  /// May throw [TooManyApplicationsException].
  /// May throw [TooManyApplicationVersionsException].
  /// May throw [InsufficientPrivilegesException].
  /// May throw [S3LocationNotInServiceRegionException].
  /// May throw [CodeBuildNotInServiceRegionException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application. If no application is found with this name,
  /// and <code>AutoCreateApplication</code> is <code>false</code>, returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [versionLabel] :
  /// A label identifying this version.
  ///
  /// Constraint: Must be unique per application. If an application version
  /// already exists with this label for the specified application, AWS Elastic
  /// Beanstalk returns an <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [autoCreateApplication] :
  /// Set to <code>true</code> to create an application with the specified name
  /// if it doesn't already exist.
  ///
  /// Parameter [buildConfiguration] :
  /// Settings for an AWS CodeBuild build.
  ///
  /// Parameter [description] :
  /// Describes this version.
  ///
  /// Parameter [process] :
  /// Pre-processes and validates the environment manifest
  /// (<code>env.yaml</code>) and configuration files (<code>*.config</code>
  /// files in the <code>.ebextensions</code> folder) in the source bundle.
  /// Validating configuration files can identify issues prior to deploying the
  /// application version to an environment.
  ///
  /// You must turn processing on for application versions that you create using
  /// AWS CodeBuild or AWS CodeCommit. For application versions built from a
  /// source bundle in Amazon S3, processing is optional.
  /// <note>
  /// The <code>Process</code> option validates Elastic Beanstalk configuration
  /// files. It doesn't validate your application's configuration files, like
  /// proxy server or Docker configuration.
  /// </note>
  ///
  /// Parameter [sourceBuildInformation] :
  /// Specify a commit in an AWS CodeCommit Git repository to use as the source
  /// code for the application version.
  ///
  /// Parameter [sourceBundle] :
  /// The Amazon S3 bucket and key that identify the location of the source
  /// bundle for this version.
  /// <note>
  /// The Amazon S3 bucket must be in the same region as the environment.
  /// </note>
  /// Specify a source bundle in S3 or a commit in an AWS CodeCommit repository
  /// (with <code>SourceBuildInformation</code>), but not both. If neither
  /// <code>SourceBundle</code> nor <code>SourceBuildInformation</code> are
  /// provided, Elastic Beanstalk uses a sample application.
  ///
  /// Parameter [tags] :
  /// Specifies the tags applied to the application version.
  ///
  /// Elastic Beanstalk applies these tags only to the application version.
  /// Environments that use the application version don't inherit the tags.
  Future<ApplicationVersionDescriptionMessage> createApplicationVersion({
    @_s.required String applicationName,
    @_s.required String versionLabel,
    bool autoCreateApplication,
    BuildConfiguration buildConfiguration,
    String description,
    bool process,
    SourceBuildInformation sourceBuildInformation,
    S3Location sourceBundle,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    ArgumentError.checkNotNull(versionLabel, 'versionLabel');
    _s.validateStringLength(
      'versionLabel',
      versionLabel,
      1,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      200,
    );
    final $request = <String, dynamic>{
      'Action': 'CreateApplicationVersion',
      'Version': '2010-12-01',
    };
    $request['ApplicationName'] = applicationName;
    $request['VersionLabel'] = versionLabel;
    autoCreateApplication
        ?.also((arg) => $request['AutoCreateApplication'] = arg);
    buildConfiguration?.also((arg) => $request['BuildConfiguration'] = arg);
    description?.also((arg) => $request['Description'] = arg);
    process?.also((arg) => $request['Process'] = arg);
    sourceBuildInformation
        ?.also((arg) => $request['SourceBuildInformation'] = arg);
    sourceBundle?.also((arg) => $request['SourceBundle'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateApplicationVersionResult',
    );
    return ApplicationVersionDescriptionMessage.fromXml($result);
  }

  /// Creates a configuration template. Templates are associated with a specific
  /// application and are used to deploy different versions of the application
  /// with the same configuration settings.
  ///
  /// Templates aren't associated with any environment. The
  /// <code>EnvironmentName</code> response element is always <code>null</code>.
  ///
  /// Related Topics
  ///
  /// <ul>
  /// <li>
  /// <a>DescribeConfigurationOptions</a>
  /// </li>
  /// <li>
  /// <a>DescribeConfigurationSettings</a>
  /// </li>
  /// <li>
  /// <a>ListAvailableSolutionStacks</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [TooManyBucketsException].
  /// May throw [TooManyConfigurationTemplatesException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application to associate with this configuration template.
  /// If no application is found with this name, AWS Elastic Beanstalk returns
  /// an <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [templateName] :
  /// The name of the configuration template.
  ///
  /// Constraint: This name must be unique per application.
  ///
  /// Default: If a configuration template already exists with this name, AWS
  /// Elastic Beanstalk returns an <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [description] :
  /// Describes this configuration.
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment used with this configuration template.
  ///
  /// Parameter [optionSettings] :
  /// If specified, AWS Elastic Beanstalk sets the specified configuration
  /// option to the requested value. The new value overrides the value obtained
  /// from the solution stack or the source configuration template.
  ///
  /// Parameter [platformArn] :
  /// The ARN of the custom platform.
  ///
  /// Parameter [solutionStackName] :
  /// The name of the solution stack used by this configuration. The solution
  /// stack specifies the operating system, architecture, and application server
  /// for a configuration template. It determines the set of configuration
  /// options as well as the possible and default values.
  ///
  /// Use <a>ListAvailableSolutionStacks</a> to obtain a list of available
  /// solution stacks.
  ///
  /// A solution stack name or a source configuration parameter must be
  /// specified, otherwise AWS Elastic Beanstalk returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// If a solution stack name is not specified and the source configuration
  /// parameter is specified, AWS Elastic Beanstalk uses the same solution stack
  /// as the source configuration template.
  ///
  /// Parameter [sourceConfiguration] :
  /// If specified, AWS Elastic Beanstalk uses the configuration values from the
  /// specified configuration template to create a new configuration.
  ///
  /// Values specified in the <code>OptionSettings</code> parameter of this call
  /// overrides any values obtained from the <code>SourceConfiguration</code>.
  ///
  /// If no configuration template is found, returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Constraint: If both the solution stack name parameter and the source
  /// configuration parameters are specified, the solution stack of the source
  /// configuration template must match the specified solution stack name or
  /// else AWS Elastic Beanstalk returns an
  /// <code>InvalidParameterCombination</code> error.
  ///
  /// Parameter [tags] :
  /// Specifies the tags applied to the configuration template.
  Future<ConfigurationSettingsDescription> createConfigurationTemplate({
    @_s.required String applicationName,
    @_s.required String templateName,
    String description,
    String environmentId,
    List<ConfigurationOptionSetting> optionSettings,
    String platformArn,
    String solutionStackName,
    SourceConfiguration sourceConfiguration,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      200,
    );
    final $request = <String, dynamic>{
      'Action': 'CreateConfigurationTemplate',
      'Version': '2010-12-01',
    };
    $request['ApplicationName'] = applicationName;
    $request['TemplateName'] = templateName;
    description?.also((arg) => $request['Description'] = arg);
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    optionSettings?.also((arg) => $request['OptionSettings'] = arg);
    platformArn?.also((arg) => $request['PlatformArn'] = arg);
    solutionStackName?.also((arg) => $request['SolutionStackName'] = arg);
    sourceConfiguration?.also((arg) => $request['SourceConfiguration'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateConfigurationTemplateResult',
    );
    return ConfigurationSettingsDescription.fromXml($result);
  }

  /// Launches an environment for the specified application using the specified
  /// configuration.
  ///
  /// May throw [TooManyEnvironmentsException].
  /// May throw [InsufficientPrivilegesException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application that contains the version to be deployed.
  ///
  /// If no application is found with this name, <code>CreateEnvironment</code>
  /// returns an <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [cNAMEPrefix] :
  /// If specified, the environment attempts to use this value as the prefix for
  /// the CNAME. If not specified, the CNAME is generated automatically by
  /// appending a random alphanumeric string to the environment name.
  ///
  /// Parameter [description] :
  /// Describes this environment.
  ///
  /// Parameter [environmentName] :
  /// A unique name for the deployment environment. Used in the application URL.
  ///
  /// Constraint: Must be from 4 to 40 characters in length. The name can
  /// contain only letters, numbers, and hyphens. It cannot start or end with a
  /// hyphen. This name must be unique within a region in your account. If the
  /// specified name already exists in the region, AWS Elastic Beanstalk returns
  /// an <code>InvalidParameterValue</code> error.
  ///
  /// Default: If the CNAME parameter is not specified, the environment name
  /// becomes part of the CNAME, and therefore part of the visible URL for your
  /// application.
  ///
  /// Parameter [groupName] :
  /// The name of the group to which the target environment belongs. Specify a
  /// group name only if the environment's name is specified in an environment
  /// manifest and not with the environment name parameter. See <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html">Environment
  /// Manifest (env.yaml)</a> for details.
  ///
  /// Parameter [optionSettings] :
  /// If specified, AWS Elastic Beanstalk sets the specified configuration
  /// options to the requested value in the configuration set for the new
  /// environment. These override the values obtained from the solution stack or
  /// the configuration template.
  ///
  /// Parameter [optionsToRemove] :
  /// A list of custom user-defined configuration options to remove from the
  /// configuration set for this new environment.
  ///
  /// Parameter [platformArn] :
  /// The ARN of the platform.
  ///
  /// Parameter [solutionStackName] :
  /// This is an alternative to specifying a template name. If specified, AWS
  /// Elastic Beanstalk sets the configuration values to the default values
  /// associated with the specified solution stack.
  ///
  /// For a list of current solution stacks, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/concepts.platforms.html">Elastic
  /// Beanstalk Supported Platforms</a>.
  ///
  /// Parameter [tags] :
  /// Specifies the tags applied to resources in the environment.
  ///
  /// Parameter [templateName] :
  /// The name of the configuration template to use in deployment. If no
  /// configuration template is found with this name, AWS Elastic Beanstalk
  /// returns an <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [tier] :
  /// This specifies the tier to use for creating this environment.
  ///
  /// Parameter [versionLabel] :
  /// The name of the application version to deploy.
  ///
  /// If the specified application has no associated application versions, AWS
  /// Elastic Beanstalk <code>UpdateEnvironment</code> returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Default: If not specified, AWS Elastic Beanstalk attempts to launch the
  /// sample application in the container.
  Future<EnvironmentDescription> createEnvironment({
    @_s.required String applicationName,
    String cNAMEPrefix,
    String description,
    String environmentName,
    String groupName,
    List<ConfigurationOptionSetting> optionSettings,
    List<OptionSpecification> optionsToRemove,
    String platformArn,
    String solutionStackName,
    List<Tag> tags,
    String templateName,
    EnvironmentTier tier,
    String versionLabel,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    _s.validateStringLength(
      'cNAMEPrefix',
      cNAMEPrefix,
      4,
      63,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      200,
    );
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      19,
    );
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      100,
    );
    _s.validateStringLength(
      'versionLabel',
      versionLabel,
      1,
      100,
    );
    final $request = <String, dynamic>{
      'Action': 'CreateEnvironment',
      'Version': '2010-12-01',
    };
    $request['ApplicationName'] = applicationName;
    cNAMEPrefix?.also((arg) => $request['CNAMEPrefix'] = arg);
    description?.also((arg) => $request['Description'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    groupName?.also((arg) => $request['GroupName'] = arg);
    optionSettings?.also((arg) => $request['OptionSettings'] = arg);
    optionsToRemove?.also((arg) => $request['OptionsToRemove'] = arg);
    platformArn?.also((arg) => $request['PlatformArn'] = arg);
    solutionStackName?.also((arg) => $request['SolutionStackName'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    templateName?.also((arg) => $request['TemplateName'] = arg);
    tier?.also((arg) => $request['Tier'] = arg);
    versionLabel?.also((arg) => $request['VersionLabel'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateEnvironmentResult',
    );
    return EnvironmentDescription.fromXml($result);
  }

  /// Create a new version of your custom platform.
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [ElasticBeanstalkServiceException].
  /// May throw [TooManyPlatformsException].
  ///
  /// Parameter [platformDefinitionBundle] :
  /// The location of the platform definition archive in Amazon S3.
  ///
  /// Parameter [platformName] :
  /// The name of your custom platform.
  ///
  /// Parameter [platformVersion] :
  /// The number, such as 1.0.2, for the new platform version.
  ///
  /// Parameter [environmentName] :
  /// The name of the builder environment.
  ///
  /// Parameter [optionSettings] :
  /// The configuration option settings to apply to the builder environment.
  ///
  /// Parameter [tags] :
  /// Specifies the tags applied to the new platform version.
  ///
  /// Elastic Beanstalk applies these tags only to the platform version.
  /// Environments that you create using the platform version don't inherit the
  /// tags.
  Future<CreatePlatformVersionResult> createPlatformVersion({
    @_s.required S3Location platformDefinitionBundle,
    @_s.required String platformName,
    @_s.required String platformVersion,
    String environmentName,
    List<ConfigurationOptionSetting> optionSettings,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        platformDefinitionBundle, 'platformDefinitionBundle');
    ArgumentError.checkNotNull(platformName, 'platformName');
    ArgumentError.checkNotNull(platformVersion, 'platformVersion');
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    final $request = <String, dynamic>{
      'Action': 'CreatePlatformVersion',
      'Version': '2010-12-01',
    };
    $request['PlatformDefinitionBundle'] = platformDefinitionBundle;
    $request['PlatformName'] = platformName;
    $request['PlatformVersion'] = platformVersion;
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    optionSettings?.also((arg) => $request['OptionSettings'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreatePlatformVersionResult',
    );
    return CreatePlatformVersionResult.fromXml($result);
  }

  /// Creates a bucket in Amazon S3 to store application versions, logs, and
  /// other files used by Elastic Beanstalk environments. The Elastic Beanstalk
  /// console and EB CLI call this API the first time you create an environment
  /// in a region. If the storage location already exists,
  /// <code>CreateStorageLocation</code> still returns the bucket name but does
  /// not create a new bucket.
  ///
  /// May throw [TooManyBucketsException].
  /// May throw [S3SubscriptionRequiredException].
  /// May throw [InsufficientPrivilegesException].
  Future<CreateStorageLocationResultMessage> createStorageLocation() async {
    final $request = <String, dynamic>{
      'Action': 'CreateStorageLocation',
      'Version': '2010-12-01',
    };
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateStorageLocationResult',
    );
    return CreateStorageLocationResultMessage.fromXml($result);
  }

  /// Deletes the specified application along with all associated versions and
  /// configurations. The application versions will not be deleted from your
  /// Amazon S3 bucket.
  /// <note>
  /// You cannot delete an application that has a running environment.
  /// </note>
  ///
  /// May throw [OperationInProgressException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application to delete.
  ///
  /// Parameter [terminateEnvByForce] :
  /// When set to true, running environments will be terminated before deleting
  /// the application.
  Future<void> deleteApplication({
    @_s.required String applicationName,
    bool terminateEnvByForce,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    final $request = <String, dynamic>{
      'Action': 'DeleteApplication',
      'Version': '2010-12-01',
    };
    $request['ApplicationName'] = applicationName;
    terminateEnvByForce?.also((arg) => $request['TerminateEnvByForce'] = arg);
    await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified version from the specified application.
  /// <note>
  /// You cannot delete an application version that is associated with a running
  /// environment.
  /// </note>
  ///
  /// May throw [SourceBundleDeletionException].
  /// May throw [InsufficientPrivilegesException].
  /// May throw [OperationInProgressException].
  /// May throw [S3LocationNotInServiceRegionException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application to which the version belongs.
  ///
  /// Parameter [versionLabel] :
  /// The label of the version to delete.
  ///
  /// Parameter [deleteSourceBundle] :
  /// Set to <code>true</code> to delete the source bundle from your storage
  /// bucket. Otherwise, the application version is deleted only from Elastic
  /// Beanstalk and the source bundle remains in Amazon S3.
  Future<void> deleteApplicationVersion({
    @_s.required String applicationName,
    @_s.required String versionLabel,
    bool deleteSourceBundle,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    ArgumentError.checkNotNull(versionLabel, 'versionLabel');
    _s.validateStringLength(
      'versionLabel',
      versionLabel,
      1,
      100,
    );
    final $request = <String, dynamic>{
      'Action': 'DeleteApplicationVersion',
      'Version': '2010-12-01',
    };
    $request['ApplicationName'] = applicationName;
    $request['VersionLabel'] = versionLabel;
    deleteSourceBundle?.also((arg) => $request['DeleteSourceBundle'] = arg);
    await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified configuration template.
  /// <note>
  /// When you launch an environment using a configuration template, the
  /// environment gets a copy of the template. You can delete or modify the
  /// environment's copy of the template without affecting the running
  /// environment.
  /// </note>
  ///
  /// May throw [OperationInProgressException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application to delete the configuration template from.
  ///
  /// Parameter [templateName] :
  /// The name of the configuration template to delete.
  Future<void> deleteConfigurationTemplate({
    @_s.required String applicationName,
    @_s.required String templateName,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      100,
    );
    final $request = <String, dynamic>{
      'Action': 'DeleteConfigurationTemplate',
      'Version': '2010-12-01',
    };
    $request['ApplicationName'] = applicationName;
    $request['TemplateName'] = templateName;
    await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the draft configuration associated with the running environment.
  ///
  /// Updating a running environment with any configuration changes creates a
  /// draft configuration set. You can get the draft configuration using
  /// <a>DescribeConfigurationSettings</a> while the update is in progress or if
  /// the update fails. The <code>DeploymentStatus</code> for the draft
  /// configuration indicates whether the deployment is in process or has
  /// failed. The draft configuration remains in existence until it is deleted
  /// with this action.
  ///
  /// Parameter [applicationName] :
  /// The name of the application the environment is associated with.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment to delete the draft configuration from.
  Future<void> deleteEnvironmentConfiguration({
    @_s.required String applicationName,
    @_s.required String environmentName,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    ArgumentError.checkNotNull(environmentName, 'environmentName');
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    final $request = <String, dynamic>{
      'Action': 'DeleteEnvironmentConfiguration',
      'Version': '2010-12-01',
    };
    $request['ApplicationName'] = applicationName;
    $request['EnvironmentName'] = environmentName;
    await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified version of a custom platform.
  ///
  /// May throw [OperationInProgressException].
  /// May throw [InsufficientPrivilegesException].
  /// May throw [ElasticBeanstalkServiceException].
  /// May throw [PlatformVersionStillReferencedException].
  ///
  /// Parameter [platformArn] :
  /// The ARN of the version of the custom platform.
  Future<DeletePlatformVersionResult> deletePlatformVersion({
    String platformArn,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'DeletePlatformVersion',
      'Version': '2010-12-01',
    };
    platformArn?.also((arg) => $request['PlatformArn'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DeletePlatformVersionResult',
    );
    return DeletePlatformVersionResult.fromXml($result);
  }

  /// Returns attributes related to AWS Elastic Beanstalk that are associated
  /// with the calling AWS account.
  ///
  /// The result currently has one set of attributes—resource quotas.
  ///
  /// May throw [InsufficientPrivilegesException].
  Future<DescribeAccountAttributesResult> describeAccountAttributes() async {
    final $request = <String, dynamic>{
      'Action': 'DescribeAccountAttributes',
      'Version': '2010-12-01',
    };
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeAccountAttributesResult',
    );
    return DescribeAccountAttributesResult.fromXml($result);
  }

  /// Retrieve a list of application versions.
  ///
  /// Parameter [applicationName] :
  /// Specify an application name to show only application versions for that
  /// application.
  ///
  /// Parameter [maxRecords] :
  /// For a paginated request. Specify a maximum number of application versions
  /// to include in each response.
  ///
  /// If no <code>MaxRecords</code> is specified, all available application
  /// versions are retrieved in a single response.
  ///
  /// Parameter [nextToken] :
  /// For a paginated request. Specify a token from a previous response page to
  /// retrieve the next response page. All other parameter values must be
  /// identical to the ones specified in the initial request.
  ///
  /// If no <code>NextToken</code> is specified, the first page is retrieved.
  ///
  /// Parameter [versionLabels] :
  /// Specify a version label to show a specific application version.
  Future<ApplicationVersionDescriptionsMessage> describeApplicationVersions({
    String applicationName,
    int maxRecords,
    String nextToken,
    List<String> versionLabels,
  }) async {
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    _s.validateNumRange(
      'maxRecords',
      maxRecords,
      1,
      1000,
    );
    final $request = <String, dynamic>{
      'Action': 'DescribeApplicationVersions',
      'Version': '2010-12-01',
    };
    applicationName?.also((arg) => $request['ApplicationName'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    versionLabels?.also((arg) => $request['VersionLabels'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeApplicationVersionsResult',
    );
    return ApplicationVersionDescriptionsMessage.fromXml($result);
  }

  /// Returns the descriptions of existing applications.
  ///
  /// Parameter [applicationNames] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// only include those with the specified names.
  Future<ApplicationDescriptionsMessage> describeApplications({
    List<String> applicationNames,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'DescribeApplications',
      'Version': '2010-12-01',
    };
    applicationNames?.also((arg) => $request['ApplicationNames'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeApplicationsResult',
    );
    return ApplicationDescriptionsMessage.fromXml($result);
  }

  /// Describes the configuration options that are used in a particular
  /// configuration template or environment, or that a specified solution stack
  /// defines. The description includes the values the options, their default
  /// values, and an indication of the required action on a running environment
  /// if an option value is changed.
  ///
  /// May throw [TooManyBucketsException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application associated with the configuration template or
  /// environment. Only needed if you want to describe the configuration options
  /// associated with either the configuration template or environment.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment whose configuration options you want to
  /// describe.
  ///
  /// Parameter [options] :
  /// If specified, restricts the descriptions to only the specified options.
  ///
  /// Parameter [platformArn] :
  /// The ARN of the custom platform.
  ///
  /// Parameter [solutionStackName] :
  /// The name of the solution stack whose configuration options you want to
  /// describe.
  ///
  /// Parameter [templateName] :
  /// The name of the configuration template whose configuration options you
  /// want to describe.
  Future<ConfigurationOptionsDescription> describeConfigurationOptions({
    String applicationName,
    String environmentName,
    List<OptionSpecification> options,
    String platformArn,
    String solutionStackName,
    String templateName,
  }) async {
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      100,
    );
    final $request = <String, dynamic>{
      'Action': 'DescribeConfigurationOptions',
      'Version': '2010-12-01',
    };
    applicationName?.also((arg) => $request['ApplicationName'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    options?.also((arg) => $request['Options'] = arg);
    platformArn?.also((arg) => $request['PlatformArn'] = arg);
    solutionStackName?.also((arg) => $request['SolutionStackName'] = arg);
    templateName?.also((arg) => $request['TemplateName'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeConfigurationOptionsResult',
    );
    return ConfigurationOptionsDescription.fromXml($result);
  }

  /// Returns a description of the settings for the specified configuration set,
  /// that is, either a configuration template or the configuration set
  /// associated with a running environment.
  ///
  /// When describing the settings for the configuration set associated with a
  /// running environment, it is possible to receive two sets of setting
  /// descriptions. One is the deployed configuration set, and the other is a
  /// draft configuration of an environment that is either in the process of
  /// deployment or that failed to deploy.
  ///
  /// Related Topics
  ///
  /// <ul>
  /// <li>
  /// <a>DeleteEnvironmentConfiguration</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [TooManyBucketsException].
  ///
  /// Parameter [applicationName] :
  /// The application for the environment or configuration template.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment to describe.
  ///
  /// Condition: You must specify either this or a TemplateName, but not both.
  /// If you specify both, AWS Elastic Beanstalk returns an
  /// <code>InvalidParameterCombination</code> error. If you do not specify
  /// either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [templateName] :
  /// The name of the configuration template to describe.
  ///
  /// Conditional: You must specify either this parameter or an EnvironmentName,
  /// but not both. If you specify both, AWS Elastic Beanstalk returns an
  /// <code>InvalidParameterCombination</code> error. If you do not specify
  /// either, AWS Elastic Beanstalk returns a
  /// <code>MissingRequiredParameter</code> error.
  Future<ConfigurationSettingsDescriptions> describeConfigurationSettings({
    @_s.required String applicationName,
    String environmentName,
    String templateName,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      100,
    );
    final $request = <String, dynamic>{
      'Action': 'DescribeConfigurationSettings',
      'Version': '2010-12-01',
    };
    $request['ApplicationName'] = applicationName;
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    templateName?.also((arg) => $request['TemplateName'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeConfigurationSettingsResult',
    );
    return ConfigurationSettingsDescriptions.fromXml($result);
  }

  /// Returns information about the overall health of the specified environment.
  /// The <b>DescribeEnvironmentHealth</b> operation is only available with AWS
  /// Elastic Beanstalk Enhanced Health.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ElasticBeanstalkServiceException].
  ///
  /// Parameter [attributeNames] :
  /// Specify the response elements to return. To retrieve all attributes, set
  /// to <code>All</code>. If no attribute names are specified, returns the name
  /// of the environment.
  ///
  /// Parameter [environmentId] :
  /// Specify the environment by ID.
  ///
  /// You must specify either this or an EnvironmentName, or both.
  ///
  /// Parameter [environmentName] :
  /// Specify the environment by name.
  ///
  /// You must specify either this or an EnvironmentName, or both.
  Future<DescribeEnvironmentHealthResult> describeEnvironmentHealth({
    List<String> attributeNames,
    String environmentId,
    String environmentName,
  }) async {
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    final $request = <String, dynamic>{
      'Action': 'DescribeEnvironmentHealth',
      'Version': '2010-12-01',
    };
    attributeNames?.also((arg) => $request['AttributeNames'] = arg);
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeEnvironmentHealthResult',
    );
    return DescribeEnvironmentHealthResult.fromXml($result);
  }

  /// Lists an environment's completed and failed managed actions.
  ///
  /// May throw [ElasticBeanstalkServiceException].
  ///
  /// Parameter [environmentId] :
  /// The environment ID of the target environment.
  ///
  /// Parameter [environmentName] :
  /// The name of the target environment.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of items to return for a single request.
  ///
  /// Parameter [nextToken] :
  /// The pagination token returned by a previous request.
  Future<DescribeEnvironmentManagedActionHistoryResult>
      describeEnvironmentManagedActionHistory({
    String environmentId,
    String environmentName,
    int maxItems,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    final $request = <String, dynamic>{
      'Action': 'DescribeEnvironmentManagedActionHistory',
      'Version': '2010-12-01',
    };
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeEnvironmentManagedActionHistoryResult',
    );
    return DescribeEnvironmentManagedActionHistoryResult.fromXml($result);
  }

  /// Lists an environment's upcoming and in-progress managed actions.
  ///
  /// May throw [ElasticBeanstalkServiceException].
  ///
  /// Parameter [environmentId] :
  /// The environment ID of the target environment.
  ///
  /// Parameter [environmentName] :
  /// The name of the target environment.
  ///
  /// Parameter [status] :
  /// To show only actions with a particular status, specify a status.
  Future<DescribeEnvironmentManagedActionsResult>
      describeEnvironmentManagedActions({
    String environmentId,
    String environmentName,
    ActionStatus status,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'DescribeEnvironmentManagedActions',
      'Version': '2010-12-01',
    };
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    status?.also((arg) => $request['Status'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeEnvironmentManagedActionsResult',
    );
    return DescribeEnvironmentManagedActionsResult.fromXml($result);
  }

  /// Returns AWS resources for this environment.
  ///
  /// May throw [InsufficientPrivilegesException].
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment to retrieve AWS resource usage data.
  ///
  /// Condition: You must specify either this or an EnvironmentName, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment to retrieve AWS resource usage data.
  ///
  /// Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  Future<EnvironmentResourceDescriptionsMessage> describeEnvironmentResources({
    String environmentId,
    String environmentName,
  }) async {
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    final $request = <String, dynamic>{
      'Action': 'DescribeEnvironmentResources',
      'Version': '2010-12-01',
    };
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeEnvironmentResourcesResult',
    );
    return EnvironmentResourceDescriptionsMessage.fromXml($result);
  }

  /// Returns descriptions for existing environments.
  ///
  /// Parameter [applicationName] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// include only those that are associated with this application.
  ///
  /// Parameter [environmentIds] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// include only those that have the specified IDs.
  ///
  /// Parameter [environmentNames] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// include only those that have the specified names.
  ///
  /// Parameter [includeDeleted] :
  /// Indicates whether to include deleted environments:
  ///
  /// <code>true</code>: Environments that have been deleted after
  /// <code>IncludedDeletedBackTo</code> are displayed.
  ///
  /// <code>false</code>: Do not include deleted environments.
  ///
  /// Parameter [includedDeletedBackTo] :
  /// If specified when <code>IncludeDeleted</code> is set to <code>true</code>,
  /// then environments deleted after this date are displayed.
  ///
  /// Parameter [maxRecords] :
  /// For a paginated request. Specify a maximum number of environments to
  /// include in each response.
  ///
  /// If no <code>MaxRecords</code> is specified, all available environments are
  /// retrieved in a single response.
  ///
  /// Parameter [nextToken] :
  /// For a paginated request. Specify a token from a previous response page to
  /// retrieve the next response page. All other parameter values must be
  /// identical to the ones specified in the initial request.
  ///
  /// If no <code>NextToken</code> is specified, the first page is retrieved.
  ///
  /// Parameter [versionLabel] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// include only those that are associated with this application version.
  Future<EnvironmentDescriptionsMessage> describeEnvironments({
    String applicationName,
    List<String> environmentIds,
    List<String> environmentNames,
    bool includeDeleted,
    DateTime includedDeletedBackTo,
    int maxRecords,
    String nextToken,
    String versionLabel,
  }) async {
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    _s.validateNumRange(
      'maxRecords',
      maxRecords,
      1,
      1000,
    );
    _s.validateStringLength(
      'versionLabel',
      versionLabel,
      1,
      100,
    );
    final $request = <String, dynamic>{
      'Action': 'DescribeEnvironments',
      'Version': '2010-12-01',
    };
    applicationName?.also((arg) => $request['ApplicationName'] = arg);
    environmentIds?.also((arg) => $request['EnvironmentIds'] = arg);
    environmentNames?.also((arg) => $request['EnvironmentNames'] = arg);
    includeDeleted?.also((arg) => $request['IncludeDeleted'] = arg);
    includedDeletedBackTo
        ?.also((arg) => $request['IncludedDeletedBackTo'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    versionLabel?.also((arg) => $request['VersionLabel'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeEnvironmentsResult',
    );
    return EnvironmentDescriptionsMessage.fromXml($result);
  }

  /// Returns list of event descriptions matching criteria up to the last 6
  /// weeks.
  /// <note>
  /// This action returns the most recent 1,000 events from the specified
  /// <code>NextToken</code>.
  /// </note>
  ///
  /// Parameter [applicationName] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// include only those associated with this application.
  ///
  /// Parameter [endTime] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// those that occur up to, but not including, the <code>EndTime</code>.
  ///
  /// Parameter [environmentId] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// those associated with this environment.
  ///
  /// Parameter [environmentName] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// those associated with this environment.
  ///
  /// Parameter [maxRecords] :
  /// Specifies the maximum number of events that can be returned, beginning
  /// with the most recent event.
  ///
  /// Parameter [nextToken] :
  /// Pagination token. If specified, the events return the next batch of
  /// results.
  ///
  /// Parameter [platformArn] :
  /// The ARN of the version of the custom platform.
  ///
  /// Parameter [requestId] :
  /// If specified, AWS Elastic Beanstalk restricts the described events to
  /// include only those associated with this request ID.
  ///
  /// Parameter [severity] :
  /// If specified, limits the events returned from this call to include only
  /// those with the specified severity or higher.
  ///
  /// Parameter [startTime] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// those that occur on or after this time.
  ///
  /// Parameter [templateName] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// those that are associated with this environment configuration.
  ///
  /// Parameter [versionLabel] :
  /// If specified, AWS Elastic Beanstalk restricts the returned descriptions to
  /// those associated with this application version.
  Future<EventDescriptionsMessage> describeEvents({
    String applicationName,
    DateTime endTime,
    String environmentId,
    String environmentName,
    int maxRecords,
    String nextToken,
    String platformArn,
    String requestId,
    EventSeverity severity,
    DateTime startTime,
    String templateName,
    String versionLabel,
  }) async {
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    _s.validateNumRange(
      'maxRecords',
      maxRecords,
      1,
      1000,
    );
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      100,
    );
    _s.validateStringLength(
      'versionLabel',
      versionLabel,
      1,
      100,
    );
    final $request = <String, dynamic>{
      'Action': 'DescribeEvents',
      'Version': '2010-12-01',
    };
    applicationName?.also((arg) => $request['ApplicationName'] = arg);
    endTime?.also((arg) => $request['EndTime'] = arg);
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    platformArn?.also((arg) => $request['PlatformArn'] = arg);
    requestId?.also((arg) => $request['RequestId'] = arg);
    severity?.also((arg) => $request['Severity'] = arg);
    startTime?.also((arg) => $request['StartTime'] = arg);
    templateName?.also((arg) => $request['TemplateName'] = arg);
    versionLabel?.also((arg) => $request['VersionLabel'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeEventsResult',
    );
    return EventDescriptionsMessage.fromXml($result);
  }

  /// Retrieves detailed information about the health of instances in your AWS
  /// Elastic Beanstalk. This operation requires <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced.html">enhanced
  /// health reporting</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ElasticBeanstalkServiceException].
  ///
  /// Parameter [attributeNames] :
  /// Specifies the response elements you wish to receive. To retrieve all
  /// attributes, set to <code>All</code>. If no attribute names are specified,
  /// returns a list of instances.
  ///
  /// Parameter [environmentId] :
  /// Specify the AWS Elastic Beanstalk environment by ID.
  ///
  /// Parameter [environmentName] :
  /// Specify the AWS Elastic Beanstalk environment by name.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token returned by a previous call.
  Future<DescribeInstancesHealthResult> describeInstancesHealth({
    List<String> attributeNames,
    String environmentId,
    String environmentName,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      100,
    );
    final $request = <String, dynamic>{
      'Action': 'DescribeInstancesHealth',
      'Version': '2010-12-01',
    };
    attributeNames?.also((arg) => $request['AttributeNames'] = arg);
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeInstancesHealthResult',
    );
    return DescribeInstancesHealthResult.fromXml($result);
  }

  /// Describes the version of the platform.
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [ElasticBeanstalkServiceException].
  ///
  /// Parameter [platformArn] :
  /// The ARN of the version of the platform.
  Future<DescribePlatformVersionResult> describePlatformVersion({
    String platformArn,
  }) async {
    final $request = <String, dynamic>{
      'Action': 'DescribePlatformVersion',
      'Version': '2010-12-01',
    };
    platformArn?.also((arg) => $request['PlatformArn'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribePlatformVersionResult',
    );
    return DescribePlatformVersionResult.fromXml($result);
  }

  /// Returns a list of the available solution stack names, with the public
  /// version first and then in reverse chronological order.
  Future<ListAvailableSolutionStacksResultMessage>
      listAvailableSolutionStacks() async {
    final $request = <String, dynamic>{
      'Action': 'ListAvailableSolutionStacks',
      'Version': '2010-12-01',
    };
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ListAvailableSolutionStacksResult',
    );
    return ListAvailableSolutionStacksResultMessage.fromXml($result);
  }

  /// Lists the available platforms.
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [ElasticBeanstalkServiceException].
  ///
  /// Parameter [filters] :
  /// List only the platforms where the platform member value relates to one of
  /// the supplied values.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of platform values returned in one call.
  ///
  /// Parameter [nextToken] :
  /// The starting index into the remaining list of platforms. Use the
  /// <code>NextToken</code> value from a previous
  /// <code>ListPlatformVersion</code> call.
  Future<ListPlatformVersionsResult> listPlatformVersions({
    List<PlatformFilter> filters,
    int maxRecords,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxRecords',
      maxRecords,
      1,
      1152921504606846976,
    );
    final $request = <String, dynamic>{
      'Action': 'ListPlatformVersions',
      'Version': '2010-12-01',
    };
    filters?.also((arg) => $request['Filters'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ListPlatformVersionsResult',
    );
    return ListPlatformVersionsResult.fromXml($result);
  }

  /// Returns the tags applied to an AWS Elastic Beanstalk resource. The
  /// response contains a list of tag key-value pairs.
  ///
  /// Currently, Elastic Beanstalk only supports tagging of Elastic Beanstalk
  /// environments. For details about environment tagging, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.tagging.html">Tagging
  /// Resources in Your Elastic Beanstalk Environment</a>.
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceTypeNotSupportedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resouce for which a tag list is
  /// requested.
  ///
  /// Must be the ARN of an Elastic Beanstalk environment.
  Future<ResourceTagsDescriptionMessage> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final $request = <String, dynamic>{
      'Action': 'ListTagsForResource',
      'Version': '2010-12-01',
    };
    $request['ResourceArn'] = resourceArn;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ListTagsForResourceResult',
    );
    return ResourceTagsDescriptionMessage.fromXml($result);
  }

  /// Deletes and recreates all of the AWS resources (for example: the Auto
  /// Scaling group, load balancer, etc.) for a specified environment and forces
  /// a restart.
  ///
  /// May throw [InsufficientPrivilegesException].
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment to rebuild.
  ///
  /// Condition: You must specify either this or an EnvironmentName, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment to rebuild.
  ///
  /// Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  Future<void> rebuildEnvironment({
    String environmentId,
    String environmentName,
  }) async {
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    final $request = <String, dynamic>{
      'Action': 'RebuildEnvironment',
      'Version': '2010-12-01',
    };
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Initiates a request to compile the specified type of information of the
  /// deployed environment.
  ///
  /// Setting the <code>InfoType</code> to <code>tail</code> compiles the last
  /// lines from the application server log files of every Amazon EC2 instance
  /// in your environment.
  ///
  /// Setting the <code>InfoType</code> to <code>bundle</code> compresses the
  /// application server log files for every Amazon EC2 instance into a
  /// <code>.zip</code> file. Legacy and .NET containers do not support bundle
  /// logs.
  ///
  /// Use <a>RetrieveEnvironmentInfo</a> to obtain the set of logs.
  ///
  /// Related Topics
  ///
  /// <ul>
  /// <li>
  /// <a>RetrieveEnvironmentInfo</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [infoType] :
  /// The type of information to request.
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment of the requested data.
  ///
  /// If no such environment is found, <code>RequestEnvironmentInfo</code>
  /// returns an <code>InvalidParameterValue</code> error.
  ///
  /// Condition: You must specify either this or an EnvironmentName, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment of the requested data.
  ///
  /// If no such environment is found, <code>RequestEnvironmentInfo</code>
  /// returns an <code>InvalidParameterValue</code> error.
  ///
  /// Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  Future<void> requestEnvironmentInfo({
    @_s.required EnvironmentInfoType infoType,
    String environmentId,
    String environmentName,
  }) async {
    ArgumentError.checkNotNull(infoType, 'infoType');
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    final $request = <String, dynamic>{
      'Action': 'RequestEnvironmentInfo',
      'Version': '2010-12-01',
    };
    $request['InfoType'] = infoType;
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Causes the environment to restart the application container server running
  /// on each Amazon EC2 instance.
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment to restart the server for.
  ///
  /// Condition: You must specify either this or an EnvironmentName, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment to restart the server for.
  ///
  /// Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  Future<void> restartAppServer({
    String environmentId,
    String environmentName,
  }) async {
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    final $request = <String, dynamic>{
      'Action': 'RestartAppServer',
      'Version': '2010-12-01',
    };
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the compiled information from a <a>RequestEnvironmentInfo</a>
  /// request.
  ///
  /// Related Topics
  ///
  /// <ul>
  /// <li>
  /// <a>RequestEnvironmentInfo</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [infoType] :
  /// The type of information to retrieve.
  ///
  /// Parameter [environmentId] :
  /// The ID of the data's environment.
  ///
  /// If no such environment is found, returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Condition: You must specify either this or an EnvironmentName, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [environmentName] :
  /// The name of the data's environment.
  ///
  /// If no such environment is found, returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  Future<RetrieveEnvironmentInfoResultMessage> retrieveEnvironmentInfo({
    @_s.required EnvironmentInfoType infoType,
    String environmentId,
    String environmentName,
  }) async {
    ArgumentError.checkNotNull(infoType, 'infoType');
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    final $request = <String, dynamic>{
      'Action': 'RetrieveEnvironmentInfo',
      'Version': '2010-12-01',
    };
    $request['InfoType'] = infoType;
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'RetrieveEnvironmentInfoResult',
    );
    return RetrieveEnvironmentInfoResultMessage.fromXml($result);
  }

  /// Swaps the CNAMEs of two environments.
  ///
  /// Parameter [destinationEnvironmentId] :
  /// The ID of the destination environment.
  ///
  /// Condition: You must specify at least the
  /// <code>DestinationEnvironmentID</code> or the
  /// <code>DestinationEnvironmentName</code>. You may also specify both. You
  /// must specify the <code>SourceEnvironmentId</code> with the
  /// <code>DestinationEnvironmentId</code>.
  ///
  /// Parameter [destinationEnvironmentName] :
  /// The name of the destination environment.
  ///
  /// Condition: You must specify at least the
  /// <code>DestinationEnvironmentID</code> or the
  /// <code>DestinationEnvironmentName</code>. You may also specify both. You
  /// must specify the <code>SourceEnvironmentName</code> with the
  /// <code>DestinationEnvironmentName</code>.
  ///
  /// Parameter [sourceEnvironmentId] :
  /// The ID of the source environment.
  ///
  /// Condition: You must specify at least the <code>SourceEnvironmentID</code>
  /// or the <code>SourceEnvironmentName</code>. You may also specify both. If
  /// you specify the <code>SourceEnvironmentId</code>, you must specify the
  /// <code>DestinationEnvironmentId</code>.
  ///
  /// Parameter [sourceEnvironmentName] :
  /// The name of the source environment.
  ///
  /// Condition: You must specify at least the <code>SourceEnvironmentID</code>
  /// or the <code>SourceEnvironmentName</code>. You may also specify both. If
  /// you specify the <code>SourceEnvironmentName</code>, you must specify the
  /// <code>DestinationEnvironmentName</code>.
  Future<void> swapEnvironmentCNAMEs({
    String destinationEnvironmentId,
    String destinationEnvironmentName,
    String sourceEnvironmentId,
    String sourceEnvironmentName,
  }) async {
    _s.validateStringLength(
      'destinationEnvironmentName',
      destinationEnvironmentName,
      4,
      40,
    );
    _s.validateStringLength(
      'sourceEnvironmentName',
      sourceEnvironmentName,
      4,
      40,
    );
    final $request = <String, dynamic>{
      'Action': 'SwapEnvironmentCNAMEs',
      'Version': '2010-12-01',
    };
    destinationEnvironmentId
        ?.also((arg) => $request['DestinationEnvironmentId'] = arg);
    destinationEnvironmentName
        ?.also((arg) => $request['DestinationEnvironmentName'] = arg);
    sourceEnvironmentId?.also((arg) => $request['SourceEnvironmentId'] = arg);
    sourceEnvironmentName
        ?.also((arg) => $request['SourceEnvironmentName'] = arg);
    await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Terminates the specified environment.
  ///
  /// May throw [InsufficientPrivilegesException].
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment to terminate.
  ///
  /// Condition: You must specify either this or an EnvironmentName, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment to terminate.
  ///
  /// Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [forceTerminate] :
  /// Terminates the target environment even if another environment in the same
  /// group is dependent on it.
  ///
  /// Parameter [terminateResources] :
  /// Indicates whether the associated AWS resources should shut down when the
  /// environment is terminated:
  ///
  /// <ul>
  /// <li>
  /// <code>true</code>: The specified environment as well as the associated AWS
  /// resources, such as Auto Scaling group and LoadBalancer, are terminated.
  /// </li>
  /// <li>
  /// <code>false</code>: AWS Elastic Beanstalk resource management is removed
  /// from the environment, but the AWS resources continue to operate.
  /// </li>
  /// </ul>
  /// For more information, see the <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/ug/"> AWS
  /// Elastic Beanstalk User Guide. </a>
  ///
  /// Default: <code>true</code>
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  Future<EnvironmentDescription> terminateEnvironment({
    String environmentId,
    String environmentName,
    bool forceTerminate,
    bool terminateResources,
  }) async {
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    final $request = <String, dynamic>{
      'Action': 'TerminateEnvironment',
      'Version': '2010-12-01',
    };
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    forceTerminate?.also((arg) => $request['ForceTerminate'] = arg);
    terminateResources?.also((arg) => $request['TerminateResources'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'TerminateEnvironmentResult',
    );
    return EnvironmentDescription.fromXml($result);
  }

  /// Updates the specified application to have the specified properties.
  /// <note>
  /// If a property (for example, <code>description</code>) is not provided, the
  /// value remains unchanged. To clear these properties, specify an empty
  /// string.
  /// </note>
  ///
  /// Parameter [applicationName] :
  /// The name of the application to update. If no such application is found,
  /// <code>UpdateApplication</code> returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [description] :
  /// A new description for the application.
  ///
  /// Default: If not specified, AWS Elastic Beanstalk does not update the
  /// description.
  Future<ApplicationDescriptionMessage> updateApplication({
    @_s.required String applicationName,
    String description,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      200,
    );
    final $request = <String, dynamic>{
      'Action': 'UpdateApplication',
      'Version': '2010-12-01',
    };
    $request['ApplicationName'] = applicationName;
    description?.also((arg) => $request['Description'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'UpdateApplicationResult',
    );
    return ApplicationDescriptionMessage.fromXml($result);
  }

  /// Modifies lifecycle settings for an application.
  ///
  /// May throw [InsufficientPrivilegesException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application.
  ///
  /// Parameter [resourceLifecycleConfig] :
  /// The lifecycle configuration.
  Future<ApplicationResourceLifecycleDescriptionMessage>
      updateApplicationResourceLifecycle({
    @_s.required String applicationName,
    @_s.required ApplicationResourceLifecycleConfig resourceLifecycleConfig,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    ArgumentError.checkNotNull(
        resourceLifecycleConfig, 'resourceLifecycleConfig');
    final $request = <String, dynamic>{
      'Action': 'UpdateApplicationResourceLifecycle',
      'Version': '2010-12-01',
    };
    $request['ApplicationName'] = applicationName;
    $request['ResourceLifecycleConfig'] = resourceLifecycleConfig;
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'UpdateApplicationResourceLifecycleResult',
    );
    return ApplicationResourceLifecycleDescriptionMessage.fromXml($result);
  }

  /// Updates the specified application version to have the specified
  /// properties.
  /// <note>
  /// If a property (for example, <code>description</code>) is not provided, the
  /// value remains unchanged. To clear properties, specify an empty string.
  /// </note>
  ///
  /// Parameter [applicationName] :
  /// The name of the application associated with this version.
  ///
  /// If no application is found with this name, <code>UpdateApplication</code>
  /// returns an <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [versionLabel] :
  /// The name of the version to update.
  ///
  /// If no application version is found with this label,
  /// <code>UpdateApplication</code> returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [description] :
  /// A new description for this version.
  Future<ApplicationVersionDescriptionMessage> updateApplicationVersion({
    @_s.required String applicationName,
    @_s.required String versionLabel,
    String description,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    ArgumentError.checkNotNull(versionLabel, 'versionLabel');
    _s.validateStringLength(
      'versionLabel',
      versionLabel,
      1,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      200,
    );
    final $request = <String, dynamic>{
      'Action': 'UpdateApplicationVersion',
      'Version': '2010-12-01',
    };
    $request['ApplicationName'] = applicationName;
    $request['VersionLabel'] = versionLabel;
    description?.also((arg) => $request['Description'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'UpdateApplicationVersionResult',
    );
    return ApplicationVersionDescriptionMessage.fromXml($result);
  }

  /// Updates the specified configuration template to have the specified
  /// properties or configuration option values.
  /// <note>
  /// If a property (for example, <code>ApplicationName</code>) is not provided,
  /// its value remains unchanged. To clear such properties, specify an empty
  /// string.
  /// </note>
  /// Related Topics
  ///
  /// <ul>
  /// <li>
  /// <a>DescribeConfigurationOptions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [TooManyBucketsException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application associated with the configuration template to
  /// update.
  ///
  /// If no application is found with this name,
  /// <code>UpdateConfigurationTemplate</code> returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [templateName] :
  /// The name of the configuration template to update.
  ///
  /// If no configuration template is found with this name,
  /// <code>UpdateConfigurationTemplate</code> returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [description] :
  /// A new description for the configuration.
  ///
  /// Parameter [optionSettings] :
  /// A list of configuration option settings to update with the new specified
  /// option value.
  ///
  /// Parameter [optionsToRemove] :
  /// A list of configuration options to remove from the configuration set.
  ///
  /// Constraint: You can remove only <code>UserDefined</code> configuration
  /// options.
  Future<ConfigurationSettingsDescription> updateConfigurationTemplate({
    @_s.required String applicationName,
    @_s.required String templateName,
    String description,
    List<ConfigurationOptionSetting> optionSettings,
    List<OptionSpecification> optionsToRemove,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      200,
    );
    final $request = <String, dynamic>{
      'Action': 'UpdateConfigurationTemplate',
      'Version': '2010-12-01',
    };
    $request['ApplicationName'] = applicationName;
    $request['TemplateName'] = templateName;
    description?.also((arg) => $request['Description'] = arg);
    optionSettings?.also((arg) => $request['OptionSettings'] = arg);
    optionsToRemove?.also((arg) => $request['OptionsToRemove'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'UpdateConfigurationTemplateResult',
    );
    return ConfigurationSettingsDescription.fromXml($result);
  }

  /// Updates the environment description, deploys a new application version,
  /// updates the configuration settings to an entirely new configuration
  /// template, or updates select configuration option values in the running
  /// environment.
  ///
  /// Attempting to update both the release and configuration is not allowed and
  /// AWS Elastic Beanstalk returns an <code>InvalidParameterCombination</code>
  /// error.
  ///
  /// When updating the configuration settings to a new template or individual
  /// settings, a draft configuration is created and
  /// <a>DescribeConfigurationSettings</a> for this environment returns two
  /// setting descriptions with different <code>DeploymentStatus</code> values.
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [TooManyBucketsException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application with which the environment is associated.
  ///
  /// Parameter [description] :
  /// If this parameter is specified, AWS Elastic Beanstalk updates the
  /// description of this environment.
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment to update.
  ///
  /// If no environment with this ID exists, AWS Elastic Beanstalk returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Condition: You must specify either this or an EnvironmentName, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment to update. If no environment with this name
  /// exists, AWS Elastic Beanstalk returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Condition: You must specify either this or an EnvironmentId, or both. If
  /// you do not specify either, AWS Elastic Beanstalk returns
  /// <code>MissingRequiredParameter</code> error.
  ///
  /// Parameter [groupName] :
  /// The name of the group to which the target environment belongs. Specify a
  /// group name only if the environment's name is specified in an environment
  /// manifest and not with the environment name or environment ID parameters.
  /// See <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html">Environment
  /// Manifest (env.yaml)</a> for details.
  ///
  /// Parameter [optionSettings] :
  /// If specified, AWS Elastic Beanstalk updates the configuration set
  /// associated with the running environment and sets the specified
  /// configuration options to the requested value.
  ///
  /// Parameter [optionsToRemove] :
  /// A list of custom user-defined configuration options to remove from the
  /// configuration set for this environment.
  ///
  /// Parameter [platformArn] :
  /// The ARN of the platform, if used.
  ///
  /// Parameter [solutionStackName] :
  /// This specifies the platform version that the environment will run after
  /// the environment is updated.
  ///
  /// Parameter [templateName] :
  /// If this parameter is specified, AWS Elastic Beanstalk deploys this
  /// configuration template to the environment. If no such configuration
  /// template is found, AWS Elastic Beanstalk returns an
  /// <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [tier] :
  /// This specifies the tier to use to update the environment.
  ///
  /// Condition: At this time, if you change the tier version, name, or type,
  /// AWS Elastic Beanstalk returns <code>InvalidParameterValue</code> error.
  ///
  /// Parameter [versionLabel] :
  /// If this parameter is specified, AWS Elastic Beanstalk deploys the named
  /// application version to the environment. If no such application version is
  /// found, returns an <code>InvalidParameterValue</code> error.
  Future<EnvironmentDescription> updateEnvironment({
    String applicationName,
    String description,
    String environmentId,
    String environmentName,
    String groupName,
    List<ConfigurationOptionSetting> optionSettings,
    List<OptionSpecification> optionsToRemove,
    String platformArn,
    String solutionStackName,
    String templateName,
    EnvironmentTier tier,
    String versionLabel,
  }) async {
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      200,
    );
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      19,
    );
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      100,
    );
    _s.validateStringLength(
      'versionLabel',
      versionLabel,
      1,
      100,
    );
    final $request = <String, dynamic>{
      'Action': 'UpdateEnvironment',
      'Version': '2010-12-01',
    };
    applicationName?.also((arg) => $request['ApplicationName'] = arg);
    description?.also((arg) => $request['Description'] = arg);
    environmentId?.also((arg) => $request['EnvironmentId'] = arg);
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    groupName?.also((arg) => $request['GroupName'] = arg);
    optionSettings?.also((arg) => $request['OptionSettings'] = arg);
    optionsToRemove?.also((arg) => $request['OptionsToRemove'] = arg);
    platformArn?.also((arg) => $request['PlatformArn'] = arg);
    solutionStackName?.also((arg) => $request['SolutionStackName'] = arg);
    templateName?.also((arg) => $request['TemplateName'] = arg);
    tier?.also((arg) => $request['Tier'] = arg);
    versionLabel?.also((arg) => $request['VersionLabel'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'UpdateEnvironmentResult',
    );
    return EnvironmentDescription.fromXml($result);
  }

  /// Update the list of tags applied to an AWS Elastic Beanstalk resource. Two
  /// lists can be passed: <code>TagsToAdd</code> for tags to add or update, and
  /// <code>TagsToRemove</code>.
  ///
  /// Currently, Elastic Beanstalk only supports tagging of Elastic Beanstalk
  /// environments. For details about environment tagging, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.tagging.html">Tagging
  /// Resources in Your Elastic Beanstalk Environment</a>.
  ///
  /// If you create a custom IAM user policy to control permission to this
  /// operation, specify one of the following two virtual actions (or both)
  /// instead of the API operation name:
  /// <dl> <dt>elasticbeanstalk:AddTags</dt> <dd>
  /// Controls permission to call <code>UpdateTagsForResource</code> and pass a
  /// list of tags to add in the <code>TagsToAdd</code> parameter.
  /// </dd> <dt>elasticbeanstalk:RemoveTags</dt> <dd>
  /// Controls permission to call <code>UpdateTagsForResource</code> and pass a
  /// list of tag keys to remove in the <code>TagsToRemove</code> parameter.
  /// </dd> </dl>
  /// For details about creating a custom user policy, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/AWSHowTo.iam.managed-policies.html#AWSHowTo.iam.policies">Creating
  /// a Custom User Policy</a>.
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [OperationInProgressException].
  /// May throw [TooManyTagsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceTypeNotSupportedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resouce to be updated.
  ///
  /// Must be the ARN of an Elastic Beanstalk environment.
  ///
  /// Parameter [tagsToAdd] :
  /// A list of tags to add or update.
  ///
  /// If a key of an existing tag is added, the tag's value is updated.
  ///
  /// Parameter [tagsToRemove] :
  /// A list of tag keys to remove.
  ///
  /// If a tag key doesn't exist, it is silently ignored.
  Future<void> updateTagsForResource({
    @_s.required String resourceArn,
    List<Tag> tagsToAdd,
    List<String> tagsToRemove,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final $request = <String, dynamic>{
      'Action': 'UpdateTagsForResource',
      'Version': '2010-12-01',
    };
    $request['ResourceArn'] = resourceArn;
    tagsToAdd?.also((arg) => $request['TagsToAdd'] = arg);
    tagsToRemove?.also((arg) => $request['TagsToRemove'] = arg);
    await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Takes a set of configuration settings and either a configuration template
  /// or environment, and determines whether those values are valid.
  ///
  /// This action returns a list of messages indicating any errors or warnings
  /// associated with the selection of option values.
  ///
  /// May throw [InsufficientPrivilegesException].
  /// May throw [TooManyBucketsException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application that the configuration template or environment
  /// belongs to.
  ///
  /// Parameter [optionSettings] :
  /// A list of the options and desired values to evaluate.
  ///
  /// Parameter [environmentName] :
  /// The name of the environment to validate the settings against.
  ///
  /// Condition: You cannot specify both this and a configuration template name.
  ///
  /// Parameter [templateName] :
  /// The name of the configuration template to validate the settings against.
  ///
  /// Condition: You cannot specify both this and an environment name.
  Future<ConfigurationSettingsValidationMessages>
      validateConfigurationSettings({
    @_s.required String applicationName,
    @_s.required List<ConfigurationOptionSetting> optionSettings,
    String environmentName,
    String templateName,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    ArgumentError.checkNotNull(optionSettings, 'optionSettings');
    _s.validateStringLength(
      'environmentName',
      environmentName,
      4,
      40,
    );
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      100,
    );
    final $request = <String, dynamic>{
      'Action': 'ValidateConfigurationSettings',
      'Version': '2010-12-01',
    };
    $request['ApplicationName'] = applicationName;
    $request['OptionSettings'] = optionSettings;
    environmentName?.also((arg) => $request['EnvironmentName'] = arg);
    templateName?.also((arg) => $request['TemplateName'] = arg);
    final $result = await _protocol.send(
      $request,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ValidateConfigurationSettingsResult',
    );
    return ConfigurationSettingsValidationMessages.fromXml($result);
  }
}

enum ActionHistoryStatus {
  completed,
  failed,
  unknown,
}

extension on String {
  ActionHistoryStatus toActionHistoryStatus() {
    switch (this) {
      case 'Completed':
        return ActionHistoryStatus.completed;
      case 'Failed':
        return ActionHistoryStatus.failed;
      case 'Unknown':
        return ActionHistoryStatus.unknown;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ActionStatus {
  scheduled,
  pending,
  running,
  unknown,
}

extension on String {
  ActionStatus toActionStatus() {
    switch (this) {
      case 'Scheduled':
        return ActionStatus.scheduled;
      case 'Pending':
        return ActionStatus.pending;
      case 'Running':
        return ActionStatus.running;
      case 'Unknown':
        return ActionStatus.unknown;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ActionType {
  instanceRefresh,
  platformUpdate,
  unknown,
}

extension on String {
  ActionType toActionType() {
    switch (this) {
      case 'InstanceRefresh':
        return ActionType.instanceRefresh;
      case 'PlatformUpdate':
        return ActionType.platformUpdate;
      case 'Unknown':
        return ActionType.unknown;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the properties of an application.
class ApplicationDescription {
  /// The Amazon Resource Name (ARN) of the application.
  final String applicationArn;

  /// The name of the application.
  final String applicationName;

  /// The names of the configuration templates associated with this application.
  final List<String> configurationTemplates;

  /// The date when the application was created.
  final DateTime dateCreated;

  /// The date when the application was last modified.
  final DateTime dateUpdated;

  /// User-defined description of the application.
  final String description;

  /// The lifecycle settings for the application.
  final ApplicationResourceLifecycleConfig resourceLifecycleConfig;

  /// The names of the versions for this application.
  final List<String> versions;

  ApplicationDescription({
    this.applicationArn,
    this.applicationName,
    this.configurationTemplates,
    this.dateCreated,
    this.dateUpdated,
    this.description,
    this.resourceLifecycleConfig,
    this.versions,
  });
  factory ApplicationDescription.fromXml(_s.XmlElement elem) {
    return ApplicationDescription(
      applicationArn: _s.extractXmlStringValue(elem, 'ApplicationArn'),
      applicationName: _s.extractXmlStringValue(elem, 'ApplicationName'),
      configurationTemplates: _s
          .extractXmlChild(elem, 'ConfigurationTemplates')
          ?.let((elem) =>
              _s.extractXmlStringListValues(elem, 'ConfigurationTemplates')),
      dateCreated: _s.extractXmlDateTimeValue(elem, 'DateCreated'),
      dateUpdated: _s.extractXmlDateTimeValue(elem, 'DateUpdated'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      resourceLifecycleConfig: _s
          .extractXmlChild(elem, 'ResourceLifecycleConfig')
          ?.let((e) => ApplicationResourceLifecycleConfig.fromXml(e)),
      versions: _s
          .extractXmlChild(elem, 'Versions')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Versions')),
    );
  }
}

/// Result message containing a single description of an application.
class ApplicationDescriptionMessage {
  /// The <a>ApplicationDescription</a> of the application.
  final ApplicationDescription application;

  ApplicationDescriptionMessage({
    this.application,
  });
  factory ApplicationDescriptionMessage.fromXml(_s.XmlElement elem) {
    return ApplicationDescriptionMessage(
      application: _s
          .extractXmlChild(elem, 'Application')
          ?.let((e) => ApplicationDescription.fromXml(e)),
    );
  }
}

/// Result message containing a list of application descriptions.
class ApplicationDescriptionsMessage {
  /// This parameter contains a list of <a>ApplicationDescription</a>.
  final List<ApplicationDescription> applications;

  ApplicationDescriptionsMessage({
    this.applications,
  });
  factory ApplicationDescriptionsMessage.fromXml(_s.XmlElement elem) {
    return ApplicationDescriptionsMessage(
      applications: _s.extractXmlChild(elem, 'Applications')?.let((elem) => elem
          .findElements('Applications')
          .map((c) => ApplicationDescription.fromXml(c))
          .toList()),
    );
  }
}

/// Application request metrics for an AWS Elastic Beanstalk environment.
class ApplicationMetrics {
  /// The amount of time that the metrics cover (usually 10 seconds). For example,
  /// you might have 5 requests (<code>request_count</code>) within the most
  /// recent time slice of 10 seconds (<code>duration</code>).
  final int duration;

  /// Represents the average latency for the slowest X percent of requests over
  /// the last 10 seconds. Latencies are in seconds with one millisecond
  /// resolution.
  final Latency latency;

  /// Average number of requests handled by the web server per second over the
  /// last 10 seconds.
  final int requestCount;

  /// Represents the percentage of requests over the last 10 seconds that resulted
  /// in each type of status code response.
  final StatusCodes statusCodes;

  ApplicationMetrics({
    this.duration,
    this.latency,
    this.requestCount,
    this.statusCodes,
  });
  factory ApplicationMetrics.fromXml(_s.XmlElement elem) {
    return ApplicationMetrics(
      duration: _s.extractXmlIntValue(elem, 'Duration'),
      latency:
          _s.extractXmlChild(elem, 'Latency')?.let((e) => Latency.fromXml(e)),
      requestCount: _s.extractXmlIntValue(elem, 'RequestCount'),
      statusCodes: _s
          .extractXmlChild(elem, 'StatusCodes')
          ?.let((e) => StatusCodes.fromXml(e)),
    );
  }
}

/// The resource lifecycle configuration for an application. Defines lifecycle
/// settings for resources that belong to the application, and the service role
/// that Elastic Beanstalk assumes in order to apply lifecycle settings. The
/// version lifecycle configuration defines lifecycle settings for application
/// versions.
class ApplicationResourceLifecycleConfig {
  /// The ARN of an IAM service role that Elastic Beanstalk has permission to
  /// assume.
  ///
  /// The <code>ServiceRole</code> property is required the first time that you
  /// provide a <code>VersionLifecycleConfig</code> for the application in one of
  /// the supporting calls (<code>CreateApplication</code> or
  /// <code>UpdateApplicationResourceLifecycle</code>). After you provide it once,
  /// in either one of the calls, Elastic Beanstalk persists the Service Role with
  /// the application, and you don't need to specify it again in subsequent
  /// <code>UpdateApplicationResourceLifecycle</code> calls. You can, however,
  /// specify it in subsequent calls to change the Service Role to another value.
  final String serviceRole;

  /// The application version lifecycle configuration.
  final ApplicationVersionLifecycleConfig versionLifecycleConfig;

  ApplicationResourceLifecycleConfig({
    this.serviceRole,
    this.versionLifecycleConfig,
  });
  factory ApplicationResourceLifecycleConfig.fromXml(_s.XmlElement elem) {
    return ApplicationResourceLifecycleConfig(
      serviceRole: _s.extractXmlStringValue(elem, 'ServiceRole'),
      versionLifecycleConfig: _s
          .extractXmlChild(elem, 'VersionLifecycleConfig')
          ?.let((e) => ApplicationVersionLifecycleConfig.fromXml(e)),
    );
  }
}

class ApplicationResourceLifecycleDescriptionMessage {
  /// The name of the application.
  final String applicationName;

  /// The lifecycle configuration.
  final ApplicationResourceLifecycleConfig resourceLifecycleConfig;

  ApplicationResourceLifecycleDescriptionMessage({
    this.applicationName,
    this.resourceLifecycleConfig,
  });
  factory ApplicationResourceLifecycleDescriptionMessage.fromXml(
      _s.XmlElement elem) {
    return ApplicationResourceLifecycleDescriptionMessage(
      applicationName: _s.extractXmlStringValue(elem, 'ApplicationName'),
      resourceLifecycleConfig: _s
          .extractXmlChild(elem, 'ResourceLifecycleConfig')
          ?.let((e) => ApplicationResourceLifecycleConfig.fromXml(e)),
    );
  }
}

/// Describes the properties of an application version.
class ApplicationVersionDescription {
  /// The name of the application to which the application version belongs.
  final String applicationName;

  /// The Amazon Resource Name (ARN) of the application version.
  final String applicationVersionArn;

  /// Reference to the artifact from the AWS CodeBuild build.
  final String buildArn;

  /// The creation date of the application version.
  final DateTime dateCreated;

  /// The last modified date of the application version.
  final DateTime dateUpdated;

  /// The description of the application version.
  final String description;

  /// If the version's source code was retrieved from AWS CodeCommit, the location
  /// of the source code for the application version.
  final SourceBuildInformation sourceBuildInformation;

  /// The storage location of the application version's source bundle in Amazon
  /// S3.
  final S3Location sourceBundle;

  /// The processing status of the application version. Reflects the state of the
  /// application version during its creation. Many of the values are only
  /// applicable if you specified <code>True</code> for the <code>Process</code>
  /// parameter of the <code>CreateApplicationVersion</code> action. The following
  /// list describes the possible values.
  ///
  /// <ul>
  /// <li>
  /// <code>Unprocessed</code> – Application version wasn't pre-processed or
  /// validated. Elastic Beanstalk will validate configuration files during
  /// deployment of the application version to an environment.
  /// </li>
  /// <li>
  /// <code>Processing</code> – Elastic Beanstalk is currently processing the
  /// application version.
  /// </li>
  /// <li>
  /// <code>Building</code> – Application version is currently undergoing an AWS
  /// CodeBuild build.
  /// </li>
  /// <li>
  /// <code>Processed</code> – Elastic Beanstalk was successfully pre-processed
  /// and validated.
  /// </li>
  /// <li>
  /// <code>Failed</code> – Either the AWS CodeBuild build failed or configuration
  /// files didn't pass validation. This application version isn't usable.
  /// </li>
  /// </ul>
  final ApplicationVersionStatus status;

  /// A unique identifier for the application version.
  final String versionLabel;

  ApplicationVersionDescription({
    this.applicationName,
    this.applicationVersionArn,
    this.buildArn,
    this.dateCreated,
    this.dateUpdated,
    this.description,
    this.sourceBuildInformation,
    this.sourceBundle,
    this.status,
    this.versionLabel,
  });
  factory ApplicationVersionDescription.fromXml(_s.XmlElement elem) {
    return ApplicationVersionDescription(
      applicationName: _s.extractXmlStringValue(elem, 'ApplicationName'),
      applicationVersionArn:
          _s.extractXmlStringValue(elem, 'ApplicationVersionArn'),
      buildArn: _s.extractXmlStringValue(elem, 'BuildArn'),
      dateCreated: _s.extractXmlDateTimeValue(elem, 'DateCreated'),
      dateUpdated: _s.extractXmlDateTimeValue(elem, 'DateUpdated'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      sourceBuildInformation: _s
          .extractXmlChild(elem, 'SourceBuildInformation')
          ?.let((e) => SourceBuildInformation.fromXml(e)),
      sourceBundle: _s
          .extractXmlChild(elem, 'SourceBundle')
          ?.let((e) => S3Location.fromXml(e)),
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toApplicationVersionStatus(),
      versionLabel: _s.extractXmlStringValue(elem, 'VersionLabel'),
    );
  }
}

/// Result message wrapping a single description of an application version.
class ApplicationVersionDescriptionMessage {
  /// The <a>ApplicationVersionDescription</a> of the application version.
  final ApplicationVersionDescription applicationVersion;

  ApplicationVersionDescriptionMessage({
    this.applicationVersion,
  });
  factory ApplicationVersionDescriptionMessage.fromXml(_s.XmlElement elem) {
    return ApplicationVersionDescriptionMessage(
      applicationVersion: _s
          .extractXmlChild(elem, 'ApplicationVersion')
          ?.let((e) => ApplicationVersionDescription.fromXml(e)),
    );
  }
}

/// Result message wrapping a list of application version descriptions.
class ApplicationVersionDescriptionsMessage {
  /// List of <code>ApplicationVersionDescription</code> objects sorted in order
  /// of creation.
  final List<ApplicationVersionDescription> applicationVersions;

  /// In a paginated request, the token that you can pass in a subsequent request
  /// to get the next response page.
  final String nextToken;

  ApplicationVersionDescriptionsMessage({
    this.applicationVersions,
    this.nextToken,
  });
  factory ApplicationVersionDescriptionsMessage.fromXml(_s.XmlElement elem) {
    return ApplicationVersionDescriptionsMessage(
      applicationVersions: _s.extractXmlChild(elem, 'ApplicationVersions')?.let(
          (elem) => elem
              .findElements('ApplicationVersions')
              .map((c) => ApplicationVersionDescription.fromXml(c))
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

/// The application version lifecycle settings for an application. Defines the
/// rules that Elastic Beanstalk applies to an application's versions in order
/// to avoid hitting the per-region limit for application versions.
///
/// When Elastic Beanstalk deletes an application version from its database, you
/// can no longer deploy that version to an environment. The source bundle
/// remains in S3 unless you configure the rule to delete it.
class ApplicationVersionLifecycleConfig {
  /// Specify a max age rule to restrict the length of time that application
  /// versions are retained for an application.
  final MaxAgeRule maxAgeRule;

  /// Specify a max count rule to restrict the number of application versions that
  /// are retained for an application.
  final MaxCountRule maxCountRule;

  ApplicationVersionLifecycleConfig({
    this.maxAgeRule,
    this.maxCountRule,
  });
  factory ApplicationVersionLifecycleConfig.fromXml(_s.XmlElement elem) {
    return ApplicationVersionLifecycleConfig(
      maxAgeRule: _s
          .extractXmlChild(elem, 'MaxAgeRule')
          ?.let((e) => MaxAgeRule.fromXml(e)),
      maxCountRule: _s
          .extractXmlChild(elem, 'MaxCountRule')
          ?.let((e) => MaxCountRule.fromXml(e)),
    );
  }
}

enum ApplicationVersionStatus {
  processed,
  unprocessed,
  failed,
  processing,
  building,
}

extension on String {
  ApplicationVersionStatus toApplicationVersionStatus() {
    switch (this) {
      case 'Processed':
        return ApplicationVersionStatus.processed;
      case 'Unprocessed':
        return ApplicationVersionStatus.unprocessed;
      case 'Failed':
        return ApplicationVersionStatus.failed;
      case 'Processing':
        return ApplicationVersionStatus.processing;
      case 'Building':
        return ApplicationVersionStatus.building;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The result message containing information about the managed action.
class ApplyEnvironmentManagedActionResult {
  /// A description of the managed action.
  final String actionDescription;

  /// The action ID of the managed action.
  final String actionId;

  /// The type of managed action.
  final ActionType actionType;

  /// The status of the managed action.
  final String status;

  ApplyEnvironmentManagedActionResult({
    this.actionDescription,
    this.actionId,
    this.actionType,
    this.status,
  });
  factory ApplyEnvironmentManagedActionResult.fromXml(_s.XmlElement elem) {
    return ApplyEnvironmentManagedActionResult(
      actionDescription: _s.extractXmlStringValue(elem, 'ActionDescription'),
      actionId: _s.extractXmlStringValue(elem, 'ActionId'),
      actionType: _s.extractXmlStringValue(elem, 'ActionType')?.toActionType(),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

/// Describes an Auto Scaling launch configuration.
class AutoScalingGroup {
  /// The name of the <code>AutoScalingGroup</code> .
  final String name;

  AutoScalingGroup({
    this.name,
  });
  factory AutoScalingGroup.fromXml(_s.XmlElement elem) {
    return AutoScalingGroup(
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }
}

/// Settings for an AWS CodeBuild build.
class BuildConfiguration {
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that enables AWS CodeBuild to interact with dependent AWS
  /// services on behalf of the AWS account.
  final String codeBuildServiceRole;

  /// The ID of the Docker image to use for this build project.
  final String image;

  /// The name of the artifact of the CodeBuild build. If provided, Elastic
  /// Beanstalk stores the build artifact in the S3 location
  /// <i>S3-bucket</i>/resources/<i>application-name</i>/codebuild/codebuild-<i>version-label</i>-<i>artifact-name</i>.zip.
  /// If not provided, Elastic Beanstalk stores the build artifact in the S3
  /// location
  /// <i>S3-bucket</i>/resources/<i>application-name</i>/codebuild/codebuild-<i>version-label</i>.zip.
  final String artifactName;

  /// Information about the compute resources the build project will use.
  ///
  /// <ul>
  /// <li>
  /// <code>BUILD_GENERAL1_SMALL: Use up to 3 GB memory and 2 vCPUs for
  /// builds</code>
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_MEDIUM: Use up to 7 GB memory and 4 vCPUs for
  /// builds</code>
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_LARGE: Use up to 15 GB memory and 8 vCPUs for
  /// builds</code>
  /// </li>
  /// </ul>
  final ComputeType computeType;

  /// How long in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait
  /// until timing out any related build that does not get marked as completed.
  /// The default is 60 minutes.
  final int timeoutInMinutes;

  BuildConfiguration({
    @_s.required this.codeBuildServiceRole,
    @_s.required this.image,
    this.artifactName,
    this.computeType,
    this.timeoutInMinutes,
  });
}

/// The builder used to build the custom platform.
class Builder {
  /// The ARN of the builder.
  final String arn;

  Builder({
    this.arn,
  });
  factory Builder.fromXml(_s.XmlElement elem) {
    return Builder(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
    );
  }
}

/// CPU utilization metrics for an instance.
class CPUUtilization {
  /// Available on Linux environments only.
  ///
  /// Percentage of time that the CPU has spent in the <code>I/O Wait</code> state
  /// over the last 10 seconds.
  final double iOWait;

  /// Available on Linux environments only.
  ///
  /// Percentage of time that the CPU has spent in the <code>IRQ</code> state over
  /// the last 10 seconds.
  final double irq;

  /// Percentage of time that the CPU has spent in the <code>Idle</code> state
  /// over the last 10 seconds.
  final double idle;

  /// Available on Linux environments only.
  ///
  /// Percentage of time that the CPU has spent in the <code>Nice</code> state
  /// over the last 10 seconds.
  final double nice;

  /// Available on Windows environments only.
  ///
  /// Percentage of time that the CPU has spent in the <code>Privileged</code>
  /// state over the last 10 seconds.
  final double privileged;

  /// Available on Linux environments only.
  ///
  /// Percentage of time that the CPU has spent in the <code>SoftIRQ</code> state
  /// over the last 10 seconds.
  final double softIRQ;

  /// Available on Linux environments only.
  ///
  /// Percentage of time that the CPU has spent in the <code>System</code> state
  /// over the last 10 seconds.
  final double system;

  /// Percentage of time that the CPU has spent in the <code>User</code> state
  /// over the last 10 seconds.
  final double user;

  CPUUtilization({
    this.iOWait,
    this.irq,
    this.idle,
    this.nice,
    this.privileged,
    this.softIRQ,
    this.system,
    this.user,
  });
  factory CPUUtilization.fromXml(_s.XmlElement elem) {
    return CPUUtilization(
      iOWait: _s.extractXmlDoubleValue(elem, 'IOWait'),
      irq: _s.extractXmlDoubleValue(elem, 'IRQ'),
      idle: _s.extractXmlDoubleValue(elem, 'Idle'),
      nice: _s.extractXmlDoubleValue(elem, 'Nice'),
      privileged: _s.extractXmlDoubleValue(elem, 'Privileged'),
      softIRQ: _s.extractXmlDoubleValue(elem, 'SoftIRQ'),
      system: _s.extractXmlDoubleValue(elem, 'System'),
      user: _s.extractXmlDoubleValue(elem, 'User'),
    );
  }
}

/// Indicates if the specified CNAME is available.
class CheckDNSAvailabilityResultMessage {
  /// Indicates if the specified CNAME is available:
  ///
  /// <ul>
  /// <li>
  /// <code>true</code> : The CNAME is available.
  /// </li>
  /// <li>
  /// <code>false</code> : The CNAME is not available.
  /// </li>
  /// </ul>
  final bool available;

  /// The fully qualified CNAME to reserve when <a>CreateEnvironment</a> is called
  /// with the provided prefix.
  final String fullyQualifiedCNAME;

  CheckDNSAvailabilityResultMessage({
    this.available,
    this.fullyQualifiedCNAME,
  });
  factory CheckDNSAvailabilityResultMessage.fromXml(_s.XmlElement elem) {
    return CheckDNSAvailabilityResultMessage(
      available: _s.extractXmlBoolValue(elem, 'Available'),
      fullyQualifiedCNAME:
          _s.extractXmlStringValue(elem, 'FullyQualifiedCNAME'),
    );
  }
}

enum ComputeType {
  buildGeneral1Small,
  buildGeneral1Medium,
  buildGeneral1Large,
}

extension on String {
  ComputeType toComputeType() {
    switch (this) {
      case 'BUILD_GENERAL1_SMALL':
        return ComputeType.buildGeneral1Small;
      case 'BUILD_GENERAL1_MEDIUM':
        return ComputeType.buildGeneral1Medium;
      case 'BUILD_GENERAL1_LARGE':
        return ComputeType.buildGeneral1Large;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ConfigurationDeploymentStatus {
  deployed,
  pending,
  failed,
}

extension on String {
  ConfigurationDeploymentStatus toConfigurationDeploymentStatus() {
    switch (this) {
      case 'deployed':
        return ConfigurationDeploymentStatus.deployed;
      case 'pending':
        return ConfigurationDeploymentStatus.pending;
      case 'failed':
        return ConfigurationDeploymentStatus.failed;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the possible values for a configuration option.
class ConfigurationOptionDescription {
  /// An indication of which action is required if the value for this
  /// configuration option changes:
  ///
  /// <ul>
  /// <li>
  /// <code>NoInterruption</code> : There is no interruption to the environment or
  /// application availability.
  /// </li>
  /// <li>
  /// <code>RestartEnvironment</code> : The environment is entirely restarted, all
  /// AWS resources are deleted and recreated, and the environment is unavailable
  /// during the process.
  /// </li>
  /// <li>
  /// <code>RestartApplicationServer</code> : The environment is available the
  /// entire time. However, a short application outage occurs when the application
  /// servers on the running Amazon EC2 instances are restarted.
  /// </li>
  /// </ul>
  final String changeSeverity;

  /// The default value for this configuration option.
  final String defaultValue;

  /// If specified, the configuration option must be a string value no longer than
  /// this value.
  final int maxLength;

  /// If specified, the configuration option must be a numeric value less than
  /// this value.
  final int maxValue;

  /// If specified, the configuration option must be a numeric value greater than
  /// this value.
  final int minValue;

  /// The name of the configuration option.
  final String name;

  /// A unique namespace identifying the option's associated AWS resource.
  final String namespace;

  /// If specified, the configuration option must be a string value that satisfies
  /// this regular expression.
  final OptionRestrictionRegex regex;

  /// An indication of whether the user defined this configuration option:
  ///
  /// <ul>
  /// <li>
  /// <code>true</code> : This configuration option was defined by the user. It is
  /// a valid choice for specifying if this as an <code>Option to Remove</code>
  /// when updating configuration settings.
  /// </li>
  /// <li>
  /// <code>false</code> : This configuration was not defined by the user.
  /// </li>
  /// </ul>
  /// Constraint: You can remove only <code>UserDefined</code> options from a
  /// configuration.
  ///
  /// Valid Values: <code>true</code> | <code>false</code>
  final bool userDefined;

  /// If specified, values for the configuration option are selected from this
  /// list.
  final List<String> valueOptions;

  /// An indication of which type of values this option has and whether it is
  /// allowable to select one or more than one of the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>Scalar</code> : Values for this option are a single selection from the
  /// possible values, or an unformatted string, or numeric value governed by the
  /// <code>MIN/MAX/Regex</code> constraints.
  /// </li>
  /// <li>
  /// <code>List</code> : Values for this option are multiple selections from the
  /// possible values.
  /// </li>
  /// <li>
  /// <code>Boolean</code> : Values for this option are either <code>true</code>
  /// or <code>false</code> .
  /// </li>
  /// <li>
  /// <code>Json</code> : Values for this option are a JSON representation of a
  /// <code>ConfigDocument</code>.
  /// </li>
  /// </ul>
  final ConfigurationOptionValueType valueType;

  ConfigurationOptionDescription({
    this.changeSeverity,
    this.defaultValue,
    this.maxLength,
    this.maxValue,
    this.minValue,
    this.name,
    this.namespace,
    this.regex,
    this.userDefined,
    this.valueOptions,
    this.valueType,
  });
  factory ConfigurationOptionDescription.fromXml(_s.XmlElement elem) {
    return ConfigurationOptionDescription(
      changeSeverity: _s.extractXmlStringValue(elem, 'ChangeSeverity'),
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      maxLength: _s.extractXmlIntValue(elem, 'MaxLength'),
      maxValue: _s.extractXmlIntValue(elem, 'MaxValue'),
      minValue: _s.extractXmlIntValue(elem, 'MinValue'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      namespace: _s.extractXmlStringValue(elem, 'Namespace'),
      regex: _s
          .extractXmlChild(elem, 'Regex')
          ?.let((e) => OptionRestrictionRegex.fromXml(e)),
      userDefined: _s.extractXmlBoolValue(elem, 'UserDefined'),
      valueOptions: _s
          .extractXmlChild(elem, 'ValueOptions')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'ValueOptions')),
      valueType: _s
          .extractXmlStringValue(elem, 'ValueType')
          ?.toConfigurationOptionValueType(),
    );
  }
}

/// A specification identifying an individual configuration option along with
/// its current value. For a list of possible option values, go to <a
/// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options.html">Option
/// Values</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.
class ConfigurationOptionSetting {
  /// A unique namespace identifying the option's associated AWS resource.
  final String namespace;

  /// The name of the configuration option.
  final String optionName;

  /// A unique resource name for a time-based scaling configuration option.
  final String resourceName;

  /// The current value for the configuration option.
  final String value;

  ConfigurationOptionSetting({
    this.namespace,
    this.optionName,
    this.resourceName,
    this.value,
  });
  factory ConfigurationOptionSetting.fromXml(_s.XmlElement elem) {
    return ConfigurationOptionSetting(
      namespace: _s.extractXmlStringValue(elem, 'Namespace'),
      optionName: _s.extractXmlStringValue(elem, 'OptionName'),
      resourceName: _s.extractXmlStringValue(elem, 'ResourceName'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }
}

enum ConfigurationOptionValueType {
  scalar,
  list,
}

extension on String {
  ConfigurationOptionValueType toConfigurationOptionValueType() {
    switch (this) {
      case 'Scalar':
        return ConfigurationOptionValueType.scalar;
      case 'List':
        return ConfigurationOptionValueType.list;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the settings for a specified configuration set.
class ConfigurationOptionsDescription {
  /// A list of <a>ConfigurationOptionDescription</a>.
  final List<ConfigurationOptionDescription> options;

  /// The ARN of the platform.
  final String platformArn;

  /// The name of the solution stack these configuration options belong to.
  final String solutionStackName;

  ConfigurationOptionsDescription({
    this.options,
    this.platformArn,
    this.solutionStackName,
  });
  factory ConfigurationOptionsDescription.fromXml(_s.XmlElement elem) {
    return ConfigurationOptionsDescription(
      options: _s.extractXmlChild(elem, 'Options')?.let((elem) => elem
          .findElements('Options')
          .map((c) => ConfigurationOptionDescription.fromXml(c))
          .toList()),
      platformArn: _s.extractXmlStringValue(elem, 'PlatformArn'),
      solutionStackName: _s.extractXmlStringValue(elem, 'SolutionStackName'),
    );
  }
}

/// Describes the settings for a configuration set.
class ConfigurationSettingsDescription {
  /// The name of the application associated with this configuration set.
  final String applicationName;

  /// The date (in UTC time) when this configuration set was created.
  final DateTime dateCreated;

  /// The date (in UTC time) when this configuration set was last modified.
  final DateTime dateUpdated;

  /// If this configuration set is associated with an environment, the
  /// <code>DeploymentStatus</code> parameter indicates the deployment status of
  /// this configuration set:
  ///
  /// <ul>
  /// <li>
  /// <code>null</code>: This configuration is not associated with a running
  /// environment.
  /// </li>
  /// <li>
  /// <code>pending</code>: This is a draft configuration that is not deployed to
  /// the associated environment but is in the process of deploying.
  /// </li>
  /// <li>
  /// <code>deployed</code>: This is the configuration that is currently deployed
  /// to the associated running environment.
  /// </li>
  /// <li>
  /// <code>failed</code>: This is a draft configuration that failed to
  /// successfully deploy.
  /// </li>
  /// </ul>
  final ConfigurationDeploymentStatus deploymentStatus;

  /// Describes this configuration set.
  final String description;

  /// If not <code>null</code>, the name of the environment for this configuration
  /// set.
  final String environmentName;

  /// A list of the configuration options and their values in this configuration
  /// set.
  final List<ConfigurationOptionSetting> optionSettings;

  /// The ARN of the platform.
  final String platformArn;

  /// The name of the solution stack this configuration set uses.
  final String solutionStackName;

  /// If not <code>null</code>, the name of the configuration template for this
  /// configuration set.
  final String templateName;

  ConfigurationSettingsDescription({
    this.applicationName,
    this.dateCreated,
    this.dateUpdated,
    this.deploymentStatus,
    this.description,
    this.environmentName,
    this.optionSettings,
    this.platformArn,
    this.solutionStackName,
    this.templateName,
  });
  factory ConfigurationSettingsDescription.fromXml(_s.XmlElement elem) {
    return ConfigurationSettingsDescription(
      applicationName: _s.extractXmlStringValue(elem, 'ApplicationName'),
      dateCreated: _s.extractXmlDateTimeValue(elem, 'DateCreated'),
      dateUpdated: _s.extractXmlDateTimeValue(elem, 'DateUpdated'),
      deploymentStatus: _s
          .extractXmlStringValue(elem, 'DeploymentStatus')
          ?.toConfigurationDeploymentStatus(),
      description: _s.extractXmlStringValue(elem, 'Description'),
      environmentName: _s.extractXmlStringValue(elem, 'EnvironmentName'),
      optionSettings: _s.extractXmlChild(elem, 'OptionSettings')?.let((elem) =>
          elem
              .findElements('OptionSettings')
              .map((c) => ConfigurationOptionSetting.fromXml(c))
              .toList()),
      platformArn: _s.extractXmlStringValue(elem, 'PlatformArn'),
      solutionStackName: _s.extractXmlStringValue(elem, 'SolutionStackName'),
      templateName: _s.extractXmlStringValue(elem, 'TemplateName'),
    );
  }
}

/// The results from a request to change the configuration settings of an
/// environment.
class ConfigurationSettingsDescriptions {
  /// A list of <a>ConfigurationSettingsDescription</a>.
  final List<ConfigurationSettingsDescription> configurationSettings;

  ConfigurationSettingsDescriptions({
    this.configurationSettings,
  });
  factory ConfigurationSettingsDescriptions.fromXml(_s.XmlElement elem) {
    return ConfigurationSettingsDescriptions(
      configurationSettings: _s
          .extractXmlChild(elem, 'ConfigurationSettings')
          ?.let((elem) => elem
              .findElements('ConfigurationSettings')
              .map((c) => ConfigurationSettingsDescription.fromXml(c))
              .toList()),
    );
  }
}

/// Provides a list of validation messages.
class ConfigurationSettingsValidationMessages {
  /// A list of <a>ValidationMessage</a>.
  final List<ValidationMessage> messages;

  ConfigurationSettingsValidationMessages({
    this.messages,
  });
  factory ConfigurationSettingsValidationMessages.fromXml(_s.XmlElement elem) {
    return ConfigurationSettingsValidationMessages(
      messages: _s.extractXmlChild(elem, 'Messages')?.let((elem) => elem
          .findElements('Messages')
          .map((c) => ValidationMessage.fromXml(c))
          .toList()),
    );
  }
}

class CreatePlatformVersionResult {
  /// The builder used to create the custom platform.
  final Builder builder;

  /// Detailed information about the new version of the custom platform.
  final PlatformSummary platformSummary;

  CreatePlatformVersionResult({
    this.builder,
    this.platformSummary,
  });
  factory CreatePlatformVersionResult.fromXml(_s.XmlElement elem) {
    return CreatePlatformVersionResult(
      builder:
          _s.extractXmlChild(elem, 'Builder')?.let((e) => Builder.fromXml(e)),
      platformSummary: _s
          .extractXmlChild(elem, 'PlatformSummary')
          ?.let((e) => PlatformSummary.fromXml(e)),
    );
  }
}

/// Results of a <a>CreateStorageLocationResult</a> call.
class CreateStorageLocationResultMessage {
  /// The name of the Amazon S3 bucket created.
  final String s3Bucket;

  CreateStorageLocationResultMessage({
    this.s3Bucket,
  });
  factory CreateStorageLocationResultMessage.fromXml(_s.XmlElement elem) {
    return CreateStorageLocationResultMessage(
      s3Bucket: _s.extractXmlStringValue(elem, 'S3Bucket'),
    );
  }
}

/// A custom AMI available to platforms.
class CustomAmi {
  /// THe ID of the image used to create the custom AMI.
  final String imageId;

  /// The type of virtualization used to create the custom AMI.
  final String virtualizationType;

  CustomAmi({
    this.imageId,
    this.virtualizationType,
  });
  factory CustomAmi.fromXml(_s.XmlElement elem) {
    return CustomAmi(
      imageId: _s.extractXmlStringValue(elem, 'ImageId'),
      virtualizationType: _s.extractXmlStringValue(elem, 'VirtualizationType'),
    );
  }
}

class DeletePlatformVersionResult {
  /// Detailed information about the version of the custom platform.
  final PlatformSummary platformSummary;

  DeletePlatformVersionResult({
    this.platformSummary,
  });
  factory DeletePlatformVersionResult.fromXml(_s.XmlElement elem) {
    return DeletePlatformVersionResult(
      platformSummary: _s
          .extractXmlChild(elem, 'PlatformSummary')
          ?.let((e) => PlatformSummary.fromXml(e)),
    );
  }
}

/// Information about an application version deployment.
class Deployment {
  /// The ID of the deployment. This number increases by one each time that you
  /// deploy source code or change instance configuration settings.
  final int deploymentId;

  /// For in-progress deployments, the time that the deployment started.
  ///
  /// For completed deployments, the time that the deployment ended.
  final DateTime deploymentTime;

  /// The status of the deployment:
  ///
  /// <ul>
  /// <li>
  /// <code>In Progress</code> : The deployment is in progress.
  /// </li>
  /// <li>
  /// <code>Deployed</code> : The deployment succeeded.
  /// </li>
  /// <li>
  /// <code>Failed</code> : The deployment failed.
  /// </li>
  /// </ul>
  final String status;

  /// The version label of the application version in the deployment.
  final String versionLabel;

  Deployment({
    this.deploymentId,
    this.deploymentTime,
    this.status,
    this.versionLabel,
  });
  factory Deployment.fromXml(_s.XmlElement elem) {
    return Deployment(
      deploymentId: _s.extractXmlIntValue(elem, 'DeploymentId'),
      deploymentTime: _s.extractXmlDateTimeValue(elem, 'DeploymentTime'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      versionLabel: _s.extractXmlStringValue(elem, 'VersionLabel'),
    );
  }
}

class DescribeAccountAttributesResult {
  /// The Elastic Beanstalk resource quotas associated with the calling AWS
  /// account.
  final ResourceQuotas resourceQuotas;

  DescribeAccountAttributesResult({
    this.resourceQuotas,
  });
  factory DescribeAccountAttributesResult.fromXml(_s.XmlElement elem) {
    return DescribeAccountAttributesResult(
      resourceQuotas: _s
          .extractXmlChild(elem, 'ResourceQuotas')
          ?.let((e) => ResourceQuotas.fromXml(e)),
    );
  }
}

/// Health details for an AWS Elastic Beanstalk environment.
class DescribeEnvironmentHealthResult {
  /// Application request metrics for the environment.
  final ApplicationMetrics applicationMetrics;

  /// Descriptions of the data that contributed to the environment's current
  /// health status.
  final List<String> causes;

  /// The <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">health
  /// color</a> of the environment.
  final String color;

  /// The environment's name.
  final String environmentName;

  /// The <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">health
  /// status</a> of the environment. For example, <code>Ok</code>.
  final String healthStatus;

  /// Summary health information for the instances in the environment.
  final InstanceHealthSummary instancesHealth;

  /// The date and time that the health information was retrieved.
  final DateTime refreshedAt;

  /// The environment's operational status. <code>Ready</code>,
  /// <code>Launching</code>, <code>Updating</code>, <code>Terminating</code>, or
  /// <code>Terminated</code>.
  final EnvironmentHealth status;

  DescribeEnvironmentHealthResult({
    this.applicationMetrics,
    this.causes,
    this.color,
    this.environmentName,
    this.healthStatus,
    this.instancesHealth,
    this.refreshedAt,
    this.status,
  });
  factory DescribeEnvironmentHealthResult.fromXml(_s.XmlElement elem) {
    return DescribeEnvironmentHealthResult(
      applicationMetrics: _s
          .extractXmlChild(elem, 'ApplicationMetrics')
          ?.let((e) => ApplicationMetrics.fromXml(e)),
      causes: _s
          .extractXmlChild(elem, 'Causes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Causes')),
      color: _s.extractXmlStringValue(elem, 'Color'),
      environmentName: _s.extractXmlStringValue(elem, 'EnvironmentName'),
      healthStatus: _s.extractXmlStringValue(elem, 'HealthStatus'),
      instancesHealth: _s
          .extractXmlChild(elem, 'InstancesHealth')
          ?.let((e) => InstanceHealthSummary.fromXml(e)),
      refreshedAt: _s.extractXmlDateTimeValue(elem, 'RefreshedAt'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toEnvironmentHealth(),
    );
  }
}

/// A result message containing a list of completed and failed managed actions.
class DescribeEnvironmentManagedActionHistoryResult {
  /// A list of completed and failed managed actions.
  final List<ManagedActionHistoryItem> managedActionHistoryItems;

  /// A pagination token that you pass to
  /// <a>DescribeEnvironmentManagedActionHistory</a> to get the next page of
  /// results.
  final String nextToken;

  DescribeEnvironmentManagedActionHistoryResult({
    this.managedActionHistoryItems,
    this.nextToken,
  });
  factory DescribeEnvironmentManagedActionHistoryResult.fromXml(
      _s.XmlElement elem) {
    return DescribeEnvironmentManagedActionHistoryResult(
      managedActionHistoryItems: _s
          .extractXmlChild(elem, 'ManagedActionHistoryItems')
          ?.let((elem) => elem
              .findElements('ManagedActionHistoryItems')
              .map((c) => ManagedActionHistoryItem.fromXml(c))
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

/// The result message containing a list of managed actions.
class DescribeEnvironmentManagedActionsResult {
  /// A list of upcoming and in-progress managed actions.
  final List<ManagedAction> managedActions;

  DescribeEnvironmentManagedActionsResult({
    this.managedActions,
  });
  factory DescribeEnvironmentManagedActionsResult.fromXml(_s.XmlElement elem) {
    return DescribeEnvironmentManagedActionsResult(
      managedActions: _s.extractXmlChild(elem, 'ManagedActions')?.let((elem) =>
          elem
              .findElements('ManagedActions')
              .map((c) => ManagedAction.fromXml(c))
              .toList()),
    );
  }
}

/// Detailed health information about the Amazon EC2 instances in an AWS Elastic
/// Beanstalk environment.
class DescribeInstancesHealthResult {
  /// Detailed health information about each instance.
  ///
  /// The output differs slightly between Linux and Windows environments. There is
  /// a difference in the members that are supported under the
  /// <code>&lt;CPUUtilization&gt;</code> type.
  final List<SingleInstanceHealth> instanceHealthList;

  /// Pagination token for the next page of results, if available.
  final String nextToken;

  /// The date and time that the health information was retrieved.
  final DateTime refreshedAt;

  DescribeInstancesHealthResult({
    this.instanceHealthList,
    this.nextToken,
    this.refreshedAt,
  });
  factory DescribeInstancesHealthResult.fromXml(_s.XmlElement elem) {
    return DescribeInstancesHealthResult(
      instanceHealthList: _s.extractXmlChild(elem, 'InstanceHealthList')?.let(
          (elem) => elem
              .findElements('InstanceHealthList')
              .map((c) => SingleInstanceHealth.fromXml(c))
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      refreshedAt: _s.extractXmlDateTimeValue(elem, 'RefreshedAt'),
    );
  }
}

class DescribePlatformVersionResult {
  /// Detailed information about the version of the platform.
  final PlatformDescription platformDescription;

  DescribePlatformVersionResult({
    this.platformDescription,
  });
  factory DescribePlatformVersionResult.fromXml(_s.XmlElement elem) {
    return DescribePlatformVersionResult(
      platformDescription: _s
          .extractXmlChild(elem, 'PlatformDescription')
          ?.let((e) => PlatformDescription.fromXml(e)),
    );
  }
}

/// Describes the properties of an environment.
class EnvironmentDescription {
  /// Indicates if there is an in-progress environment configuration update or
  /// application version deployment that you can cancel.
  ///
  /// <code>true:</code> There is an update in progress.
  ///
  /// <code>false:</code> There are no updates currently in progress.
  final bool abortableOperationInProgress;

  /// The name of the application associated with this environment.
  final String applicationName;

  /// The URL to the CNAME for this environment.
  final String cname;

  /// The creation date for this environment.
  final DateTime dateCreated;

  /// The last modified date for this environment.
  final DateTime dateUpdated;

  /// Describes this environment.
  final String description;

  /// For load-balanced, autoscaling environments, the URL to the LoadBalancer.
  /// For single-instance environments, the IP address of the instance.
  final String endpointURL;

  /// The environment's Amazon Resource Name (ARN), which can be used in other API
  /// requests that require an ARN.
  final String environmentArn;

  /// The ID of this environment.
  final String environmentId;

  /// A list of links to other environments in the same group.
  final List<EnvironmentLink> environmentLinks;

  /// The name of this environment.
  final String environmentName;

  /// Describes the health status of the environment. AWS Elastic Beanstalk
  /// indicates the failure levels for a running environment:
  ///
  /// <ul>
  /// <li>
  /// <code>Red</code>: Indicates the environment is not responsive. Occurs when
  /// three or more consecutive failures occur for an environment.
  /// </li>
  /// <li>
  /// <code>Yellow</code>: Indicates that something is wrong. Occurs when two
  /// consecutive failures occur for an environment.
  /// </li>
  /// <li>
  /// <code>Green</code>: Indicates the environment is healthy and fully
  /// functional.
  /// </li>
  /// <li>
  /// <code>Grey</code>: Default health for a new environment. The environment is
  /// not fully launched and health checks have not started or health checks are
  /// suspended during an <code>UpdateEnvironment</code> or
  /// <code>RestartEnvironment</code> request.
  /// </li>
  /// </ul>
  /// Default: <code>Grey</code>
  final EnvironmentHealth health;

  /// Returns the health status of the application running in your environment.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">Health
  /// Colors and Statuses</a>.
  final EnvironmentHealthStatus healthStatus;

  /// The ARN of the platform.
  final String platformArn;

  /// The description of the AWS resources used by this environment.
  final EnvironmentResourcesDescription resources;

  /// The name of the <code>SolutionStack</code> deployed with this environment.
  final String solutionStackName;

  /// The current operational status of the environment:
  ///
  /// <ul>
  /// <li>
  /// <code>Launching</code>: Environment is in the process of initial deployment.
  /// </li>
  /// <li>
  /// <code>Updating</code>: Environment is in the process of updating its
  /// configuration settings or application version.
  /// </li>
  /// <li>
  /// <code>Ready</code>: Environment is available to have an action performed on
  /// it, such as update or terminate.
  /// </li>
  /// <li>
  /// <code>Terminating</code>: Environment is in the shut-down process.
  /// </li>
  /// <li>
  /// <code>Terminated</code>: Environment is not running.
  /// </li>
  /// </ul>
  final EnvironmentStatus status;

  /// The name of the configuration template used to originally launch this
  /// environment.
  final String templateName;

  /// Describes the current tier of this environment.
  final EnvironmentTier tier;

  /// The application version deployed in this environment.
  final String versionLabel;

  EnvironmentDescription({
    this.abortableOperationInProgress,
    this.applicationName,
    this.cname,
    this.dateCreated,
    this.dateUpdated,
    this.description,
    this.endpointURL,
    this.environmentArn,
    this.environmentId,
    this.environmentLinks,
    this.environmentName,
    this.health,
    this.healthStatus,
    this.platformArn,
    this.resources,
    this.solutionStackName,
    this.status,
    this.templateName,
    this.tier,
    this.versionLabel,
  });
  factory EnvironmentDescription.fromXml(_s.XmlElement elem) {
    return EnvironmentDescription(
      abortableOperationInProgress:
          _s.extractXmlBoolValue(elem, 'AbortableOperationInProgress'),
      applicationName: _s.extractXmlStringValue(elem, 'ApplicationName'),
      cname: _s.extractXmlStringValue(elem, 'CNAME'),
      dateCreated: _s.extractXmlDateTimeValue(elem, 'DateCreated'),
      dateUpdated: _s.extractXmlDateTimeValue(elem, 'DateUpdated'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      endpointURL: _s.extractXmlStringValue(elem, 'EndpointURL'),
      environmentArn: _s.extractXmlStringValue(elem, 'EnvironmentArn'),
      environmentId: _s.extractXmlStringValue(elem, 'EnvironmentId'),
      environmentLinks: _s.extractXmlChild(elem, 'EnvironmentLinks')?.let(
          (elem) => elem
              .findElements('EnvironmentLinks')
              .map((c) => EnvironmentLink.fromXml(c))
              .toList()),
      environmentName: _s.extractXmlStringValue(elem, 'EnvironmentName'),
      health: _s.extractXmlStringValue(elem, 'Health')?.toEnvironmentHealth(),
      healthStatus: _s
          .extractXmlStringValue(elem, 'HealthStatus')
          ?.toEnvironmentHealthStatus(),
      platformArn: _s.extractXmlStringValue(elem, 'PlatformArn'),
      resources: _s
          .extractXmlChild(elem, 'Resources')
          ?.let((e) => EnvironmentResourcesDescription.fromXml(e)),
      solutionStackName: _s.extractXmlStringValue(elem, 'SolutionStackName'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toEnvironmentStatus(),
      templateName: _s.extractXmlStringValue(elem, 'TemplateName'),
      tier: _s
          .extractXmlChild(elem, 'Tier')
          ?.let((e) => EnvironmentTier.fromXml(e)),
      versionLabel: _s.extractXmlStringValue(elem, 'VersionLabel'),
    );
  }
}

/// Result message containing a list of environment descriptions.
class EnvironmentDescriptionsMessage {
  /// Returns an <a>EnvironmentDescription</a> list.
  final List<EnvironmentDescription> environments;

  /// In a paginated request, the token that you can pass in a subsequent request
  /// to get the next response page.
  final String nextToken;

  EnvironmentDescriptionsMessage({
    this.environments,
    this.nextToken,
  });
  factory EnvironmentDescriptionsMessage.fromXml(_s.XmlElement elem) {
    return EnvironmentDescriptionsMessage(
      environments: _s.extractXmlChild(elem, 'Environments')?.let((elem) => elem
          .findElements('Environments')
          .map((c) => EnvironmentDescription.fromXml(c))
          .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

enum EnvironmentHealth {
  green,
  yellow,
  red,
  grey,
}

extension on String {
  EnvironmentHealth toEnvironmentHealth() {
    switch (this) {
      case 'Green':
        return EnvironmentHealth.green;
      case 'Yellow':
        return EnvironmentHealth.yellow;
      case 'Red':
        return EnvironmentHealth.red;
      case 'Grey':
        return EnvironmentHealth.grey;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum EnvironmentHealthAttribute {
  status,
  color,
  causes,
  applicationMetrics,
  instancesHealth,
  all,
  healthStatus,
  refreshedAt,
}

extension on String {
  EnvironmentHealthAttribute toEnvironmentHealthAttribute() {
    switch (this) {
      case 'Status':
        return EnvironmentHealthAttribute.status;
      case 'Color':
        return EnvironmentHealthAttribute.color;
      case 'Causes':
        return EnvironmentHealthAttribute.causes;
      case 'ApplicationMetrics':
        return EnvironmentHealthAttribute.applicationMetrics;
      case 'InstancesHealth':
        return EnvironmentHealthAttribute.instancesHealth;
      case 'All':
        return EnvironmentHealthAttribute.all;
      case 'HealthStatus':
        return EnvironmentHealthAttribute.healthStatus;
      case 'RefreshedAt':
        return EnvironmentHealthAttribute.refreshedAt;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum EnvironmentHealthStatus {
  noData,
  unknown,
  pending,
  ok,
  info,
  warning,
  degraded,
  severe,
  suspended,
}

extension on String {
  EnvironmentHealthStatus toEnvironmentHealthStatus() {
    switch (this) {
      case 'NoData':
        return EnvironmentHealthStatus.noData;
      case 'Unknown':
        return EnvironmentHealthStatus.unknown;
      case 'Pending':
        return EnvironmentHealthStatus.pending;
      case 'Ok':
        return EnvironmentHealthStatus.ok;
      case 'Info':
        return EnvironmentHealthStatus.info;
      case 'Warning':
        return EnvironmentHealthStatus.warning;
      case 'Degraded':
        return EnvironmentHealthStatus.degraded;
      case 'Severe':
        return EnvironmentHealthStatus.severe;
      case 'Suspended':
        return EnvironmentHealthStatus.suspended;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The information retrieved from the Amazon EC2 instances.
class EnvironmentInfoDescription {
  /// The Amazon EC2 Instance ID for this information.
  final String ec2InstanceId;

  /// The type of information retrieved.
  final EnvironmentInfoType infoType;

  /// The retrieved information. Currently contains a presigned Amazon S3 URL. The
  /// files are deleted after 15 minutes.
  ///
  /// Anyone in possession of this URL can access the files before they are
  /// deleted. Make the URL available only to trusted parties.
  final String message;

  /// The time stamp when this information was retrieved.
  final DateTime sampleTimestamp;

  EnvironmentInfoDescription({
    this.ec2InstanceId,
    this.infoType,
    this.message,
    this.sampleTimestamp,
  });
  factory EnvironmentInfoDescription.fromXml(_s.XmlElement elem) {
    return EnvironmentInfoDescription(
      ec2InstanceId: _s.extractXmlStringValue(elem, 'Ec2InstanceId'),
      infoType:
          _s.extractXmlStringValue(elem, 'InfoType')?.toEnvironmentInfoType(),
      message: _s.extractXmlStringValue(elem, 'Message'),
      sampleTimestamp: _s.extractXmlDateTimeValue(elem, 'SampleTimestamp'),
    );
  }
}

enum EnvironmentInfoType {
  tail,
  bundle,
}

extension on String {
  EnvironmentInfoType toEnvironmentInfoType() {
    switch (this) {
      case 'tail':
        return EnvironmentInfoType.tail;
      case 'bundle':
        return EnvironmentInfoType.bundle;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A link to another environment, defined in the environment's manifest. Links
/// provide connection information in system properties that can be used to
/// connect to another environment in the same group. See <a
/// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-cfg-manifest.html">Environment
/// Manifest (env.yaml)</a> for details.
class EnvironmentLink {
  /// The name of the linked environment (the dependency).
  final String environmentName;

  /// The name of the link.
  final String linkName;

  EnvironmentLink({
    this.environmentName,
    this.linkName,
  });
  factory EnvironmentLink.fromXml(_s.XmlElement elem) {
    return EnvironmentLink(
      environmentName: _s.extractXmlStringValue(elem, 'EnvironmentName'),
      linkName: _s.extractXmlStringValue(elem, 'LinkName'),
    );
  }
}

/// Describes the AWS resources in use by this environment. This data is live.
class EnvironmentResourceDescription {
  /// The <code>AutoScalingGroups</code> used by this environment.
  final List<AutoScalingGroup> autoScalingGroups;

  /// The name of the environment.
  final String environmentName;

  /// The Amazon EC2 instances used by this environment.
  final List<Instance> instances;

  /// The Auto Scaling launch configurations in use by this environment.
  final List<LaunchConfiguration> launchConfigurations;

  /// The Amazon EC2 launch templates in use by this environment.
  final List<LaunchTemplate> launchTemplates;

  /// The LoadBalancers in use by this environment.
  final List<LoadBalancer> loadBalancers;

  /// The queues used by this environment.
  final List<Queue> queues;

  /// The <code>AutoScaling</code> triggers in use by this environment.
  final List<Trigger> triggers;

  EnvironmentResourceDescription({
    this.autoScalingGroups,
    this.environmentName,
    this.instances,
    this.launchConfigurations,
    this.launchTemplates,
    this.loadBalancers,
    this.queues,
    this.triggers,
  });
  factory EnvironmentResourceDescription.fromXml(_s.XmlElement elem) {
    return EnvironmentResourceDescription(
      autoScalingGroups: _s.extractXmlChild(elem, 'AutoScalingGroups')?.let(
          (elem) => elem
              .findElements('AutoScalingGroups')
              .map((c) => AutoScalingGroup.fromXml(c))
              .toList()),
      environmentName: _s.extractXmlStringValue(elem, 'EnvironmentName'),
      instances: _s.extractXmlChild(elem, 'Instances')?.let((elem) => elem
          .findElements('Instances')
          .map((c) => Instance.fromXml(c))
          .toList()),
      launchConfigurations: _s
          .extractXmlChild(elem, 'LaunchConfigurations')
          ?.let((elem) => elem
              .findElements('LaunchConfigurations')
              .map((c) => LaunchConfiguration.fromXml(c))
              .toList()),
      launchTemplates: _s.extractXmlChild(elem, 'LaunchTemplates')?.let(
          (elem) => elem
              .findElements('LaunchTemplates')
              .map((c) => LaunchTemplate.fromXml(c))
              .toList()),
      loadBalancers: _s.extractXmlChild(elem, 'LoadBalancers')?.let((elem) =>
          elem
              .findElements('LoadBalancers')
              .map((c) => LoadBalancer.fromXml(c))
              .toList()),
      queues: _s.extractXmlChild(elem, 'Queues')?.let((elem) =>
          elem.findElements('Queues').map((c) => Queue.fromXml(c)).toList()),
      triggers: _s.extractXmlChild(elem, 'Triggers')?.let((elem) => elem
          .findElements('Triggers')
          .map((c) => Trigger.fromXml(c))
          .toList()),
    );
  }
}

/// Result message containing a list of environment resource descriptions.
class EnvironmentResourceDescriptionsMessage {
  /// A list of <a>EnvironmentResourceDescription</a>.
  final EnvironmentResourceDescription environmentResources;

  EnvironmentResourceDescriptionsMessage({
    this.environmentResources,
  });
  factory EnvironmentResourceDescriptionsMessage.fromXml(_s.XmlElement elem) {
    return EnvironmentResourceDescriptionsMessage(
      environmentResources: _s
          .extractXmlChild(elem, 'EnvironmentResources')
          ?.let((e) => EnvironmentResourceDescription.fromXml(e)),
    );
  }
}

/// Describes the AWS resources in use by this environment. This data is not
/// live data.
class EnvironmentResourcesDescription {
  /// Describes the LoadBalancer.
  final LoadBalancerDescription loadBalancer;

  EnvironmentResourcesDescription({
    this.loadBalancer,
  });
  factory EnvironmentResourcesDescription.fromXml(_s.XmlElement elem) {
    return EnvironmentResourcesDescription(
      loadBalancer: _s
          .extractXmlChild(elem, 'LoadBalancer')
          ?.let((e) => LoadBalancerDescription.fromXml(e)),
    );
  }
}

enum EnvironmentStatus {
  launching,
  updating,
  ready,
  terminating,
  terminated,
}

extension on String {
  EnvironmentStatus toEnvironmentStatus() {
    switch (this) {
      case 'Launching':
        return EnvironmentStatus.launching;
      case 'Updating':
        return EnvironmentStatus.updating;
      case 'Ready':
        return EnvironmentStatus.ready;
      case 'Terminating':
        return EnvironmentStatus.terminating;
      case 'Terminated':
        return EnvironmentStatus.terminated;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the properties of an environment tier
class EnvironmentTier {
  /// The name of this environment tier.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// For <i>Web server tier</i> – <code>WebServer</code>
  /// </li>
  /// <li>
  /// For <i>Worker tier</i> – <code>Worker</code>
  /// </li>
  /// </ul>
  final String name;

  /// The type of this environment tier.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// For <i>Web server tier</i> – <code>Standard</code>
  /// </li>
  /// <li>
  /// For <i>Worker tier</i> – <code>SQS/HTTP</code>
  /// </li>
  /// </ul>
  final String type;

  /// The version of this environment tier. When you don't set a value to it,
  /// Elastic Beanstalk uses the latest compatible worker tier version.
  /// <note>
  /// This member is deprecated. Any specific version that you set may become out
  /// of date. We recommend leaving it unspecified.
  /// </note>
  final String version;

  EnvironmentTier({
    this.name,
    this.type,
    this.version,
  });
  factory EnvironmentTier.fromXml(_s.XmlElement elem) {
    return EnvironmentTier(
      name: _s.extractXmlStringValue(elem, 'Name'),
      type: _s.extractXmlStringValue(elem, 'Type'),
      version: _s.extractXmlStringValue(elem, 'Version'),
    );
  }
}

/// Describes an event.
class EventDescription {
  /// The application associated with the event.
  final String applicationName;

  /// The name of the environment associated with this event.
  final String environmentName;

  /// The date when the event occurred.
  final DateTime eventDate;

  /// The event message.
  final String message;

  /// The ARN of the platform.
  final String platformArn;

  /// The web service request ID for the activity of this event.
  final String requestId;

  /// The severity level of this event.
  final EventSeverity severity;

  /// The name of the configuration associated with this event.
  final String templateName;

  /// The release label for the application version associated with this event.
  final String versionLabel;

  EventDescription({
    this.applicationName,
    this.environmentName,
    this.eventDate,
    this.message,
    this.platformArn,
    this.requestId,
    this.severity,
    this.templateName,
    this.versionLabel,
  });
  factory EventDescription.fromXml(_s.XmlElement elem) {
    return EventDescription(
      applicationName: _s.extractXmlStringValue(elem, 'ApplicationName'),
      environmentName: _s.extractXmlStringValue(elem, 'EnvironmentName'),
      eventDate: _s.extractXmlDateTimeValue(elem, 'EventDate'),
      message: _s.extractXmlStringValue(elem, 'Message'),
      platformArn: _s.extractXmlStringValue(elem, 'PlatformArn'),
      requestId: _s.extractXmlStringValue(elem, 'RequestId'),
      severity: _s.extractXmlStringValue(elem, 'Severity')?.toEventSeverity(),
      templateName: _s.extractXmlStringValue(elem, 'TemplateName'),
      versionLabel: _s.extractXmlStringValue(elem, 'VersionLabel'),
    );
  }
}

/// Result message wrapping a list of event descriptions.
class EventDescriptionsMessage {
  /// A list of <a>EventDescription</a>.
  final List<EventDescription> events;

  /// If returned, this indicates that there are more results to obtain. Use this
  /// token in the next <a>DescribeEvents</a> call to get the next batch of
  /// events.
  final String nextToken;

  EventDescriptionsMessage({
    this.events,
    this.nextToken,
  });
  factory EventDescriptionsMessage.fromXml(_s.XmlElement elem) {
    return EventDescriptionsMessage(
      events: _s.extractXmlChild(elem, 'Events')?.let((elem) => elem
          .findElements('Events')
          .map((c) => EventDescription.fromXml(c))
          .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

enum EventSeverity {
  trace,
  debug,
  info,
  warn,
  error,
  fatal,
}

extension on String {
  EventSeverity toEventSeverity() {
    switch (this) {
      case 'TRACE':
        return EventSeverity.trace;
      case 'DEBUG':
        return EventSeverity.debug;
      case 'INFO':
        return EventSeverity.info;
      case 'WARN':
        return EventSeverity.warn;
      case 'ERROR':
        return EventSeverity.error;
      case 'FATAL':
        return EventSeverity.fatal;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum FailureType {
  updateCancelled,
  cancellationFailed,
  rollbackFailed,
  rollbackSuccessful,
  internalFailure,
  invalidEnvironmentState,
  permissionsError,
}

extension on String {
  FailureType toFailureType() {
    switch (this) {
      case 'UpdateCancelled':
        return FailureType.updateCancelled;
      case 'CancellationFailed':
        return FailureType.cancellationFailed;
      case 'RollbackFailed':
        return FailureType.rollbackFailed;
      case 'RollbackSuccessful':
        return FailureType.rollbackSuccessful;
      case 'InternalFailure':
        return FailureType.internalFailure;
      case 'InvalidEnvironmentState':
        return FailureType.invalidEnvironmentState;
      case 'PermissionsError':
        return FailureType.permissionsError;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The description of an Amazon EC2 instance.
class Instance {
  /// The ID of the Amazon EC2 instance.
  final String id;

  Instance({
    this.id,
  });
  factory Instance.fromXml(_s.XmlElement elem) {
    return Instance(
      id: _s.extractXmlStringValue(elem, 'Id'),
    );
  }
}

/// Represents summary information about the health of an instance. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">Health
/// Colors and Statuses</a>.
class InstanceHealthSummary {
  /// <b>Red.</b> The health agent is reporting a high number of request failures
  /// or other issues for an instance or environment.
  final int degraded;

  /// <b>Green.</b> An operation is in progress on an instance.
  final int info;

  /// <b>Grey.</b> AWS Elastic Beanstalk and the health agent are reporting no
  /// data on an instance.
  final int noData;

  /// <b>Green.</b> An instance is passing health checks and the health agent is
  /// not reporting any problems.
  final int ok;

  /// <b>Grey.</b> An operation is in progress on an instance within the command
  /// timeout.
  final int pending;

  /// <b>Red.</b> The health agent is reporting a very high number of request
  /// failures or other issues for an instance or environment.
  final int severe;

  /// <b>Grey.</b> AWS Elastic Beanstalk and the health agent are reporting an
  /// insufficient amount of data on an instance.
  final int unknown;

  /// <b>Yellow.</b> The health agent is reporting a moderate number of request
  /// failures or other issues for an instance or environment.
  final int warning;

  InstanceHealthSummary({
    this.degraded,
    this.info,
    this.noData,
    this.ok,
    this.pending,
    this.severe,
    this.unknown,
    this.warning,
  });
  factory InstanceHealthSummary.fromXml(_s.XmlElement elem) {
    return InstanceHealthSummary(
      degraded: _s.extractXmlIntValue(elem, 'Degraded'),
      info: _s.extractXmlIntValue(elem, 'Info'),
      noData: _s.extractXmlIntValue(elem, 'NoData'),
      ok: _s.extractXmlIntValue(elem, 'Ok'),
      pending: _s.extractXmlIntValue(elem, 'Pending'),
      severe: _s.extractXmlIntValue(elem, 'Severe'),
      unknown: _s.extractXmlIntValue(elem, 'Unknown'),
      warning: _s.extractXmlIntValue(elem, 'Warning'),
    );
  }
}

enum InstancesHealthAttribute {
  healthStatus,
  color,
  causes,
  applicationMetrics,
  refreshedAt,
  launchedAt,
  system,
  deployment,
  availabilityZone,
  instanceType,
  all,
}

extension on String {
  InstancesHealthAttribute toInstancesHealthAttribute() {
    switch (this) {
      case 'HealthStatus':
        return InstancesHealthAttribute.healthStatus;
      case 'Color':
        return InstancesHealthAttribute.color;
      case 'Causes':
        return InstancesHealthAttribute.causes;
      case 'ApplicationMetrics':
        return InstancesHealthAttribute.applicationMetrics;
      case 'RefreshedAt':
        return InstancesHealthAttribute.refreshedAt;
      case 'LaunchedAt':
        return InstancesHealthAttribute.launchedAt;
      case 'System':
        return InstancesHealthAttribute.system;
      case 'Deployment':
        return InstancesHealthAttribute.deployment;
      case 'AvailabilityZone':
        return InstancesHealthAttribute.availabilityZone;
      case 'InstanceType':
        return InstancesHealthAttribute.instanceType;
      case 'All':
        return InstancesHealthAttribute.all;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the average latency for the slowest X percent of requests over
/// the last 10 seconds.
class Latency {
  /// The average latency for the slowest 90 percent of requests over the last 10
  /// seconds.
  final double p10;

  /// The average latency for the slowest 50 percent of requests over the last 10
  /// seconds.
  final double p50;

  /// The average latency for the slowest 25 percent of requests over the last 10
  /// seconds.
  final double p75;

  /// The average latency for the slowest 15 percent of requests over the last 10
  /// seconds.
  final double p85;

  /// The average latency for the slowest 10 percent of requests over the last 10
  /// seconds.
  final double p90;

  /// The average latency for the slowest 5 percent of requests over the last 10
  /// seconds.
  final double p95;

  /// The average latency for the slowest 1 percent of requests over the last 10
  /// seconds.
  final double p99;

  /// The average latency for the slowest 0.1 percent of requests over the last 10
  /// seconds.
  final double p999;

  Latency({
    this.p10,
    this.p50,
    this.p75,
    this.p85,
    this.p90,
    this.p95,
    this.p99,
    this.p999,
  });
  factory Latency.fromXml(_s.XmlElement elem) {
    return Latency(
      p10: _s.extractXmlDoubleValue(elem, 'P10'),
      p50: _s.extractXmlDoubleValue(elem, 'P50'),
      p75: _s.extractXmlDoubleValue(elem, 'P75'),
      p85: _s.extractXmlDoubleValue(elem, 'P85'),
      p90: _s.extractXmlDoubleValue(elem, 'P90'),
      p95: _s.extractXmlDoubleValue(elem, 'P95'),
      p99: _s.extractXmlDoubleValue(elem, 'P99'),
      p999: _s.extractXmlDoubleValue(elem, 'P999'),
    );
  }
}

/// Describes an Auto Scaling launch configuration.
class LaunchConfiguration {
  /// The name of the launch configuration.
  final String name;

  LaunchConfiguration({
    this.name,
  });
  factory LaunchConfiguration.fromXml(_s.XmlElement elem) {
    return LaunchConfiguration(
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }
}

/// Describes an Amazon EC2 launch template.
class LaunchTemplate {
  /// The ID of the launch template.
  final String id;

  LaunchTemplate({
    this.id,
  });
  factory LaunchTemplate.fromXml(_s.XmlElement elem) {
    return LaunchTemplate(
      id: _s.extractXmlStringValue(elem, 'Id'),
    );
  }
}

/// A list of available AWS Elastic Beanstalk solution stacks.
class ListAvailableSolutionStacksResultMessage {
  /// A list of available solution stacks and their
  /// <a>SolutionStackDescription</a>.
  final List<SolutionStackDescription> solutionStackDetails;

  /// A list of available solution stacks.
  final List<String> solutionStacks;

  ListAvailableSolutionStacksResultMessage({
    this.solutionStackDetails,
    this.solutionStacks,
  });
  factory ListAvailableSolutionStacksResultMessage.fromXml(_s.XmlElement elem) {
    return ListAvailableSolutionStacksResultMessage(
      solutionStackDetails: _s
          .extractXmlChild(elem, 'SolutionStackDetails')
          ?.let((elem) => elem
              .findElements('SolutionStackDetails')
              .map((c) => SolutionStackDescription.fromXml(c))
              .toList()),
      solutionStacks: _s.extractXmlChild(elem, 'SolutionStacks')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'SolutionStacks')),
    );
  }
}

class ListPlatformVersionsResult {
  /// The starting index into the remaining list of platforms. if this value is
  /// not <code>null</code>, you can use it in a subsequent
  /// <code>ListPlatformVersion</code> call.
  final String nextToken;

  /// Detailed information about the platforms.
  final List<PlatformSummary> platformSummaryList;

  ListPlatformVersionsResult({
    this.nextToken,
    this.platformSummaryList,
  });
  factory ListPlatformVersionsResult.fromXml(_s.XmlElement elem) {
    return ListPlatformVersionsResult(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      platformSummaryList: _s.extractXmlChild(elem, 'PlatformSummaryList')?.let(
          (elem) => elem
              .findElements('PlatformSummaryList')
              .map((c) => PlatformSummary.fromXml(c))
              .toList()),
    );
  }
}

/// Describes the properties of a Listener for the LoadBalancer.
class Listener {
  /// The port that is used by the Listener.
  final int port;

  /// The protocol that is used by the Listener.
  final String protocol;

  Listener({
    this.port,
    this.protocol,
  });
  factory Listener.fromXml(_s.XmlElement elem) {
    return Listener(
      port: _s.extractXmlIntValue(elem, 'Port'),
      protocol: _s.extractXmlStringValue(elem, 'Protocol'),
    );
  }
}

/// Describes a LoadBalancer.
class LoadBalancer {
  /// The name of the LoadBalancer.
  final String name;

  LoadBalancer({
    this.name,
  });
  factory LoadBalancer.fromXml(_s.XmlElement elem) {
    return LoadBalancer(
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }
}

/// Describes the details of a LoadBalancer.
class LoadBalancerDescription {
  /// The domain name of the LoadBalancer.
  final String domain;

  /// A list of Listeners used by the LoadBalancer.
  final List<Listener> listeners;

  /// The name of the LoadBalancer.
  final String loadBalancerName;

  LoadBalancerDescription({
    this.domain,
    this.listeners,
    this.loadBalancerName,
  });
  factory LoadBalancerDescription.fromXml(_s.XmlElement elem) {
    return LoadBalancerDescription(
      domain: _s.extractXmlStringValue(elem, 'Domain'),
      listeners: _s.extractXmlChild(elem, 'Listeners')?.let((elem) => elem
          .findElements('Listeners')
          .map((c) => Listener.fromXml(c))
          .toList()),
      loadBalancerName: _s.extractXmlStringValue(elem, 'LoadBalancerName'),
    );
  }
}

/// The record of an upcoming or in-progress managed action.
class ManagedAction {
  /// A description of the managed action.
  final String actionDescription;

  /// A unique identifier for the managed action.
  final String actionId;

  /// The type of managed action.
  final ActionType actionType;

  /// The status of the managed action. If the action is <code>Scheduled</code>,
  /// you can apply it immediately with <a>ApplyEnvironmentManagedAction</a>.
  final ActionStatus status;

  /// The start time of the maintenance window in which the managed action will
  /// execute.
  final DateTime windowStartTime;

  ManagedAction({
    this.actionDescription,
    this.actionId,
    this.actionType,
    this.status,
    this.windowStartTime,
  });
  factory ManagedAction.fromXml(_s.XmlElement elem) {
    return ManagedAction(
      actionDescription: _s.extractXmlStringValue(elem, 'ActionDescription'),
      actionId: _s.extractXmlStringValue(elem, 'ActionId'),
      actionType: _s.extractXmlStringValue(elem, 'ActionType')?.toActionType(),
      status: _s.extractXmlStringValue(elem, 'Status')?.toActionStatus(),
      windowStartTime: _s.extractXmlDateTimeValue(elem, 'WindowStartTime'),
    );
  }
}

/// The record of a completed or failed managed action.
class ManagedActionHistoryItem {
  /// A description of the managed action.
  final String actionDescription;

  /// A unique identifier for the managed action.
  final String actionId;

  /// The type of the managed action.
  final ActionType actionType;

  /// The date and time that the action started executing.
  final DateTime executedTime;

  /// If the action failed, a description of the failure.
  final String failureDescription;

  /// If the action failed, the type of failure.
  final FailureType failureType;

  /// The date and time that the action finished executing.
  final DateTime finishedTime;

  /// The status of the action.
  final ActionHistoryStatus status;

  ManagedActionHistoryItem({
    this.actionDescription,
    this.actionId,
    this.actionType,
    this.executedTime,
    this.failureDescription,
    this.failureType,
    this.finishedTime,
    this.status,
  });
  factory ManagedActionHistoryItem.fromXml(_s.XmlElement elem) {
    return ManagedActionHistoryItem(
      actionDescription: _s.extractXmlStringValue(elem, 'ActionDescription'),
      actionId: _s.extractXmlStringValue(elem, 'ActionId'),
      actionType: _s.extractXmlStringValue(elem, 'ActionType')?.toActionType(),
      executedTime: _s.extractXmlDateTimeValue(elem, 'ExecutedTime'),
      failureDescription: _s.extractXmlStringValue(elem, 'FailureDescription'),
      failureType:
          _s.extractXmlStringValue(elem, 'FailureType')?.toFailureType(),
      finishedTime: _s.extractXmlDateTimeValue(elem, 'FinishedTime'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toActionHistoryStatus(),
    );
  }
}

/// A lifecycle rule that deletes application versions after the specified
/// number of days.
class MaxAgeRule {
  /// Specify <code>true</code> to apply the rule, or <code>false</code> to
  /// disable it.
  final bool enabled;

  /// Set to <code>true</code> to delete a version's source bundle from Amazon S3
  /// when Elastic Beanstalk deletes the application version.
  final bool deleteSourceFromS3;

  /// Specify the number of days to retain an application versions.
  final int maxAgeInDays;

  MaxAgeRule({
    @_s.required this.enabled,
    this.deleteSourceFromS3,
    this.maxAgeInDays,
  });
  factory MaxAgeRule.fromXml(_s.XmlElement elem) {
    return MaxAgeRule(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      deleteSourceFromS3: _s.extractXmlBoolValue(elem, 'DeleteSourceFromS3'),
      maxAgeInDays: _s.extractXmlIntValue(elem, 'MaxAgeInDays'),
    );
  }
}

/// A lifecycle rule that deletes the oldest application version when the
/// maximum count is exceeded.
class MaxCountRule {
  /// Specify <code>true</code> to apply the rule, or <code>false</code> to
  /// disable it.
  final bool enabled;

  /// Set to <code>true</code> to delete a version's source bundle from Amazon S3
  /// when Elastic Beanstalk deletes the application version.
  final bool deleteSourceFromS3;

  /// Specify the maximum number of application versions to retain.
  final int maxCount;

  MaxCountRule({
    @_s.required this.enabled,
    this.deleteSourceFromS3,
    this.maxCount,
  });
  factory MaxCountRule.fromXml(_s.XmlElement elem) {
    return MaxCountRule(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      deleteSourceFromS3: _s.extractXmlBoolValue(elem, 'DeleteSourceFromS3'),
      maxCount: _s.extractXmlIntValue(elem, 'MaxCount'),
    );
  }
}

/// A regular expression representing a restriction on a string configuration
/// option value.
class OptionRestrictionRegex {
  /// A unique name representing this regular expression.
  final String label;

  /// The regular expression pattern that a string configuration option value with
  /// this restriction must match.
  final String pattern;

  OptionRestrictionRegex({
    this.label,
    this.pattern,
  });
  factory OptionRestrictionRegex.fromXml(_s.XmlElement elem) {
    return OptionRestrictionRegex(
      label: _s.extractXmlStringValue(elem, 'Label'),
      pattern: _s.extractXmlStringValue(elem, 'Pattern'),
    );
  }
}

/// A specification identifying an individual configuration option.
class OptionSpecification {
  /// A unique namespace identifying the option's associated AWS resource.
  final String namespace;

  /// The name of the configuration option.
  final String optionName;

  /// A unique resource name for a time-based scaling configuration option.
  final String resourceName;

  OptionSpecification({
    this.namespace,
    this.optionName,
    this.resourceName,
  });
}

/// Detailed information about a platform.
class PlatformDescription {
  /// The custom AMIs supported by the platform.
  final List<CustomAmi> customAmiList;

  /// The date when the platform was created.
  final DateTime dateCreated;

  /// The date when the platform was last updated.
  final DateTime dateUpdated;

  /// The description of the platform.
  final String description;

  /// The frameworks supported by the platform.
  final List<PlatformFramework> frameworks;

  /// Information about the maintainer of the platform.
  final String maintainer;

  /// The operating system used by the platform.
  final String operatingSystemName;

  /// The version of the operating system used by the platform.
  final String operatingSystemVersion;

  /// The ARN of the platform.
  final String platformArn;

  /// The category of the platform.
  final String platformCategory;

  /// The name of the platform.
  final String platformName;

  /// The AWS account ID of the person who created the platform.
  final String platformOwner;

  /// The status of the platform.
  final PlatformStatus platformStatus;

  /// The version of the platform.
  final String platformVersion;

  /// The programming languages supported by the platform.
  final List<PlatformProgrammingLanguage> programmingLanguages;

  /// The name of the solution stack used by the platform.
  final String solutionStackName;

  /// The additions supported by the platform.
  final List<String> supportedAddonList;

  /// The tiers supported by the platform.
  final List<String> supportedTierList;

  PlatformDescription({
    this.customAmiList,
    this.dateCreated,
    this.dateUpdated,
    this.description,
    this.frameworks,
    this.maintainer,
    this.operatingSystemName,
    this.operatingSystemVersion,
    this.platformArn,
    this.platformCategory,
    this.platformName,
    this.platformOwner,
    this.platformStatus,
    this.platformVersion,
    this.programmingLanguages,
    this.solutionStackName,
    this.supportedAddonList,
    this.supportedTierList,
  });
  factory PlatformDescription.fromXml(_s.XmlElement elem) {
    return PlatformDescription(
      customAmiList: _s.extractXmlChild(elem, 'CustomAmiList')?.let((elem) =>
          elem
              .findElements('CustomAmiList')
              .map((c) => CustomAmi.fromXml(c))
              .toList()),
      dateCreated: _s.extractXmlDateTimeValue(elem, 'DateCreated'),
      dateUpdated: _s.extractXmlDateTimeValue(elem, 'DateUpdated'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      frameworks: _s.extractXmlChild(elem, 'Frameworks')?.let((elem) => elem
          .findElements('Frameworks')
          .map((c) => PlatformFramework.fromXml(c))
          .toList()),
      maintainer: _s.extractXmlStringValue(elem, 'Maintainer'),
      operatingSystemName:
          _s.extractXmlStringValue(elem, 'OperatingSystemName'),
      operatingSystemVersion:
          _s.extractXmlStringValue(elem, 'OperatingSystemVersion'),
      platformArn: _s.extractXmlStringValue(elem, 'PlatformArn'),
      platformCategory: _s.extractXmlStringValue(elem, 'PlatformCategory'),
      platformName: _s.extractXmlStringValue(elem, 'PlatformName'),
      platformOwner: _s.extractXmlStringValue(elem, 'PlatformOwner'),
      platformStatus:
          _s.extractXmlStringValue(elem, 'PlatformStatus')?.toPlatformStatus(),
      platformVersion: _s.extractXmlStringValue(elem, 'PlatformVersion'),
      programmingLanguages: _s
          .extractXmlChild(elem, 'ProgrammingLanguages')
          ?.let((elem) => elem
              .findElements('ProgrammingLanguages')
              .map((c) => PlatformProgrammingLanguage.fromXml(c))
              .toList()),
      solutionStackName: _s.extractXmlStringValue(elem, 'SolutionStackName'),
      supportedAddonList: _s.extractXmlChild(elem, 'SupportedAddonList')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'SupportedAddonList')),
      supportedTierList: _s.extractXmlChild(elem, 'SupportedTierList')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'SupportedTierList')),
    );
  }
}

/// Specify criteria to restrict the results when listing custom platforms.
///
/// The filter is evaluated as the expression:
///
/// <code>Type</code> <code>Operator</code> <code>Values[i]</code>
class PlatformFilter {
  /// The operator to apply to the <code>Type</code> with each of the
  /// <code>Values</code>.
  ///
  /// Valid Values: <code>=</code> (equal to) | <code>!=</code> (not equal to) |
  /// <code>&lt;</code> (less than) | <code>&lt;=</code> (less than or equal to) |
  /// <code>&gt;</code> (greater than) | <code>&gt;=</code> (greater than or equal
  /// to) | <code>contains</code> | <code>begins_with</code> |
  /// <code>ends_with</code>
  final String operator;

  /// The custom platform attribute to which the filter values are applied.
  ///
  /// Valid Values: <code>PlatformName</code> | <code>PlatformVersion</code> |
  /// <code>PlatformStatus</code> | <code>PlatformOwner</code>
  final String type;

  /// The list of values applied to the custom platform attribute.
  final List<String> values;

  PlatformFilter({
    this.operator,
    this.type,
    this.values,
  });
}

/// A framework supported by the custom platform.
class PlatformFramework {
  /// The name of the framework.
  final String name;

  /// The version of the framework.
  final String version;

  PlatformFramework({
    this.name,
    this.version,
  });
  factory PlatformFramework.fromXml(_s.XmlElement elem) {
    return PlatformFramework(
      name: _s.extractXmlStringValue(elem, 'Name'),
      version: _s.extractXmlStringValue(elem, 'Version'),
    );
  }
}

/// A programming language supported by the platform.
class PlatformProgrammingLanguage {
  /// The name of the programming language.
  final String name;

  /// The version of the programming language.
  final String version;

  PlatformProgrammingLanguage({
    this.name,
    this.version,
  });
  factory PlatformProgrammingLanguage.fromXml(_s.XmlElement elem) {
    return PlatformProgrammingLanguage(
      name: _s.extractXmlStringValue(elem, 'Name'),
      version: _s.extractXmlStringValue(elem, 'Version'),
    );
  }
}

enum PlatformStatus {
  creating,
  failed,
  ready,
  deleting,
  deleted,
}

extension on String {
  PlatformStatus toPlatformStatus() {
    switch (this) {
      case 'Creating':
        return PlatformStatus.creating;
      case 'Failed':
        return PlatformStatus.failed;
      case 'Ready':
        return PlatformStatus.ready;
      case 'Deleting':
        return PlatformStatus.deleting;
      case 'Deleted':
        return PlatformStatus.deleted;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Detailed information about a platform.
class PlatformSummary {
  /// The operating system used by the platform.
  final String operatingSystemName;

  /// The version of the operating system used by the platform.
  final String operatingSystemVersion;

  /// The ARN of the platform.
  final String platformArn;

  /// The category of platform.
  final String platformCategory;

  /// The AWS account ID of the person who created the platform.
  final String platformOwner;

  /// The status of the platform. You can create an environment from the platform
  /// once it is ready.
  final PlatformStatus platformStatus;

  /// The additions associated with the platform.
  final List<String> supportedAddonList;

  /// The tiers in which the platform runs.
  final List<String> supportedTierList;

  PlatformSummary({
    this.operatingSystemName,
    this.operatingSystemVersion,
    this.platformArn,
    this.platformCategory,
    this.platformOwner,
    this.platformStatus,
    this.supportedAddonList,
    this.supportedTierList,
  });
  factory PlatformSummary.fromXml(_s.XmlElement elem) {
    return PlatformSummary(
      operatingSystemName:
          _s.extractXmlStringValue(elem, 'OperatingSystemName'),
      operatingSystemVersion:
          _s.extractXmlStringValue(elem, 'OperatingSystemVersion'),
      platformArn: _s.extractXmlStringValue(elem, 'PlatformArn'),
      platformCategory: _s.extractXmlStringValue(elem, 'PlatformCategory'),
      platformOwner: _s.extractXmlStringValue(elem, 'PlatformOwner'),
      platformStatus:
          _s.extractXmlStringValue(elem, 'PlatformStatus')?.toPlatformStatus(),
      supportedAddonList: _s.extractXmlChild(elem, 'SupportedAddonList')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'SupportedAddonList')),
      supportedTierList: _s.extractXmlChild(elem, 'SupportedTierList')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'SupportedTierList')),
    );
  }
}

/// Describes a queue.
class Queue {
  /// The name of the queue.
  final String name;

  /// The URL of the queue.
  final String url;

  Queue({
    this.name,
    this.url,
  });
  factory Queue.fromXml(_s.XmlElement elem) {
    return Queue(
      name: _s.extractXmlStringValue(elem, 'Name'),
      url: _s.extractXmlStringValue(elem, 'URL'),
    );
  }
}

/// The AWS Elastic Beanstalk quota information for a single resource type in an
/// AWS account. It reflects the resource's limits for this account.
class ResourceQuota {
  /// The maximum number of instances of this Elastic Beanstalk resource type that
  /// an AWS account can use.
  final int maximum;

  ResourceQuota({
    this.maximum,
  });
  factory ResourceQuota.fromXml(_s.XmlElement elem) {
    return ResourceQuota(
      maximum: _s.extractXmlIntValue(elem, 'Maximum'),
    );
  }
}

/// A set of per-resource AWS Elastic Beanstalk quotas associated with an AWS
/// account. They reflect Elastic Beanstalk resource limits for this account.
class ResourceQuotas {
  /// The quota for applications in the AWS account.
  final ResourceQuota applicationQuota;

  /// The quota for application versions in the AWS account.
  final ResourceQuota applicationVersionQuota;

  /// The quota for configuration templates in the AWS account.
  final ResourceQuota configurationTemplateQuota;

  /// The quota for custom platforms in the AWS account.
  final ResourceQuota customPlatformQuota;

  /// The quota for environments in the AWS account.
  final ResourceQuota environmentQuota;

  ResourceQuotas({
    this.applicationQuota,
    this.applicationVersionQuota,
    this.configurationTemplateQuota,
    this.customPlatformQuota,
    this.environmentQuota,
  });
  factory ResourceQuotas.fromXml(_s.XmlElement elem) {
    return ResourceQuotas(
      applicationQuota: _s
          .extractXmlChild(elem, 'ApplicationQuota')
          ?.let((e) => ResourceQuota.fromXml(e)),
      applicationVersionQuota: _s
          .extractXmlChild(elem, 'ApplicationVersionQuota')
          ?.let((e) => ResourceQuota.fromXml(e)),
      configurationTemplateQuota: _s
          .extractXmlChild(elem, 'ConfigurationTemplateQuota')
          ?.let((e) => ResourceQuota.fromXml(e)),
      customPlatformQuota: _s
          .extractXmlChild(elem, 'CustomPlatformQuota')
          ?.let((e) => ResourceQuota.fromXml(e)),
      environmentQuota: _s
          .extractXmlChild(elem, 'EnvironmentQuota')
          ?.let((e) => ResourceQuota.fromXml(e)),
    );
  }
}

class ResourceTagsDescriptionMessage {
  /// The Amazon Resource Name (ARN) of the resouce for which a tag list was
  /// requested.
  final String resourceArn;

  /// A list of tag key-value pairs.
  final List<Tag> resourceTags;

  ResourceTagsDescriptionMessage({
    this.resourceArn,
    this.resourceTags,
  });
  factory ResourceTagsDescriptionMessage.fromXml(_s.XmlElement elem) {
    return ResourceTagsDescriptionMessage(
      resourceArn: _s.extractXmlStringValue(elem, 'ResourceArn'),
      resourceTags: _s.extractXmlChild(elem, 'ResourceTags')?.let((elem) => elem
          .findElements('ResourceTags')
          .map((c) => Tag.fromXml(c))
          .toList()),
    );
  }
}

/// Result message containing a description of the requested environment info.
class RetrieveEnvironmentInfoResultMessage {
  /// The <a>EnvironmentInfoDescription</a> of the environment.
  final List<EnvironmentInfoDescription> environmentInfo;

  RetrieveEnvironmentInfoResultMessage({
    this.environmentInfo,
  });
  factory RetrieveEnvironmentInfoResultMessage.fromXml(_s.XmlElement elem) {
    return RetrieveEnvironmentInfoResultMessage(
      environmentInfo: _s.extractXmlChild(elem, 'EnvironmentInfo')?.let(
          (elem) => elem
              .findElements('EnvironmentInfo')
              .map((c) => EnvironmentInfoDescription.fromXml(c))
              .toList()),
    );
  }
}

/// The bucket and key of an item stored in Amazon S3.
class S3Location {
  /// The Amazon S3 bucket where the data is located.
  final String s3Bucket;

  /// The Amazon S3 key where the data is located.
  final String s3Key;

  S3Location({
    this.s3Bucket,
    this.s3Key,
  });
  factory S3Location.fromXml(_s.XmlElement elem) {
    return S3Location(
      s3Bucket: _s.extractXmlStringValue(elem, 'S3Bucket'),
      s3Key: _s.extractXmlStringValue(elem, 'S3Key'),
    );
  }
}

/// Detailed health information about an Amazon EC2 instance in your Elastic
/// Beanstalk environment.
class SingleInstanceHealth {
  /// Request metrics from your application.
  final ApplicationMetrics applicationMetrics;

  /// The availability zone in which the instance runs.
  final String availabilityZone;

  /// Represents the causes, which provide more information about the current
  /// health status.
  final List<String> causes;

  /// Represents the color indicator that gives you information about the health
  /// of the EC2 instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">Health
  /// Colors and Statuses</a>.
  final String color;

  /// Information about the most recent deployment to an instance.
  final Deployment deployment;

  /// Returns the health status of the specified instance. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-status.html">Health
  /// Colors and Statuses</a>.
  final String healthStatus;

  /// The ID of the Amazon EC2 instance.
  final String instanceId;

  /// The instance's type.
  final String instanceType;

  /// The time at which the EC2 instance was launched.
  final DateTime launchedAt;

  /// Operating system metrics from the instance.
  final SystemStatus system;

  SingleInstanceHealth({
    this.applicationMetrics,
    this.availabilityZone,
    this.causes,
    this.color,
    this.deployment,
    this.healthStatus,
    this.instanceId,
    this.instanceType,
    this.launchedAt,
    this.system,
  });
  factory SingleInstanceHealth.fromXml(_s.XmlElement elem) {
    return SingleInstanceHealth(
      applicationMetrics: _s
          .extractXmlChild(elem, 'ApplicationMetrics')
          ?.let((e) => ApplicationMetrics.fromXml(e)),
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      causes: _s
          .extractXmlChild(elem, 'Causes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Causes')),
      color: _s.extractXmlStringValue(elem, 'Color'),
      deployment: _s
          .extractXmlChild(elem, 'Deployment')
          ?.let((e) => Deployment.fromXml(e)),
      healthStatus: _s.extractXmlStringValue(elem, 'HealthStatus'),
      instanceId: _s.extractXmlStringValue(elem, 'InstanceId'),
      instanceType: _s.extractXmlStringValue(elem, 'InstanceType'),
      launchedAt: _s.extractXmlDateTimeValue(elem, 'LaunchedAt'),
      system: _s
          .extractXmlChild(elem, 'System')
          ?.let((e) => SystemStatus.fromXml(e)),
    );
  }
}

/// Describes the solution stack.
class SolutionStackDescription {
  /// The permitted file types allowed for a solution stack.
  final List<String> permittedFileTypes;

  /// The name of the solution stack.
  final String solutionStackName;

  SolutionStackDescription({
    this.permittedFileTypes,
    this.solutionStackName,
  });
  factory SolutionStackDescription.fromXml(_s.XmlElement elem) {
    return SolutionStackDescription(
      permittedFileTypes: _s.extractXmlChild(elem, 'PermittedFileTypes')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'PermittedFileTypes')),
      solutionStackName: _s.extractXmlStringValue(elem, 'SolutionStackName'),
    );
  }
}

/// Location of the source code for an application version.
class SourceBuildInformation {
  /// The location of the source code, as a formatted string, depending on the
  /// value of <code>SourceRepository</code>
  ///
  /// <ul>
  /// <li>
  /// For <code>CodeCommit</code>, the format is the repository name and commit
  /// ID, separated by a forward slash. For example,
  /// <code>my-git-repo/265cfa0cf6af46153527f55d6503ec030551f57a</code>.
  /// </li>
  /// <li>
  /// For <code>S3</code>, the format is the S3 bucket name and object key,
  /// separated by a forward slash. For example,
  /// <code>my-s3-bucket/Folders/my-source-file</code>.
  /// </li>
  /// </ul>
  final String sourceLocation;

  /// Location where the repository is stored.
  ///
  /// <ul>
  /// <li>
  /// <code>CodeCommit</code>
  /// </li>
  /// <li>
  /// <code>S3</code>
  /// </li>
  /// </ul>
  final SourceRepository sourceRepository;

  /// The type of repository.
  ///
  /// <ul>
  /// <li>
  /// <code>Git</code>
  /// </li>
  /// <li>
  /// <code>Zip</code>
  /// </li>
  /// </ul>
  final SourceType sourceType;

  SourceBuildInformation({
    @_s.required this.sourceLocation,
    @_s.required this.sourceRepository,
    @_s.required this.sourceType,
  });
  factory SourceBuildInformation.fromXml(_s.XmlElement elem) {
    return SourceBuildInformation(
      sourceLocation: _s.extractXmlStringValue(elem, 'SourceLocation'),
      sourceRepository: _s
          .extractXmlStringValue(elem, 'SourceRepository')
          ?.toSourceRepository(),
      sourceType: _s.extractXmlStringValue(elem, 'SourceType')?.toSourceType(),
    );
  }
}

/// A specification for an environment configuration
class SourceConfiguration {
  /// The name of the application associated with the configuration.
  final String applicationName;

  /// The name of the configuration template.
  final String templateName;

  SourceConfiguration({
    this.applicationName,
    this.templateName,
  });
}

enum SourceRepository {
  codeCommit,
  s3,
}

extension on String {
  SourceRepository toSourceRepository() {
    switch (this) {
      case 'CodeCommit':
        return SourceRepository.codeCommit;
      case 'S3':
        return SourceRepository.s3;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum SourceType {
  git,
  zip,
}

extension on String {
  SourceType toSourceType() {
    switch (this) {
      case 'Git':
        return SourceType.git;
      case 'Zip':
        return SourceType.zip;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the percentage of requests over the last 10 seconds that resulted
/// in each type of status code response. For more information, see <a
/// href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html">Status Code
/// Definitions</a>.
class StatusCodes {
  /// The percentage of requests over the last 10 seconds that resulted in a 2xx
  /// (200, 201, etc.) status code.
  final int status2xx;

  /// The percentage of requests over the last 10 seconds that resulted in a 3xx
  /// (300, 301, etc.) status code.
  final int status3xx;

  /// The percentage of requests over the last 10 seconds that resulted in a 4xx
  /// (400, 401, etc.) status code.
  final int status4xx;

  /// The percentage of requests over the last 10 seconds that resulted in a 5xx
  /// (500, 501, etc.) status code.
  final int status5xx;

  StatusCodes({
    this.status2xx,
    this.status3xx,
    this.status4xx,
    this.status5xx,
  });
  factory StatusCodes.fromXml(_s.XmlElement elem) {
    return StatusCodes(
      status2xx: _s.extractXmlIntValue(elem, 'Status2xx'),
      status3xx: _s.extractXmlIntValue(elem, 'Status3xx'),
      status4xx: _s.extractXmlIntValue(elem, 'Status4xx'),
      status5xx: _s.extractXmlIntValue(elem, 'Status5xx'),
    );
  }
}

/// CPU utilization and load average metrics for an Amazon EC2 instance.
class SystemStatus {
  /// CPU utilization metrics for the instance.
  final CPUUtilization cPUUtilization;

  /// Load average in the last 1-minute, 5-minute, and 15-minute periods. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced-metrics.html#health-enhanced-metrics-os">Operating
  /// System Metrics</a>.
  final List<double> loadAverage;

  SystemStatus({
    this.cPUUtilization,
    this.loadAverage,
  });
  factory SystemStatus.fromXml(_s.XmlElement elem) {
    return SystemStatus(
      cPUUtilization: _s
          .extractXmlChild(elem, 'CPUUtilization')
          ?.let((e) => CPUUtilization.fromXml(e)),
      loadAverage: _s
          .extractXmlChild(elem, 'LoadAverage')
          ?.let((elem) => _s.extractXmlDoubleListValues(elem, 'LoadAverage')),
    );
  }
}

/// Describes a tag applied to a resource in an environment.
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
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
}

/// Describes a trigger.
class Trigger {
  /// The name of the trigger.
  final String name;

  Trigger({
    this.name,
  });
  factory Trigger.fromXml(_s.XmlElement elem) {
    return Trigger(
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }
}

/// An error or warning for a desired configuration option value.
class ValidationMessage {
  /// A message describing the error or warning.
  final String message;

  /// The namespace to which the option belongs.
  final String namespace;

  /// The name of the option.
  final String optionName;

  /// An indication of the severity of this message:
  ///
  /// <ul>
  /// <li>
  /// <code>error</code>: This message indicates that this is not a valid setting
  /// for an option.
  /// </li>
  /// <li>
  /// <code>warning</code>: This message is providing information you should take
  /// into account.
  /// </li>
  /// </ul>
  final ValidationSeverity severity;

  ValidationMessage({
    this.message,
    this.namespace,
    this.optionName,
    this.severity,
  });
  factory ValidationMessage.fromXml(_s.XmlElement elem) {
    return ValidationMessage(
      message: _s.extractXmlStringValue(elem, 'Message'),
      namespace: _s.extractXmlStringValue(elem, 'Namespace'),
      optionName: _s.extractXmlStringValue(elem, 'OptionName'),
      severity:
          _s.extractXmlStringValue(elem, 'Severity')?.toValidationSeverity(),
    );
  }
}

enum ValidationSeverity {
  error,
  warning,
}

extension on String {
  ValidationSeverity toValidationSeverity() {
    switch (this) {
      case 'error':
        return ValidationSeverity.error;
      case 'warning':
        return ValidationSeverity.warning;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class CodeBuildNotInServiceRegionException extends _s.GenericAwsException {
  CodeBuildNotInServiceRegionException({String type, String message})
      : super(
            type: type,
            code: 'CodeBuildNotInServiceRegionException',
            message: message);
}

class ElasticBeanstalkServiceException extends _s.GenericAwsException {
  ElasticBeanstalkServiceException({String type, String message})
      : super(
            type: type,
            code: 'ElasticBeanstalkServiceException',
            message: message);
}

class InsufficientPrivilegesException extends _s.GenericAwsException {
  InsufficientPrivilegesException({String type, String message})
      : super(
            type: type,
            code: 'InsufficientPrivilegesException',
            message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class ManagedActionInvalidStateException extends _s.GenericAwsException {
  ManagedActionInvalidStateException({String type, String message})
      : super(
            type: type,
            code: 'ManagedActionInvalidStateException',
            message: message);
}

class OperationInProgressException extends _s.GenericAwsException {
  OperationInProgressException({String type, String message})
      : super(
            type: type, code: 'OperationInProgressException', message: message);
}

class PlatformVersionStillReferencedException extends _s.GenericAwsException {
  PlatformVersionStillReferencedException({String type, String message})
      : super(
            type: type,
            code: 'PlatformVersionStillReferencedException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceTypeNotSupportedException extends _s.GenericAwsException {
  ResourceTypeNotSupportedException({String type, String message})
      : super(
            type: type,
            code: 'ResourceTypeNotSupportedException',
            message: message);
}

class S3LocationNotInServiceRegionException extends _s.GenericAwsException {
  S3LocationNotInServiceRegionException({String type, String message})
      : super(
            type: type,
            code: 'S3LocationNotInServiceRegionException',
            message: message);
}

class S3SubscriptionRequiredException extends _s.GenericAwsException {
  S3SubscriptionRequiredException({String type, String message})
      : super(
            type: type,
            code: 'S3SubscriptionRequiredException',
            message: message);
}

class SourceBundleDeletionException extends _s.GenericAwsException {
  SourceBundleDeletionException({String type, String message})
      : super(
            type: type,
            code: 'SourceBundleDeletionException',
            message: message);
}

class TooManyApplicationVersionsException extends _s.GenericAwsException {
  TooManyApplicationVersionsException({String type, String message})
      : super(
            type: type,
            code: 'TooManyApplicationVersionsException',
            message: message);
}

class TooManyApplicationsException extends _s.GenericAwsException {
  TooManyApplicationsException({String type, String message})
      : super(
            type: type, code: 'TooManyApplicationsException', message: message);
}

class TooManyBucketsException extends _s.GenericAwsException {
  TooManyBucketsException({String type, String message})
      : super(type: type, code: 'TooManyBucketsException', message: message);
}

class TooManyConfigurationTemplatesException extends _s.GenericAwsException {
  TooManyConfigurationTemplatesException({String type, String message})
      : super(
            type: type,
            code: 'TooManyConfigurationTemplatesException',
            message: message);
}

class TooManyEnvironmentsException extends _s.GenericAwsException {
  TooManyEnvironmentsException({String type, String message})
      : super(
            type: type, code: 'TooManyEnvironmentsException', message: message);
}

class TooManyPlatformsException extends _s.GenericAwsException {
  TooManyPlatformsException({String type, String message})
      : super(type: type, code: 'TooManyPlatformsException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'CodeBuildNotInServiceRegionException': (type, message) =>
      CodeBuildNotInServiceRegionException(type: type, message: message),
  'ElasticBeanstalkServiceException': (type, message) =>
      ElasticBeanstalkServiceException(type: type, message: message),
  'InsufficientPrivilegesException': (type, message) =>
      InsufficientPrivilegesException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'ManagedActionInvalidStateException': (type, message) =>
      ManagedActionInvalidStateException(type: type, message: message),
  'OperationInProgressException': (type, message) =>
      OperationInProgressException(type: type, message: message),
  'PlatformVersionStillReferencedException': (type, message) =>
      PlatformVersionStillReferencedException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceTypeNotSupportedException': (type, message) =>
      ResourceTypeNotSupportedException(type: type, message: message),
  'S3LocationNotInServiceRegionException': (type, message) =>
      S3LocationNotInServiceRegionException(type: type, message: message),
  'S3SubscriptionRequiredException': (type, message) =>
      S3SubscriptionRequiredException(type: type, message: message),
  'SourceBundleDeletionException': (type, message) =>
      SourceBundleDeletionException(type: type, message: message),
  'TooManyApplicationVersionsException': (type, message) =>
      TooManyApplicationVersionsException(type: type, message: message),
  'TooManyApplicationsException': (type, message) =>
      TooManyApplicationsException(type: type, message: message),
  'TooManyBucketsException': (type, message) =>
      TooManyBucketsException(type: type, message: message),
  'TooManyConfigurationTemplatesException': (type, message) =>
      TooManyConfigurationTemplatesException(type: type, message: message),
  'TooManyEnvironmentsException': (type, message) =>
      TooManyEnvironmentsException(type: type, message: message),
  'TooManyPlatformsException': (type, message) =>
      TooManyPlatformsException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
};
