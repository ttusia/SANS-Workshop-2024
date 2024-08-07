package aws.validation

import future.keywords.contains
import future.keywords.if
import future.keywords.in

import input

deny_alwayspass contains {
    "msg": "i should always pass",
    "details": {
        "pass": "pass"
    }
} if {
    false
}