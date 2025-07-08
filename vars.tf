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
  default = "subnet-08c47c47fc90efb4b"
}

variable "subnetB" {
  default = "subnet-04d1240ce6a937eea"
}

variable "subnetC" {
  default = "subnet-042faa61b375c6bb7"
}

variable "securityGroupId" {
  default = "sg-04c9f3c912390bf96"
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