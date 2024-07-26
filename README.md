# SAN-Workshop-2024---SANS CloudSecNext Summit 2024
# Terraform OPA Governance

This Repository contains Open Agent Policy(OPA) which is an open source, general-purpose policy engine that enables unified, context-aware policy enforcement across the entire environment.
Ths repository will enable fine-grained, logic-based policy decisions that can be extended to source external information to make decisions. This repository will be use for training purposes, it 
contain the creation of the OPA Policy as Code for the participants at the SANS CloudSecNext Summit 2024. 

OPA ensures the first time a Terraform code is deployed its in the best possible security state and allows track teams and development pipelines to work quickly without delay and ensure the code is as secure as possible the first time.

# Using Conftest
[Conftest](https://www.conftest.dev/) is a utility to help you write tests against structured configuration data. Here are some of the commands to use conftest.

> **Conftest will be used to verify the input json (for e.g. terraform plan) to validate the configuration against the rules. All rules must be starting with warn_<rule_name> (for advisory policy) and deny_<rule_name> for the mandatory policy.**

*Always add metadata to the rules before pushing to this repo ([example](https://github.com/terraform-opa-governance/blob/main/aws/kms/kms_key_deletion_window_30_days/kms_key_deletion_window_30_days.rego#L9-L29))*

Below are some of the reference commands:-

To [install conftest](https://www.conftest.dev/install/):-
```bash
brew install conftest
```

To format the files:-
```bash
conftest fmt <PATH>
```

To verify the policy:-
```bash
conftest test --all-namespaces <PATH_TO_PASS_OR_FAIL_JSON_File>
```

To run the policy tests (this will check all the *_test.rego files for tests):-
```bash
conftest verify <path-to-root-directory> --report notes
```

## Generating Terraform JSON Output

```bash
terraform init
terraform plan --out tfplan.binary
terraform show -json tfplan.binary > tfplan.json
```

## OPA Policy Folder Structure

The file and directory structure within this repository has been designed to have
a ROOT directory and then it goes to the basic level of Policy, Cloud Provider Name
category and then finally policy and the name of the policy.
OPA Policies are configured to the two enforcement levels of deny and warn which gives the
flexibility to ensure we can remove and update policies in real-time with no
interruption of services or deployments within the CX Organization.

```ruby
.
└── ROOT - DIR
    └── aws - DIR
        └── service_name - DIR
            └── policy_name - DIR
                └── policy.rego - file
                └── policy_test.rego - file
    └── cloud_agnostics - DIR
        └── policy_name - DIR
                └── policy.rego - file
                └── policy_test.rego - file
    └── common-functions - DIR
        └── function_name - DIR
                └── policy.rego - file
                └── policy_test.rego - file
    └── runon - DIR
    └── tfc - DIR        
```

## OPA Policy Package Structure
Package name follows the folder path, for example AWS KMS key policy "enable_kms_key_rotation.rego" package would be--> package aws.kms.enable_kms_key_rotation  (similar to folder structure aws->kms->enable_kms_key_rotation) and for test it would be package aws.kms.enable_kms_key_rotation_test

Policy package name for AWS:
```rego
package aws.SERVICE_NAME.POLICY_NAME

e.g. for AWS KMS key policy "enable_kms_key_rotation.rego" package would be--> package aws.kms.enable_kms_key_rotation
```

Test package name for AWS:
```rego
package aws.SERVICE_NAME.POLICY_NAME_test

e.g. for AWS KMS key policy test "enable_kms_key_rotation_test.rego" package would be--> package aws.kms.enable_kms_key_rotation_test
```
### Pre-commit hooks

Install the pre-commit hooks, this gives you quick feedback about the quality of your code. More information [here](https://pre-commit.com/#quick-start), and the `.pre-commit-config.yaml` in the repository root contains information about the specific checks that are enabled.

You can see the configuration for the module pre-commit hooks [here](./.pre-commit-config.yaml)

### Dependabot

Dependabot configuration can be found [here](./.github/dependabot.yml), you **MUST** define each directory that has code you wish to scan e.g. each terraform directory or if you have multiple other directories with say Python or Node, these will need configuring too.

## External Resources
- [OPA Overview](https://www.openpolicyagent.org/docs/latest/#rego)

- [OPA Language Reference](https://www.openpolicyagent.org/docs/latest/policy-reference/)
