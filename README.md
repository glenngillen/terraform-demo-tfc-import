# Demo of `terraform import` with Terraform Cloud

## Usage

1. Clone this repo
2. Change the `organization` value in `main.tf` to the name of your Terraform Cloud Organization
3. Make sure you're running Terraform v1.1.0 or greater on your local CLI (use `tfenv` to switch if you need). I've tested this with 1.1.4, 1.1.6, and 1.1.7. It should work with any of the >= 1.1.x series though.
4. Run `terraform init`
5. Log into Terraform Cloud, add the appropriate values for `region`, `access_key`, and `secret_key` as variables to your `import-eip` workspace.
6. Log into the AWS Console. Go into the VPC service page and allocate a new Elastic IP.
7. Run `./bin/import-no-local`. Paste in the value of the `Allocation ID` generated in Step 6 when asked. **This will fail**. It is because the import is trying to run locally, but we will not send the value of `sensitive_key` down the wire. This is where people would previously get stuck, becase we would simultaneously not allow you to provide variable values via the CLI.
8. Run `./bin/import`. Paste in the values for your AWS Access Key, Secret Key, and Allocation ID when asked. **This should work!** Go back to Terraform Cloud, into the `import-eip` workspace, and into the "States" tab. Expand out the JSON object and you should see that the state of your Elastic IP has been created.
9. Run `./bin/reset` if you want to run through this flow again.
10. Queue a destroy plan to clean everything up when you're done.