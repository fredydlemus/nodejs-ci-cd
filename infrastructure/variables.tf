variable "aws_region" {
    description = "The AWS region to create resources in."
    type        = string
    default     = "us-west-1"
}

variable "app_name" {
    description = "The name of the application."
    type        = string
    default     = "my-nodejs-app"
}

variable "env_name" {
    description = "The name of the environment."
    type        = string
    default     = "my-nodejs-app-env"
}