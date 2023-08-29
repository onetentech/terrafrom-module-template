
output "dummy_output" {
  value       = module.subnets.subnet_id
  description = "The subnet ID of the newly created subnet"
}
