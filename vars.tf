//    #############################
//    ###          SQS          ###
//    #############################

variable "queue_name" {
  default = "uploads-events"
}

variable "visibility_timeout_seconds" {
  default = 300
}

variable "message_retention_seconds" {
  default = 3600
}

//    #############################
//    ###         BUCKET        ###
//    #############################

variable "bucketName" {
  default = "gf-hack-bucket"
}

//    #############################
//    ###          EKS          ###
//    #############################

variable "labRole" {
  default = "arn:aws:iam::828818793977:role/LabRole"
}

variable "principalArn" {
  default = "arn:aws:iam::828818793977:role/voclabs"
}

variable "subnetA" {
  default = "subnet-048e537a18be6706f"
}

variable "subnetB" {
  default = "subnet-06a0f24d3026ec562"
}

variable "subnetC" {
  default = "subnet-039069fd0e9eee121"
}

variable "securityGroupId" {
  default = "sg-082dff686a8d79676"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "nodeName" {
  default = "gf-hack-eks-node"
}