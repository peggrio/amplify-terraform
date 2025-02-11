# Automating Deployment of AWS Amplify Apps with Terraform 🎉

This workshop is a guided example of how you can leverage Terraform and the **[AWS Amplify Libraries for JavaScript](https://docs.amplify.aws/lib/q/platform/js/)** to build fullstack AWS Amplify Apps. With this process, you can have full control over your backend resources, while gaining the benefits of what Amplify can help automate for you.


For getting started quickly, check out **[code examples](https://github.com/novekm/amplify-with-terraform/tree/main/terraform-deployment/examples)**.

For detailed information and step-by-step-guidance, check out the full workshop on **[AWS Workshop Studio](https://catalog.workshops.aws/amplify-with-terraform)**.


## Local Deployment
For starting backend:

```sh
cd terraform-deployment
terraform init #(don't forget to export your aws profile with sufficient permission to run this app)
terraform fmt
terraform plan
terraform apply
```

For starting frontend
```sh
cd frontend-amplify-app
npm i
npm run dev
```


## Cloud deployment

After local testing, push your code to github repo, turn on the github App permission for allowing Amplify connect to your repo, document [here](https://docs.aws.amazon.com/zh_cn/amplify/latest/userguide/setting-up-GitHub-access.html#setting-up-github-app). This step you should manually configured in Amplify console. After authorization, amplify should be able to auto pull down your latest code and deploy it all by its own CI/CD workflows.

### Secret migration
Before starting the frontend, we need to setup Amplify secrets and environment vars for the frontend could fetch the backend secrets(eg. cognito identity pool, api id)

## Troubleshoot
you should give the user who operate the terraform a `cognito-identity:UpdateIdentityPool` permission, put 
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "cognito-identity:UpdateIdentityPool",
            "Resource": "arn:aws:cognito-identity:us-east-1:<your-aws-account-id>:identitypool/us-east-1:<your-cognito-identity-pool-id>"
        }
    ]
}
```
into your IAM policies and attach it to the user

