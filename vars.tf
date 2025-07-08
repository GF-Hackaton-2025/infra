//    #############################
//    ###          ECR          ###
//    #############################

variable "repositoryNames" {
  type        = list(string)
  default     = [
    "service-uploads-repo",
    "service-processor-repo",
    "service-user-repo"
  ]
}

//    #############################
//    ###          SQS          ###
//    #############################

variable "uploadsQueueName" {
  default = "uploads-events"
}

variable "filesProcessorQueueName" {
  default = "files-processor-events"
}

variable "visibilityTimeoutSeconds" {
  default = 300
}

variable "messageRetentionSeconds" {
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
  default = "subnet-024e1a200999c05e4"
}

variable "subnetB" {
  default = "subnet-028ec3a3f4ee92b73"
}

variable "subnetC" {
  default = "subnet-095db43a3cc8dc706"
}

variable "securityGroupId" {
  default = "sg-032fbb64277932162"
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