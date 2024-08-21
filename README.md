# Hosting Static Website using CloudFront and S3

This Terraform module allows you to easily deploy a static website using CloudFront and S3 on AWS.

## Usage

1. **Clone the repositiry**

   Clone the repository to your local machine.

2. **Install Terraform**
    You can follow the instructions [here](https://developer.hashicorp.com/terraform/install)

3. **Set up an account on AWS**
    You need to have an account on AWS and otherwise create one. [AWS](https://aws.amazon.com)
    After, in section IAM you need to have a user with the following policies:

    **AmazonS3FullAccess**    
    **CloudFrontFullAccess**

4. **Configure AWS CLI**

    You need to have aws CLI installed. You can follow the instructions [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

    You need to have an account on AWS and in the 
  
    To register a user on the AWS CLI, you can use the following command:

    ```
    aws configure
    ```

    This command will prompt you to enter your AWS Access Key ID, AWS Secret Access Key, default region name, and default output format. Once you have provided this information, the user will be registered and you can proceed with the rest of the steps.

    Remember to replace the placeholders with the actual values for your AWS account.

5. **Initialize your configuration**
    ```
    terraform init
    ```

6. **To see the planned changes before applying**
    ```
    terraform plan
    ```

7. **Create the AWS resources**
    ```
    terraform apply
    ```

8. **You will be asked to enter some variables**

    bucket-name (must be unique across all S3 buckets globally)

    environment (for example prod, dev)

    region (for example eu-north-1, us-east-1)

   ![image](https://github.com/user-attachments/assets/e241fefe-a1c4-42dd-bda4-2a6b7d5a8ae9)

   After it is deployed you will get the url to access

   ![image](https://github.com/user-attachments/assets/10ac1436-ae86-4b3b-a541-9551aed352f2)

   ![image](https://github.com/user-attachments/assets/c35c93a7-26db-44da-90ce-690a42478aa1)


