output "environment_url" {
    description = "The URL of the Elastic Beanstalk Environment."
    value       = aws_elastic_beanstalk_environment.env.endpoint_url
}