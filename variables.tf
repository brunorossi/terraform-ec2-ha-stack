// basic variables


variable "aws_region" {
  description = "The AWS provider region"
  type        = string
}


variable "aws_access_key" {
  description = "The AWS access key"
  type        = string
}


variable "aws_secret_key" {
  description = "The AWS secret key"
  type        = string
}

variable "environment" {
  description = "The stack environment (prod, dev, uat)"
  type        = string
}

variable "stack_id" {
  description = "The label identifier for the stack, example: web-stack-1. Please use the - (dash) to separate the logical parts of a complex noun"
  type        = string
}

variable "application_id" {
  description = "The label identifier for the application, example: my-magazine. Please use the - (dash) to separate the logical parts of a complex noun"
  type        = string
}

variable "vpc_id" {
  description = "The VPC id of the VPC in which the stack must be deployed"
  type        = string
}

# ACM nodule variables

variable "acm_request_certificate_enabled" {
  description = "A boolean to enable or disable the provision of the ACM certificate and the relevant Route53 resources"
  type        = bool
  default     = false
}

variable "acm_request_certificate_zone_name" {
  description = "The Route53 zone"
  type        = string
}

variable "acm_request_certificate_domain_name" {
  description = "The main domain name of the issued certificate"
  type        = string
}

variable "acm_request_certificate_process_domain_validation_options" {
  description = "Flag to enable/disable processing of the record to add to the DNS zone to complete certificate validation"
  type        = bool
  default     = true
}

variable "acm_request_certificate_subject_alternative_names" {
  description = "A list of domains that should be SANs in the issued certificate"
  type        = list(string)
  default     = []
}

variable "acm_request_certificate_ttl" {
  description = "The TTL of the record to add to the DNS zone to complete certificate validation"
  type        = string
  default     = "300"
}

variable "acm_request_certificate_validation_method" {
  description = "The TTL of the record to add to the DNS zone to complete certificate validation"
  type        = string
  default     = "DNS"
}

variable "acm_request_certificate_wait_for_certificate_issued" {
  description = "Whether to wait for the certificate to be issued by ACM (the certificate status changed from Pending Validation to Issued)"
  type        = bool
  default     = false
}

variable "acm_request_certificate_tags" {
  description = "Additional tags (e.g. project_name=test, business_unit=IT)"
  type        = map(string)
  default     = {}
}

// EC2 KEY PAIR variables

variable "ec2_ssh_key_pair_tags" {
  description = "Additional tags (e.g. project_name=test, business_unit=IT)"
  type        = map(string)
  default     = {}
}

// RDS Security Group variable

variable "rds_security_group_ingress_with_cidr_blocks" {
  description = "List of computed ingress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "rds_security_group_egress_with_cidr_blocks" {
  description = "List of computed egress rules to create where 'cidr_blocks' is usedT"
  type        = list(map(string))
  default     = []
}

variable "rds_security_group_tags" {
  description = "Additional tags (e.g. project_name=test, business_unit=IT)"
  type        = map(string)
  default     = {}
}

variable "rds_security_group_create" {
  description = "Whether to create security group and all rules"
  type        = bool
  default     = true
}

// RDS KMS KEY module variables

variable "rds_kms_key_enabled" {
  description = "Set to false to prevent the module from creating any resources"
  type        = bool
  default     = true
}

variable "rds_kms_key_deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource"
  type        = number
  default     = 30
}

variable "rds_kms_key_enable_key_rotation" {
  description = "Specifies whether key rotation is enabled"
  type        = bool
  default     = true
}

variable "rds_kms_key_tags" {
  description = "Additional tags (e.g. project_name=test, business_unit=IT)"
  type        = map(string)
  default     = {}
}

// RDS variables

variable "rds_engine" {
  description = "The database engine to use"
  type        = string
  default     = "postgres"
}

variable "rds_multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = false
}

variable "rds_create_db_instance" {
  description = "Whether to create a database instance"
  type        = bool
  default     = true
}

variable "rds_create_db_option_group" {
  description = "Whether to create a option group"
  type        = bool
  default     = true
}

variable "rds_create_db_parameter_group" {
  description = "Whether to create a parameter group"
  type        = bool
  default     = true
}

variable "rds_create_db_subnet_group" {
  description = "Whether to create a subnet group"
  type        = bool
  default     = true
}

variable "rds_engine_version" {
  description = "The engine version to use"
  type        = string
  default     = "9.6.9"
}

variable "rds_instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t2.large"
}

variable "rds_allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = string
  default     = "10"
}

variable "rds_storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  type        = bool
  default     = true
}

variable "rds_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
}

variable "rds_username" {
  description = "Username for the master DB user"
  type        = string
}

variable "rds_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  type        = string
}

variable "rds_port" {
  description = "The port on which the DB accepts connections"
  type        = string
  default     = "5432"
}

variable "rds_maintencance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  type        = string
  default     = "Mon:00:00-Mon:03:00"
}

variable "rds_backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  type        = string
  default     = "03:00-06:00"
}

variable "rds_backup_retention_period" {
  description = "The days to retain backups for"
  type        = string
  default     = "7"
}

variable "rds_major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with"
  type        = string
}

variable "rds_final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted"
  type        = string
}

variable "rds_deletion_protection" {
  description = "The database can't be deleted when this value is set to true"
  type        = bool
  default     = false
}

variable "rds_enabled_cloudwatch_logs_exports" {
  description = "List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL)"
  type        = list(string)
  default     = []
}

variable "rds_subnet_ids" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
  default     = []
}

variable "rds_family" {
  description = ""
  type        = string
  default     = "postgres9.6"
}

variable "rds_tags" {
  description = "Additional tags (e.g. project_name=test, business_unit=IT)"
  type        = map(string)
  default     = {}
}

// kms key for s3 log storage

variable "s3_log_storage_kms_key_enabled" {
  description = "Set to false to prevent the module from creating any resources"
  type        = bool
  default     = true
}

variable "s3_log_storage_kms_key_deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource"
  type        = number
  default     = 30
}

variable "s3_log_storage_kms_key_enable_key_rotation" {
  description = "Specifies whether key rotation is enabled"
  type        = bool
  default     = true
}

variable "s3_log_storage_kms_key_tags" {
  description = "Additional tags (e.g. project_name=test, business_unit=IT)"
  type        = map(string)
  default     = {}
}

// s3 bucket

variable "s3_log_storage_name" {
  description = "Name (e.g. app or db)"
  type        = string
}

variable "s3_log_storage_acl" {
  description = "The canned ACL to apply. We recommend log-delivery-write for compatibility with AWS services"
  type        = string
  default     = "log-delivery-write"
}

variable "s3_log_storage_enabled" {
  description = "Set to false to prevent the module from creating any resources"
  type        = bool
  default     = true
}

variable "s3_log_storage_standard_transition_days" {
  description = "Number of days to persist in the standard storage tier before moving to the infrequent access tier"
  type        = number
  default     = 30
}

variable "s3_log_storage_glacier_transition_days" {
  description = "Number of days after which to move the data to the glacier storage tier"
  type        = number
  default     = 60
}

variable "s3_log_storage_expiration_days" {
  description = "Number of days after which to expunge the objects"
  type        = number
  default     = 90
}

variable "s3_log_storage_noncurrent_version_expiration_days" {
  description = "Specifies when noncurrent object versions expire"
  type        = number
  default     = 90
}

variable "s3_log_storage_noncurrent_version_transition_days" {
  description = "Specifies when noncurrent object versions transitions"
  type        = number
  default     = 30
}

variable "s3_log_storage_noncurrent_versioning_enabled" {
  description = "A state of versioning. Versioning is a means of keeping multiple variants of an object in the same bucket"
  type        = bool
  default     = true
}

variable "s3_log_storage_sse_algorithm" {
  description = "The server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
  type        = string
  default     = "aws:kms"
}

variable "s3_log_storage_tags" {
  description = "Additional tags (e.g. project_name=test, business_unit=IT)"
  type        = map(string)
  default     = {}
}

// Application load Balancer variables

variable "alb_enabled" {
  description = "Set to false to prevent the module from creating anything"
  type        = string
  default     = true
}

variable "alb_enable_https_listener" {
  description = "If true, the HTTPS listener will be created"
  type        = string
  default     = true
}

variable "alb_enable_http_listener" {
  description = "If true, the HTTP listener will be created"
  type        = string
  default     = true
}

variable "alb_enable_redirect_http_to_https_listener" {
  description = "If true, the HTTP listener of HTTPS redirect will be created"
  type        = string
  default     = true
}

variable "alb_internal" {
  description = "If true, the LB will be internal"
  type        = string
  default     = false
}

variable "alb_idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle"
  type        = string
  default     = "60"
}

variable "alb_enable_deletion_protection" {
  description = "If true, deletion of the load balancer will be disabled via the AWS API"
  type        = string
  default     = true
}

variable "alb_enable_http2" {
  description = "Indicates whether HTTP/2 is enabled in application load balancers"
  type        = string
  default     = true
}

variable "alb_ip_address_type" {
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack"
  type        = string
  default     = "ipv4"
}

variable "alb_access_logs_prefix" {
  description = "The S3 bucket prefix. Logs are stored in the root if not configured"
  type        = string
  default     = ""
}

variable "alb_access_logs_enabled" {
  description = "Boolean to enable / disable access_logs"
  type        = string
  default     = true
}

variable "alb_ssl_policy" {
  description = "The name of the SSL Policy for the listener. Required if protocol is HTTPS"
  type        = string
  default     = "ELBSecurityPolicy-2016-08"
}

variable "alb_https_port" {
  description = "The HTTPS port"
  type        = string
  default     = "443"
}

variable "alb_http_port" {
  description = "The HTTP port"
  type        = string
  default     = "80"
}

variable "alb_fixed_response_content_type" {
  description = "The content type. Valid values are text/plain, text/css, text/html, application/javascript and application/json"
  type        = string
  default     = "text/plain"
}

variable "alb_fixed_response_message_body" {
  description = "The message body"
  type        = string
  default     = "OK"
}

variable "alb_fixed_response_status_code" {
  description = "The HTTP response code. Valid values are 2XX, 4XX, or 5XX"
  type        = string
  default     = "200"
}

variable "alb_ingress_cidr_blocks" {
  description = "List of Ingress CIDR blocks"
  type        = list
  default     = ["0.0.0.0/0"]
}

variable "alb_target_group_port" {
  description = "The port on which targets receive traffic, unless overridden when registering a specific target"
  type        = string
  default     = "80"
}

variable "alb_target_group_protocol" {
  description = "The protocol to use for routing traffic to the targets. Should be one of HTTP or HTTPS"
  type        = string
  default     = "HTTP"
}

variable "alb_target_type" {
  description = "The type of target that you must specify when registering targets with this target group"
  type        = string
  default     = "ip"
}

variable "alb_deregistration_delay" {
  description = "The amount time for the load balancer to wait before changing the state of a deregistering target from draining to unused"
  type        = string
  default     = "300"
}

variable "alb_slow_start" {
  description = "The amount time for targets to warm up before the load balancer sends them a full share of requests"
  type        = string
  default     = "0"
}

variable "alb_health_check_path" {
  description = "The destination for the health check request"
  type        = string
  default     = "/healthcheck"
}

variable "alb_health_check_healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
  type        = string
  default     = "3"
}

variable "alb_health_check_unhealthy_threshold" {
  description = "The number of consecutive health check failures required before considering the target unhealthy"
  type        = string
  default     = "3"
}

variable "alb_health_check_timeout" {
  description = "The amount of time, in seconds, during which no response means a failed health check"
  type        = string
  default     = "3"
}

variable "alb_health_check_interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target"
  type        = string
  default     = "15"
}

variable "alb_health_check_matcher" {
  description = "The HTTP codes to use when checking for a successful response from a target"
  type        = string
  default     = "200"
}

variable "alb_health_check_port" {
  description = "The port to use to connect with the target"
  type        = string
  default     = "traffic-port"
}

variable "alb_health_check_protocol" {
  description = "The protocol to use to connect with the target"
  type        = string
  default     = "HTTP"
}

variable "alb_listener_rule_priority" {
  description = "The priority for the rule between 1 and 50000"
  type        = string
  default     = "50000"
}

variable "alb_listener_rule_condition_field" {
  description = "The name of the field. Must be one of path-pattern for path based routing or host-header for host based routing."
  type        = string
  default     = "path-pattern"
}

variable "alb_listener_rule_condition_values" {
  description = "The path patterns to match. A maximum of 1 can be defined"
  type        = list
  default     = ["/*"]
}

variable "alb_tags" {
  description = "Additional tags (e.g. project_name=test, business_unit=IT)"
  type        = map(string)
  default     = {}
}

// EC2 security group variables

variable "ec2_security_group_ingress_with_cidr_blocks" {
  description = "List of computed ingress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
}

variable "ec2_security_group_egress_with_cidr_blocks" {
  description = "List of computed egress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
}

variable "ec2_security_group_tags" {
  description = "Additional tags (e.g. project_name=test, business_unit=IT"
  type        = map(string)
  default     = {}
}

variable "ec2_security_group_create" {
  description = "Whether to create security group and all rules"
  type        = bool
  default     = true
}

// EC2 instance profile variables

variable "ec2_instance_profile_cloudwatch_agent_policy" {
  description = "True/False to add cloudwatch agent policy permissions to the IAM Role for the Instance Profile"
  type        = string
  default     = true
}

variable "ec2_instance_profile_ssm_policy" {
  description = "True/False to add ssm policy permissions to the IAM Role for the Instance Profile"
  type        = string
  default     = true
}

variable "ec2_instance_profile_tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
  default = {}
}

// AMI selection variables

variable "ami_selector_names" {
  description = "List of names to fetch the AMI"
  type        = list(string)
  default     = []
}

variable "ami_selector_virtualization_types" {
  description = "List of virtualization types (hvm, paravirtualized) to fetch the AMI"
  type        = list(string)
  default     = ["hvm"]
}

variable "ami_selector_owners" {
  description = "List of owners ID to fetch the AMI"
  type        = list(string)
  default     = []
}

// Autoscaling Group Variable

variable "asg_instance_type" {
  description = "The size of instance to launch"
  type        = string
  default     = ""
}

variable "asg_health_check_type" {
  description = "Controls how health checking is done. Values are - EC2 and ELB"
  type        = string
  default     = "ELB"
}

variable "asg_min_size" {
  description = "The minimum size of the auto scale group"
  type        = string
  default     = "1"
}

variable "asg_max_size" {
  description = "The maximum size of the auto scale group"
  type        = string
  default     = "1"
}

variable "asg_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  type        = string
  default     = "1"
}

variable "asg_wait_for_capacity_timeout" {
  description = ""
  type        = string
  default     = "0"
}
