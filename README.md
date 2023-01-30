![About Terraform](images/terraform_1.png)
![Terraform Life Cycle](images/terraform_2.png)
![Installing Terraform](images/terraform_3.png)
![Verify Installation](images/terraform_4.png)
![Terraform Commands](images/terraform_5.png)
![Write your First Project](images/terraform_6.png)
![State file Good Practices](images/terraform_7.png)
![Ideal Terraform Setup](images/terraform_8.png)
![Modules in Terraform](images/terraform_9.png)
![Problems with Terraform](images/terraform_10.png)
![Terraform Interview Questions](images/terraform_11.png)


# Terraform Workflow mainly 4 commands:

# 1. terraform init   
                   This command downloads the provider plugins and one version lock file
and will create one (.terraform) hidden directory and (.terraform.lock.hcl) contains 
version.

# 2. terraform plan
                    This command generates an execution plan like blue print whatever 
resources will create.

# 3. terraform apply 
                    This command generates one (terraform.tfstate)file. It contains 
resources data in the form of Json. This command creates the resources in aws cloud.
whatever cloud provider you declared in provider block.

# 4. terraform destroy
                      This command destroy the total resources whatever you created.