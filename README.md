# CI/CD Pipeline with GitHub Actions for Automated Deployment and Rollback

## Description
This template contains a solution which configures a GitHub Actions workflow to automate the deployment of simple Node.js application to Amazon ECS (Elastic Container Service).

## Prerequisites
Before you can deploy this application, you need to have the following prerequisites:
- **AWS Account**
- **GitHub Actions Secrets**
  - `AWS_ACCESS_KEY_ID`: Your AWS Access Key ID.
  - `AWS_SECRET_ACCESS_KEY`: Your AWS Secret Access Key.
  - `AWS_REGION`: The AWS region where your resources are deployed.
- **Infrastructure**
  - Amazon ECR: Repository to store images.
  - Amazon ECS: Cluster, Service and Task definition to run container on Fargate.

## Steps to Deploy the CI/CD pipeline
- Clone this repository to your local machine by using the command shown below,
  ```
  git clone https://github.com/SahilT-18/ve3-assessment.git
  ```

- Next, you have to confirm that the required infrastructure for the application deployment is orchestrated by moving to the AWS Console.

- Replace the `ecs-task-definition.json` wtih your newly created task definition, you can do that from the Elastic Container Service, moving to Task Definitions section and click on *JSON* option in the AWS Console. You can check the file present in the repository for reference.

- Go to the `deploy.yml` file present in workflow directory where you have to replace the environment variables values according to your requirement.

- Commit and push all the changes to your GitHub repository once you have done all the modifications.

- Navigate to your GitHub repository, go to **Actions** tab and click on **Run workflow** to start the deployment process because in this template solution the trigger is kept as `workflow_dispatch`. This will trigger the pipeline to build and deploy your application to AWS ECS Fargate.
