# Terraform-Ansible

Repo for the use of Terraform, Ansible and GitHub Actions to deploy simple EC2 Instances as web servers.

- Terraform creates an EC2 instance, attaches a instance profile with access to S3. EC2 instance has user data configured to pull the Ansible playbook from S3 and run it locally.
- The Ansible playbook is stored in /Ansible in GitHub and it configures a basic website on the new EC2 instance(s). 
- Ansible playbook is stored in S3 ready for deployment and the master pipeline copies the playbook from GitHub to S3 on every run.
- Changes made to Terraform and Ansible code in the Dev branch are pushed to GitHub, a pull request is created to merge the Dev branch into the Master branch. 
- The Dev pipeline runs on the pull request and performs:

  - Terraform Validate to confirm that the TF syntax is correct
  - Ansible Linting to confirm that the playbook is formatted correctly
  - Terraform Plan to what will be deployed
  
- If any errors are seen then the pull request will not allow the merge from Dev into Master occur. 
- If everything is ok or the problem is fixed the pull request can be approved to perform a merge into to Master. 
- On merge the Master pipeline runs and performs:
  
   - Copy of the Ansible Playbook from GitHub to S3
   - Terraform Apply to AWS
   
### Notes

- The Ansible S3 bucket is not private
- The S3 Bucket name is stored in repo secrets and presented as a environment variable during pipeline runs
- AWS IAM Secrets are stored in repo secrets and presented as environment variables during pipeline runs
- The Ansible playbook is basic, purpose of the repo is to validate the interoperability between Terraform, Ansible and GitHub actions rather than a detailed review of the power of Ansible
   
## Potential Future Enhancements

- Use of Terratest (https://terratest.gruntwork.io/) to apply Terraform in a sandbox/test AWS Account on pull request in the Dev branch
- Use of TFSec (https://tfsec.dev/) to perform a static security analysis of the Terraform code on pull request in the Dev branch
- Use of AWS IAM Assume Role into Spoke AWS Accounts from the Root Account in AWS Organisations 
- Support for other Cloud Providers
   
