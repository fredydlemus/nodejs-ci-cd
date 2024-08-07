provider "aws" {
    region = var.aws_region
}

resource "aws_elastic_beanstalk_application" "app" {
    name        = var.app_name
    description = "Elastic Beanstalk Application: ${var.app_name}"
}

resource "aws_elastic_beanstalk_environment" "env" {
    name                = var.env_name
    application         = aws_elastic_beanstalk_application.app.name
    solution_stack_name = "64bit Amazon Linux 2 v3.3.7 running Node.js 14"

    setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name      = "InstanceType"
        value     = "t2.micro"
    }

    setting {
        namespace = "aws:elasticbeanstalk:environment"
        name      = "EnvironmentType"
        value     = "SingleInstance"
    }

    setting {
      namespace = "aws:elasticbeanstalk:container:nodejs"
      name      = "NodeCommand"
      value     = "npm start"
    }
}

resource "aws_s3_bucket" "artifact" {
    bucket = "${var.app_name}-artifact"
    acl    = "private"
}

output "environment_url" {
    description = "The URL of the Elastic Beanstalk Environment."
    value       = aws_elastic_beanstalk_environment.env.endpoint_url
}