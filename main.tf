/**********************************************************
  # Configure the AWS Provider
  # Add configuration to authorisation keys
*/
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

/**********************************************************
  # Add configuration to authorisation keys
  # Configure the AWS Provider  
**********************************************************/

provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"
}

/**********************************************************
  # Configure S3 Backend
**********************************************************/

terraform {
  backend "s3" {
    bucket         = "lambda-deploy-example-terraform-bucket-state"
    key            = "state.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "lambda-deploy-example-terraform-bucket-state"
  }
}