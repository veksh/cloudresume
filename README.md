# Cloud Resume

Simple framework designed to automate the deployment of my [resume site](https://resume.veksh.in) on AWS. It was inspired by the [cloud resume challenge](https://cloudresumechallenge.dev/).

## Tools and components

- Terraform to create the necessary infrastructure:
  - AWS S3 bucket to store the files
  - AWS CloudFront distribution to provide https access to them
  - AWS ACM certificate for https
  - GoDaddy [DNS records](https://github.com/veksh/terraform-provider-godaddy-dns) for the main site and for the DNS challenge from ACM
- Ansible to upload site contents to S3 (actually [s3cmd](https://s3tools.org/s3cmd) would be easier, but doing it with Ansible is more fun)
- LaTeX to typeset resume in PDF format
- GitHub actions to trigger
  - PDF resume rebuild on TeX source changes
  - code checks for Terraform and Ansible on PR creation
  - Terraform run on change of infrastructure definitions
  - Ansible run to upload modified HTML and PDF to S3

## External requirements and configuration

- AWS and GoDaddy credentials must be set in repository secrets (`AWS_ACCESS_KEY_ID` + `AWS_SECRET_ACCESS_KEY` and `GODADDY_API_KEY` + `GODADDY_API_SECRET`)
- Terraform expects to have an s3 bucket to keep the state there, steps to create are outlined [in this gist](https://gist.github.com/veksh/c6804b0d32f5138a92fa1cdb7ed67f7d)
- Some values (like bucket name for TF state) are hard-coded to simlpify configuration, review `ansible/upload.yaml` and `terraform/main.yaml` if cloning
- Package list for TeXLive is hard-coded to my resume template requirements

## Notes on operation

It is recommended to manually run `terraform apply` for the first time to create the infrastructure: there is no real dependency between Ansible and Terraform runs, and Ansible may fail to upload files if bucket has not yet been created (it is better to avoid the race, although usually Terraform finishes faster).
