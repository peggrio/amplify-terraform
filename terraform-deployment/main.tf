// This is a template file for a basic deployment.
// Modify the parameters below with actual values
module "sample-qs" {
  source = "./modules/sample-module"

  path_to_build_spec = "../amplify.yml"

  # - Amplify App -
  # Connect Amplify to GitHub
  existing_repo_url              = "https://github.com/peggrio/amplify-terraform"
  lookup_ssm_github_access_token = true                                         // set to true if the resource exists in your AWS Account
  ssm_github_access_token_name   = "github-access-token-amplify-terraform-proj" // name of the parameter in SSM
  app_name                       = "lpz"


  cognito_groups = {
    Admin : {
      name        = "Admin"
      description = "Admin users"
    },
    Standard : {
      name        = "Standard"
      description = "Standard users"
    },

  }

  cognito_users = {
    # Admin Users to create
    PeizhenLiao : {
      username         = "peizhenliao"
      given_name       = "peizhen"
      family_name      = "liao"
      email            = "peizhenliao23@gmail.com"
      email_verified   = true // no touchy
      group_membership = ["Admin", "Standard"]
    },

    # Standard Users to create
    ChangyuWu : {
      username         = "lucaswu"
      given_name       = "lucas"
      family_name      = "wu"
      email            = "lucaswu1999@gmail.com"
      email_verified   = true // no touchy
      group_membership = ["Standard"]
    }
  }

}
