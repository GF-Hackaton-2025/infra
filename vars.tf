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
  default = "subnet-04e7769cc24d957f1"
}

variable "subnetB" {
  default = "subnet-00025c9e67af8ac63"
}

variable "subnetC" {
  default = "subnet-0155c1c47830d7068"
}

variable "securityGroupId" {
  default = "sg-0c6ea99bc06215108"
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