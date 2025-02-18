## terraform-aws-tardigrade-s3-bucket Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).

### 5.0.1

**Released**: 2025.02.18

**Commit Delta**: [Change from 5.0.0 release](https://github.com/plus3it/terraform-aws-tardigrade-s3-bucket/compare/5.0.0...5.0.1)

**Summary**:

*   Fixes bug for the `sse_kms_encrypted_objects` status in `replication_configuration` variable

### 5.0.0

**Released**: 2022.04.26

**Commit Delta**: [Change from 4.3.1 release](https://github.com/plus3it/terraform-aws-tardigrade-s3-bucket/compare/4.3.1...5.0.0)

**Summary**:

*   Supports AWS Provider v4
*   Implements the new model using separate resources for all s3 bucket features
*   Uses objects for all s3 bucket features to support all feature arguments

### 3.0.0

**Released**: 2020.08.07

**Commit Delta**: [Change from 2.0.0 release](https://github.com/plus3it/terraform-aws-tardigrade-s3-bucket/compare/2.0.0...3.0.0)

**Summary**:

*   Removes region variable due to removal from resource in v3.0 of AWS provider

### 2.0.0

**Released**: 2020.01.03

**Commit Delta**: [Change from 1.1.1 release](https://github.com/plus3it/terraform-aws-tardigrade-s3-bucket/compare/1.1.1...2.0.0)

**Summary**:

*   Outputs the entire bucket object instead of individual attributes

### 1.1.1

**Released**: 2020.01.03

**Commit Delta**: [Change from 1.1.0 release](https://github.com/plus3it/terraform-aws-tardigrade-s3-bucket/compare/1.1.0...1.1.1)

**Summary**:

*   Gets bucket region from the caller by default

### 1.1.0

**Released**: 2020.01.03

**Commit Delta**: [Change from 1.0.4 release](https://github.com/plus3it/terraform-aws-tardigrade-s3-bucket/compare/1.0.4...1.1.0)

**Summary**:

*   Manages the public block policy for the s3 bucket

### 1.0.4

**Released**: 2019.11.07

**Commit Delta**: [Change from 1.0.3 release](https://github.com/plus3it/terraform-aws-tardigrade-s3-bucket/compare/1.0.3...1.0.4)

**Summary**:

*   Testing framework now checks if "*.tf" files exist within the directory before attempting to run the test

### 1.0.3

**Released**: 2019.11.07

**Commit Delta**: [Change from 1.0.2 release](https://github.com/plus3it/terraform-aws-tardigrade-s3-bucket/compare/1.0.2...1.0.3)

**Summary**:

*   Add force_destroy option to prevent errors when trying to destroy the bucket

### 1.0.2

**Released**: 2019.10.28

**Commit Delta**: [Change from 1.0.1 release](https://github.com/plus3it/terraform-aws-tardigrade-s3-bucket/compare/1.0.1...1.0.2)

**Summary**:

*   Pins tfdocs-awk version
*   Updates documentation generation make targets
*   Adds documentation to the test modules

### 1.0.1

**Released**: 2019.10.03

**Commit Delta**: [Change from 1.0.0 release](https://github.com/plus3it/terraform-aws-tardigrade-s3-bucket/compare/1.0.0...1.0.1)

**Summary**:

*   Update testing harness to have a more user-friendly output
*   Update terratest dependencies

### 1.0.0

**Released**: 2019.09.11

**Commit Delta**: [Change from 0.0.0 release](https://github.com/plus3it/terraform-aws-tardigrade-s3-bucket/compare/0.0.0...1.0.0)

**Summary**:

*   Upgrade to terraform 0.12.x
*   Add test cases

### 0.0.0

**Commit Delta**: N/A

**Released**: 2019.08.21

**Summary**:

*   Initial release!
