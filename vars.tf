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
  default = "subnet-0e2dc220a6c942694"
}

variable "subnetB" {
  default = "subnet-04ed5a110e0437b72"
}

variable "subnetC" {
  default = "subnet-02136f0754b9fd523"
}

variable "securityGroupId" {
  default = "sg-0293415abcf7d2cd6"
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
