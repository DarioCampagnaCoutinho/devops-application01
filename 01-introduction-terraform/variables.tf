variable "tags" {

    type = map(string)
    default = {
      Environment = "production"
      Project     = "Terraform "
    }
  
}

variable "assume_role" {

    type = object({
      arn = string
      region = string 
    })

    default = {
      arn = "arn:aws:iam::906401006237:role/awsmanagerrole"
      region = "us-east-1"
    }
  
}