# Platform

This project is intended to manage the following resources:
 - api gateway / including certs
 - aurora / serverless postgres
 - cache
 - dns / both public and service discovery
 - vpc
 - sns / event bus
 
## Env Variables needed.

`AWS_SHARED_CREDENTIALS_FILE`
`AWS_CONFIG_FILE`

## Usage

`make plan`

`make apply`