terraform{
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 6.0"
        }
    }
    backend "local" {
      path = "/Users/basimahamed/Desktop/mylearning_folder/Statefiles/d3/terraform.tfstate"
    }
}

provider "aws" {
    region = var.aws_region
    shared_credentials_files = ["~/.aws/credentials"]
    profile = "default"
}