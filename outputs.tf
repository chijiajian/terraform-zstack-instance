#
# Contextual output
#

output "walrus_project_name" {
  value       = try(local.context["project"]["name"], null)
  description = "The name of project where deployed in Walrus."
}

output "walrus_project_id" {
  value       = try(local.context["project"]["id"], null)
  description = "The id of project where deployed in Walrus."
}

output "walrus_environment_name" {
  value       = try(local.context["environment"]["name"], null)
  description = "The name of environment where deployed in Walrus."
}

output "walrus_environment_id" {
  value       = try(local.context["environment"]["id"], null)
  description = "The id of environment where deployed in Walrus."
}

output "walrus_resource_name" {
  value       = try(local.context["resource"]["name"], null)
  description = "The name of resource where deployed in Walrus."
}

output "walrus_resource_id" {
  value       = try(local.context["resource"]["id"], null)
  description = "The id of resource where deployed in Walrus."
}

#
# Submodule output
#

# modules/zstack-instance/outputs.tf

output "instances" {
  description = "The created instances"
  value       = zstack_instance.instance
}

output "instance_ids" {
  description = "IDs of the created instances"
  value       = zstack_instance.instance[*].uuid
}

output "instance_names" {
  description = "Names of the created instances"
  value       = zstack_instance.instance[*].name
}

output "instance_ips" {
  description = "The IP addresses of the created instances"
  value       = [for instance in zstack_instance.instance : instance.vm_nics[0].ip]
}

output "instance_nics" {
  description = "The network interfaces of the created instances"
  value       = [for instance in zstack_instance.instance : instance.vm_nics]
}

