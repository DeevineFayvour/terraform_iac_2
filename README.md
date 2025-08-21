## How to Deploy

Follow these steps to deploy the infrastructure.

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/DeevineFayvour/terraform_iac_basic.git
    cd terraform_iac_basic
    ```

2.  **Initialize Terraform:**
    ```bash
    terraform init
    ```

3.  **Create a `terraform.tfvars` file:**
    Provide values for the variables defined in `variables.tf`. Create a file named `terraform.tfvars` in the root directory and add values.

4.  **Plan the Deployment:**
    Run a `plan` to see what resources Terraform will create.
    ```bash
    terraform plan
    ```

5.  **Apply the Configuration:**
    If the plan looks correct, apply the changes to your AWS account.
    ```bash
    terraform apply
    ```
    Type `yes` to confirm the deployment.

## Outputs

After a successful deployment, Terraform will output key information, which you can use to interact with your new infrastructure. The outputs are defined in the modules and are collected in the root module.

You can view the outputs at any time using `terraform output`.

## Cleaning Up

To destroy the infrastructure and avoid any ongoing AWS costs, run:

```bash
terraform destroy

```
