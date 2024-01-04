# cloudresume

Simple framework to automate deployment of my [resume site](https://resume.veksh.in) on AWS, inspired by [cloud resume challenge](https://cloudresumechallenge.dev/)

## Tools

It uses
- Terraform to create infrastructure: S3 bucket to store the files, CloudFront distribution to provide https access to them, ACM certificate for https and GoDaddy [DNS records](https://github.com/veksh/terraform-provider-godaddy-dns) for the main site and for the DNS challenge from ACM.
- Ansible to update site contents.
- GitHub actions to check code on PR and to trigger Terraform and Ansible runs on data or code changes.

## External requirements and configuration

- AWS and GoDaddy credentials must be set in repository secrets (`AWS_ACCESS_KEY_ID` + `AWS_SECRET_ACCESS_KEY` and `GODADDY_API_KEY` + `GODADDY_API_SECRET`).
- Terraform expects to have an s3 bucket to keep the state there, created like [this](https://gist.github.com/veksh/c6804b0d32f5138a92fa1cdb7ed67f7d)
- Some values (like bucket name for TF state) are hard-coded to simpify configuration, review `ansible/upload.yaml` and `terraform/main.yaml` if cloning.

## Notes on operation

It is better to run first `terraform apply` manually to create infrastructure: there is no real dependency between Ansible and Terraform runs, and Ansible could fail to upload files if bucket is not yet created (it is usually not the case, but better to avoid the race).
