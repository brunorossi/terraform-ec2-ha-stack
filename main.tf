provider "aws" {
  region  = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "acm_request_certificate" {
  source                            = "app.terraform.io/nicethedevops/acm-request-certificate/aws"
  version                           = "0.4.0"
  enabled                           = var.acm_request_certificate_enabled
  zone_name                         = var.acm_request_certificate_zone_name
  domain_name                       = var.acm_request_certificate_domain_name
  process_domain_validation_options = var.acm_request_certificate_process_domain_validation_options
  subject_alternative_names         = var.acm_request_certificate_subject_alternative_names
  ttl                               = var.acm_request_certificate_ttl
  validation_method                 = var.acm_request_certificate_validation_method
  wait_for_certificate_issued       = var.acm_request_certificate_wait_for_certificate_issued
  tags                              = var.acm_request_certificate_tags
}

module "ec2_ssh_key_pair" {
  source                = "app.terraform.io/nicethedevops/ssh-key-pair/tls"
  version               = "0.2.0"
  name                  = "${var.stack_id}-${var.environment}-ec2-ssh-kp"
  ssh_public_key_path   = "/secrets"
  private_key_extension = ".pem"
  public_key_extension  = ".pub"
  chmod_command         = "chmod 600 %v"
  tags                  = var.ec2_ssh_key_pair_tags
}

module "rds_kms_key" {
  source                  = "app.terraform.io/nicethedevops/kms-key/aws"
  version                 = "0.4.0"
  enabled                 = var.rds_kms_key_enabled
  name                    = "${var.stack_id}-${var.environment}-rds-kms-key"
  description             = "KMS key for the RDS of the stack with id: ${var.stack_id} and environment: ${var.environment}"
  deletion_window_in_days = var.rds_kms_key_deletion_window_in_days
  enable_key_rotation     = var.rds_kms_key_enable_key_rotation
  tags                    = var.rds_kms_key_tags
}

module "rds_security_group" {
  source                   = "app.terraform.io/nicethedevops/security-group/aws"
  version                  = "3.4.0"
  create                   = var.rds_security_group_create
  name                     = "${var.stack_id}-${var.environment}-rds-sg"
  description              = "Security group for the RDS of the stack with id: ${var.stack_id} and environment: ${var.environment}"
  vpc_id                   = var.vpc_id
  ingress_with_cidr_blocks = var.rds_security_group_ingress_with_cidr_blocks
  egress_with_cidr_blocks  = var.rds_security_group_egress_with_cidr_blocks
  tags                     = var.rds_security_group_tags
}

module "rds" {
  source                          = "app.terraform.io/nicethedevops/rds/aws"
  version                         = "2.5.0"
  multi_az                        = var.rds_multi_az
  identifier                      = "${var.stack_id}-${var.environment}-rds"
  db_subnet_group_name            = "${var.stack_id}-${var.environment}-db-sg"
  create_db_instance              = var.rds_create_db_instance
  create_db_option_group          = var.rds_create_db_option_group
  create_db_parameter_group       = var.rds_create_db_parameter_group
  create_db_subnet_group          = var.rds_create_db_subnet_group
  engine                          = var.rds_engine
  engine_version                  = var.rds_engine_version
  instance_class                  = var.rds_instance_class
  allocated_storage               = var.rds_allocated_storage
  storage_encrypted               = var.rds_storage_encrypted
  kms_key_id                      = module.rds_kms_key.key_arn
  name                            = var.rds_name
  username                        = var.rds_username
  password                        = var.rds_password
  port                            = var.rds_port
  vpc_security_group_ids          = ["${module.rds_security_group.this_security_group_id}"]
  maintenance_window              = var.rds_maintencance_window
  backup_window                   = var.rds_backup_window
  backup_retention_period         = var.rds_backup_retention_period
  major_engine_version            = var.rds_major_engine_version
  final_snapshot_identifier       = var.rds_final_snapshot_identifier
  deletion_protection             = var.rds_deletion_protection
  family                          = var.rds_family
  enabled_cloudwatch_logs_exports = var.rds_enabled_cloudwatch_logs_exports
  subnet_ids                      = var.rds_subnet_ids
  tags                            = var.rds_tags
}

module "s3_logs_storage_kms_key" {
  source                  = "app.terraform.io/nicethedevops/kms-key/aws"
  version                 = "0.4.0"
  enabled                 = var.s3_log_storage_kms_key_enabled
  name                    = "${var.stack_id}-${var.environment}-s3-logs-store-kms-key"
  description             = "KMS key for the S3 log storage of the stack with id: ${var.stack_id} and environment: ${var.environment}"
  deletion_window_in_days = var.s3_log_storage_kms_key_deletion_window_in_days
  enable_key_rotation     = var.s3_log_storage_kms_key_enable_key_rotation
  tags                    = var.s3_log_storage_kms_key_tags
}

module "s3_logs_storage" {
  source                             = "app.terraform.io/nicethedevops/s3-log-storage/aws"
  version                            = "0.7.0"
  name                               = "${var.stack_id}-${var.environment}-s3-logs-storage"
  acl                                = var.s3_log_storage_acl
  enabled                            = var.s3_log_storage_enabled
  standard_transition_days           = var.s3_log_storage_standard_transition_days
  glacier_transition_days            = var.s3_log_storage_glacier_transition_days
  expiration_days                    = var.s3_log_storage_expiration_days
  noncurrent_version_expiration_days = var.s3_log_storage_noncurrent_version_expiration_days
  noncurrent_version_transition_days = var.s3_log_storage_noncurrent_version_transition_days
  versioning_enabled                 = var.s3_log_storage_noncurrent_versioning_enabled
  sse_algorithm                      = var.s3_log_storage_sse_algorithm
  kms_master_key_arn                 = module.s3_log_storage_kms_key.key_arn
  tags                               = var.s3_log_storage_tags
}

module "alb" {
  source                                 = "app.terraform.io/nicethedevops/alb-1/aws"
  version                                = "1.5.1"
  name                                   = "${var.stack_id}-${var.environment}-alb"
  vpc_id                                 = var.vpc_id
  subnets                                = ["${var.alb_subnets}"]
  access_logs_bucket                     = module.s3_log_storage.bucket_id
  enabled                                = var.alb_enabled
  certificate_arn                        = module.acm_request_certificate.arn
  enable_https_listener                  = var.alb_enable_https_listener
  enable_http_listener                   = var.alb_enable_http_listener
  enable_redirect_http_to_https_listener = var.alb_enable_redirect_http_to_https_listener
  internal                               = var.alb_internal
  idle_timeout                           = var.alb_idle_timeout
  enable_deletion_protection             = var.alb_enable_deletion_protection
  enable_http2                           = var.alb_enable_http2
  ip_address_type                        = var.alb_ip_address_type
  access_logs_prefix                     = var.alb_access_logs_prefix
  access_logs_enabled                    = var.alb_access_logs_enabled
  ssl_policy                             = var.alb_ssl_policy
  https_port                             = var.alb_https_port
  http_port                              = var.alb_http_port
  fixed_response_content_type            = var.alb_fixed_response_content_type
  fixed_response_message_body            = var.alb_fixed_response_message_body
  fixed_response_status_code             = var.alb_fixed_response_status_code
  ingress_cidr_blocks                    = var.alb_ingress_cidr_blocks
  target_group_port                      = var.alb_target_group_port
  target_group_protocol                  = var.alb_target_group_protocol
  target_type                            = var.alb_target_type
  deregistration_delay                   = var.alb_deregistration_delay
  slow_start                             = var.alb_slow_start
  health_check_path                      = var.alb_health_check_path
  health_check_healthy_threshold         = var.alb_health_check_healthy_threshold
  health_check_unhealthy_threshold       = var.alb_health_check_unhealthy_threshold
  health_check_timeout                   = var.alb_health_check_timeout
  health_check_interval                  = var.alb_health_check_interval
  health_check_matcher                   = var.alb_health_check_matcher
  health_check_port                      = var.alb_health_check_port
  health_check_protocol                  = var.alb_health_check_protocol
  listener_rule_priority                 = var.alb_listener_rule_priority
  listener_rule_condition_field          = var.alb_listener_rule_condition_field
  listener_rule_condition_values         = var.alb_listener_rule_condition_values
  tags                                   = var.alb_tags


// select the most recent AMI for immutable infrastructure

module "ec2_security_group" {
  source                   = "app.terraform.io/nicethedevops/security-group/aws"
  version                  = "3.4.0"
  create                   = var.ec2_security_group_create
  name                     = "${var.application_id}-${var.environment}-ec2-sg"
  description              = "Security group for the EC2's of the application called: ${var.stack_id} and environment: ${var.environment}"
  vpc_id                   = var.vpc_id
  ingress_with_cidr_blocks = var.ec2_security_group_ingress_with_cidr_blocks
  egress_with_cidr_blocks  = var.ec2_security_group_egress_with_cidr_blocks
  tags                     = var.ec2_security_group_tags
}

data "aws_ami" "ami_selector" {
  most_recent = true

  filter {
    name   = "name"
    values = var.ami_selector_names
  }

  filter {
    name   = "virtualization-type"
    values = var.ami_selector_virtualization_types
  }

  owners = var.ami_selector_owners
}

data "aws_iam_policy_document" "custom_ec2_role_policy" {
  statement {
    sid       = ""
    actions   = []
    resources = []
  }
}

module "ec2_instance_profile" {
  source                  = "app.terraform.io/nicethedevops/ec2-instance-profile-builder/aws"
  version                 = "2.0.0"
  instance_profile_name   = "${var.application_id}-${var.environment}-ec2-instance-profile"
  cloudwatch_agent_policy = var.ec2_instance_profile_cloudwatch_agent_policy
  ssm_policy              = var.ec2_instance_profile_ssm_policy
  custom_policy_jsons     = ["${data.aws_iam_policy_document.custom_ec2_role_policy.json}"]
  input_tags              = var.ec2_instance_profile_tags
}

module "backend_instances_asg" {
  source                    = "app.terraform.io/nicethedevops/autoscaling/aws"
  version                   = "3.4.0"
  name                      = "${var.application-id}-${var.environment}-asg"
  image_id                  = data.aws_ami.ami_selector.id
  instance_type             = var.asg_instance_type
  security_groups           = ["${module.ec2_security_group.this_security_group_id}"]
  iam_instance_profile      = var.ec2_instance_profile.instance_profile_id
  asg_name                  = "${var.application-id}-${var.environment}-asg"
  vpc_zone_identifier       = var.asg_subnets
  health_check_type         = var.asg_health_check_type
  min_size                  = var.asg_min_size
  max_size                  = var.asg_max_size
  desired_capacity          = var.asg_desired_capacity
  wait_for_capacity_timeout = var.asg_wait_for_capacity_timeout
  target_group_arns         = ["${module.alb.alb_target_group_arn}"]
  tags                      = var.asg_tags
}

// @todo
// s3 bucket
// cloudfront ditro with multiple origins and behaviors
// decouple alb from listeners and target groups
// cloudwatch alarms to trigger the scaling
