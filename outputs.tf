// acm request certificate outputs

output "acm_request_certificate_arn" {
  value       = "${var.acm_request_certificate_enabled == "true" ? module.acm_request_certificate.arn : ""}"
  description = ""
}

output "acm_request_certificate_domain_validation_options" {
  value       = "${var.acm_request_certificate_enabled == "true" ? module.acm_request_certificate.domain_validation_options : ""}"
  description = ""
}

output "acm_request_certificate_id" {
  value       = "${var.acm_request_certificate_enabled == "true" ? module.acm_request_certificate.id : ""}"
  description = ""
}

// ec2 ssh key pair outputs

output "ec2_ssh_key_pair_key_name" {
  value       = "${module.ec2_ssh_key_pair.key_name}"
  description = ""
}

output "ec2_ssh_key_pair_public_key" {
  value       = "${module.ec2_ssh_key_pair.public_key}"
  description = ""
}

// rds kms key outputs

output "rds_kms_key_alias_arn" {
  value       = "${var.rds_kms_key_enabled == "true" ? module.rds_kms_key.alias_arn : ""}"
  description = ""
}

output "rds_kms_key_alias_name" {
  value       = "${var.rds_kms_key_enabled == "true" ? module.rds_kms_key.alias_name : ""}"
  description = ""
}

output "rds_kms_key_arn" {
  value       = "${var.rds_kms_key_enabled == "true" ? module.rds_kms_key.key_arn : ""}"
  description = ""
}

output "rds_kms_key_id" {
  value       = "${var.rds_kms_key_enabled == "true" ? module.rds_kms_key.key_id : ""}"
  description = ""
}

// rds security group outputs

output "rds_security_group_description" {
  value       = "${var.rds_security_group_create == "true" ? module.rds_security_group.this_security_group_description : ""}"
  description = ""
}

output "rds_security_group_id" {
  value       = "${var.rds_security_group_create == "true" ? module.rds_security_group.this_security_group_id : ""}"
  description = ""
}

output "rds_security_group_name" {
  value       = "${var.rds_security_group_create == "true" ? module.rds_security_group.this_security_group_name : ""}"
  description = ""
}

output "rds_security_group_owner_id" {
  value       = "${var.rds_security_group_create == "true" ? module.rds_security_group.this_security_group_owner_id : ""}"
  description = ""
}

output "rds_security_group_vpc_id" {
  value       = "${var.rds_security_group_create == "true" ? module.rds_security_group.this_security_group_vpc_id : ""}"
  description = ""
}

// rds outputs

output "rds_db_instance_address" {
  value       = "${var.rds_create_db_instance == "true" ? module.rds.this_db_instance_address : ""}"
  description = ""
}

output "rds_db_instance_arn" {
  value       = "${var.rds_create_db_instance == "true" ? module.rds.this_db_instance_arn : ""}"
  description = ""
}

output "rds_db_instance_endpoint" {
  value       = "${var.rds_create_db_instance == "true" ? module.rds.this_db_instance_endpoint : ""}"
  description = ""
}

output "rds_db_instance_id" {
  value       = "${var.rds_create_db_instance == "true" ? module.rds.this_db_instance_id : ""}"
  description = ""
}

output "rds_db_instance_name" {
  value       = "${var.rds_create_db_instance == "true" ? module.rds.this_db_instance_name : ""}"
  description = ""
}

output "rds_db_instance_port" {
  value       = "${var.rds_create_db_instance == "true" ? module.rds.this_db_instance_port : ""}"
  description = ""
}

output "rds_db_instance_resource_id" {
  value       = "${var.rds_create_db_instance == "true" ? module.rds.this_db_instance_resource_id : ""}"
  description = ""
}

output "rds_db_instance_status" {
  value       = "${var.rds_create_db_instance == "true" ? module.rds.this_db_instance_status : ""}"
  description = ""
}

output "rds_db_instance_username" {
  value       = "${var.rds_create_db_instance == "true" ? module.rds.this_db_instance_username : ""}"
  description = ""
  sensitive   = true
}

output "rds_db_option_group_arn" {
  value       = "${var.rds_create_db_option_group == "true" ? module.rds.this_db_option_group_arn : ""}"
  description = ""
}

output "rds_db_option_group_id" {
  value       = "${var.rds_create_db_option_group == "true" ? module.rds.this_db_option_group_id : ""}"
  description = ""
}

output "rds_db_parameter_group_arn" {
  value       = "${var.rds_create_db_parameter_group == "true" ? module.rds.this_db_parameter_group_arn : ""}"
  description = ""
}

output "rds_db_parameter_group_id" {
  value       = "${var.rds_create_db_parameter_group == "true" ? module.rds.this_db_parameter_group_id : ""}"
  description = ""
}

output "rds_db_subnet_group_arn" {
  value       = "${var.rds_create_db_subnet_group == "true" ? module.rds.this_db_subnet_group_arn : ""}"
  description = ""
}

output "rds_db_subnet_group_id" {
  value       = "${var.rds_create_db_subnet_group == true ? module.rds.this_db_subnet_group_id : ""}"
  description = ""
}

// s3 logs storage kms key outputs

output "s3_logs_storage_kms_key_alias_arn" {
  value       = "${module.s3_logs_storage_kms_key.alias_arn}"
  description = ""
}

output "s3_logs_storage_kms_key_alias_name" {
  value       = "${module.s3_logs_storage_kms_key.alias_name}"
  description = ""
}

output "s3_logs_storage_kms_key_arn" {
  value       = "${module.s3_logs_storage_kms_key.key_arn}"
  description = ""
}

output "s3_logs_storage_kms_key_id" {
  value       = "${module.s3_logs_storage_kms_key.key_id}"
  description = ""
}

// s3 logs storage outputs

output "s3_logs_storage_bucket_arn" {
  value       = "${module.s3_logs_storage.bucket_arn}"
  description = ""
}

output "s3_logs_storage_bucket_domain_name" {
  value       = "${module.s3_logs_storage.bucket_domain_name}"
  description = ""
}

output "s3_logs_storage_bucket_id" {
  value       = "${module.s3_logs_storage.bucket_id}"
  description = ""
}

output "s3_logs_storage_enabled" {
  value       = "${module.s3_logs_storage.enabled}"
  description = ""
}

output "s3_logs_storage_prefix" {
  value       = "${module.s3_logs_storage.prefix}"
  description = ""
}

// alb outputs

output "alb_arn" {
  value       = "${module.alb.alb_arn}"
  description = ""
}

output "alb_arn_suffix" {
  value       = "${module.alb.alb_arn_suffix}"
  description = ""
}

output "alb_dns_name" {
  value       = "${module.alb.alb_dns_name}"
  description = ""
}

output "alb_id" {
  value       = "${module.alb.alb_id}"
  description = ""
}

output "alb_target_group_arn" {
  value       = "${module.alb.alb_target_group_arn}"
  description = ""
}

output "alb_target_group_arn_suffix" {
  value       = "${module.alb.alb_target_group_arn_suffix}"
  description = ""
}

output "alb_target_group_id" {
  value       = "${module.alb.alb_target_group_id}"
  description = ""
}

output "alb_target_group_name" {
  value       = "${module.alb.alb_target_group_name}"
  description = ""
}

output "alb_target_group_port" {
  value       = "${module.alb.alb_target_group_port}"
  description = ""
}

output "alb_zone_id" {
  value       = "${module.alb.alb_zone_id}"
  description = ""
}

output "alb_http_alb_listener_arn" {
  value       = "${module.alb.http_alb_listener_arn}"
  description = ""
}

output "alb_http_alb_listener_id" {
  value       = "${module.alb.http_alb_listener_id}"
  description = ""
}

output "alb_http_alb_listener_rule_arn" {
  value       = "${module.alb.http_alb_listener_rule_arn}"
  description = ""
}

output "alb_http_alb_listener_rule_id" {
  value       = "${module.alb.http_alb_listener_rule_id}"
  description = ""
}

output "alb_https_alb_listener_arn" {
  value       = "${module.alb.https_alb_listener_arn}"
  description = ""
}

output "alb_https_alb_listener_id" {
  value       = "${module.alb.https_alb_listener_id}"
  description = ""
}

output "alb_https_alb_listener_rule_arn" {
  value       = "${module.alb.https_alb_listener_rule_arn}"
  description = ""
}

output "alb_https_alb_listener_rule_id" {
  value       = "${module.alb.https_alb_listener_rule_id}"
  description = ""
}

output "alb_redirect_http_to_https_alb_listener_arn" {
  value       = "${module.alb.redirect_http_to_https_alb_listener_arn}"
  description = ""
}

output "alb_redirect_http_to_https_alb_listener_id" {
  value       = "${module.alb.redirect_http_to_https_alb_listener_id}"
  description = ""
}

output "alb_security_group_arn" {
  value       = "${module.alb.security_group_arn}"
  description = ""
}

output "alb_security_group_description" {
  value       = "${module.alb.security_group_description}"
  description = ""
}

output "alb_security_group_egress" {
  value       = "${module.alb.security_group_egress}"
  description = ""
}

output "alb_security_group_id" {
  value       = "${module.alb.security_group_id}"
  description = ""
}

output "alb_security_group_ingress" {
  value       = "${module.alb.security_group_ingress}"
  description = ""
}

output "alb_security_group_name" {
  value       = "${module.alb.security_group_name}"
  description = ""
}

output "alb_security_group_owner_id" {
  value       = "${module.alb.security_group_owner_id}"
  description = ""
}

output "alb_security_group_vpc_id" {
  value       = "${module.alb.security_group_vpc_id}"
  description = ""
}

// ec2 security group outputs

output "ec2_security_group_description" {
  value       = "${module.ec2_security_group.this_security_group_description}"
  description = ""
}

output "ec2_security_group_id" {
  value       = "${module.ec2_security_group.this_security_group_id}"
  description = ""
}

output "ec2_security_group_name" {
  value       = "${module.ec2_security_group.this_security_group_name}"
  description = ""
}

output "ec2_security_group_owner_id" {
  value       = "${module.ec2_security_group.this_security_group_owner_id}"
  description = ""
}

output "ec2_security_group_vpc_id" {
  value       = "${module.ec2_security_group.this_security_group_vpc_id}"
  description = ""
}

// ec2 instance profile outputs

output "ec2_instance_profile_id" {
  value       = "${module.ec2_instance_profile.instance_profile_id}"
  description = ""
}

// backend instance auto scaling group outputs

output "backend_instances_asg_arn" {
  value       = "${module.backend_instances_asg.this_autoscaling_group_arn}"
  description = ""
}

output "backend_instances_asg_azs" {
  value       = "${module.backend_instances_asg.this_autoscaling_group_availability_zones}"
  description = ""
}

output "backend_instances_asg_default_cooldown" {
  value       = "${module.backend_instances_asg.this_autoscaling_group_default_cooldown}"
  description = ""
}

output "backend_instances_asg_desired_capacity" {
  value       = "${module.backend_instances_asg.this_autoscaling_group_desired_capacity}"
  description = ""
}

output "backend_instances_asg_health_check_grace_period" {
  value       = "${module.backend_instances_asg.this_autoscaling_group_health_check_grace_period}"
  description = ""
}

output "backend_instances_asg_health_check_type" {
  value       = "${module.backend_instances_asg.this_autoscaling_group_health_check_type}"
  description = ""
}

output "backend_instances_asg_id" {
  value       = "${module.backend_instances_asg.this_autoscaling_group_id}"
  description = ""
}

output "backend_instances_asg_load_balancers" {
  value       = "${module.backend_instances_asg.this_autoscaling_group_load_balancers}"
  description = ""
}

output "backend_instances_asg_max_size" {
  value       = "${module.backend_instances_asg.this_autoscaling_group_max_size}"
  description = ""
}

output "backend_instances_asg_min_size" {
  value       = "${module.backend_instances_asg.this_autoscaling_group_min_size}"
  description = ""
}

output "backend_instances_asg_name" {
  value       = "${module.backend_instances_asg.this_autoscaling_group_name}"
  description = ""
}

output "backend_instances_asg_target_group_arns" {
  value       = "${module.backend_instances_asg.this_autoscaling_group_target_group_arns}"
  description = ""
}

output "backend_instances_asg_vpc_zone_identifier" {
  value       = "${module.backend_instances_asg.this_autoscaling_group_vpc_zone_identifier}"
  description = ""
}

output "backend_instances_asg_launch_configuration_id" {
  value       = "${module.backend_instances_asg.this_launch_configuration_id}"
  description = ""
}

output "backend_instances_asg_launch_configuration_name" {
  value       = "${module.backend_instances_asg.this_launch_configuration_name}"
  description = ""
}
