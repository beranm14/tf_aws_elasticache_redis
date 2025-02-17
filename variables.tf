variable "apply_immediately" {
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window. Default is false."
  type        = bool
  default     = false
}

variable "allowed_cidr" {
  type        = list(string)
  default     = ["127.0.0.1/32"]
  description = "A list of Security Group ID's to allow access to."
}

variable "allowed_security_groups" {
  type        = list(string)
  default     = []
  description = "A list of Security Group ID's to allow access to."
}

variable "env" {
  type        = string
  description = "env to deploy into, should typically dev/staging/prod"
}

variable "name" {
  type        = string
  description = "Name for the Redis replication group i.e. UserObject"
}

variable "redis_clusters" {
  type        = string
  description = "Number of Redis cache clusters (nodes) to create"
}

variable "redis_failover" {
  type    = bool
  default = false
}

variable "redis_node_type" {
  type        = string
  description = "Instance type to use for creating the Redis cache clusters"
  default     = "cache.m3.medium"
}

variable "redis_port" {
  type    = number
  default = 6379
}

variable "subnets" {
  type        = list(string)
  description = "List of VPC Subnet IDs for the cache subnet group"
}

# might want a map
variable "redis_version" {
  type        = string
  description = "Redis version to use, defaults to 3.2.10"
  default     = "3.2.10"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "redis_parameters" {
  description = "List of objects describing mapping subnets to their allocation IDs"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "redis_maintenance_window" {
  type        = string
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period"
  default     = "fri:08:00-fri:09:00"
}

variable "redis_snapshot_window" {
  type        = string
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. The minimum snapshot window is a 60 minute period"
  default     = "06:30-07:30"
}

variable "redis_snapshot_retention_limit" {
  type        = number
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off. Please note that setting a snapshot_retention_limit is not supported on cache.t1.micro or cache.t2.* cache nodes"
  default     = 0
}

variable "tags" {
  type        = map(string)
  description = "Tags for redis nodes"
  default     = {}
}
