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
  default = "subnet-0c30fe1e420164305"
}

variable "subnetB" {
  default = "subnet-099dff91f9f3d81d8"
}

variable "subnetC" {
  default = "subnet-08ccc289d88bf8e49"
}

variable "securityGroupId" {
  default = "sg-03cb165d331a257b5"
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