# Udacity Capstone
------------
## Status: [![leidos-bud](https://circleci.com/gh/leidos-bud/capstone.svg?style=svg)]()
------------

#### Summary
>- This project deploys [A DuckHunt Game](https://github.com/MattSurabian/DuckHunt-JS) running on a KOPS Kubernetes cluster deployed to AWS.

### Deployment Requirements:
------------
>- AWS Account & AWS CLI 2.x / Credentials Configured [AWS CLI Instructions](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html) and [KOPS Requirements](https://kubernetes.io/docs/setup/production-environment/tools/kops/#before-you-begin)
>- KOPS Binary Installed [Instructions](https://kubernetes.io/docs/setup/production-environment/tools/kops/#1-5-install-kops)
>- KUBECTL Binary Installed [Instructions](https://kubernetes.io/docs/tasks/tools/)
>- Subdomain hosted in AWS Route53 -- see instructions [HERE](https://kubernetes.io/docs/setup/production-environment/tools/kops/#2-5-create-a-route53-domain-for-your-cluster)
>- AWS S3 Bucket for cluster state -- see instructions [HERE](https://kubernetes.io/docs/setup/production-environment/tools/kops/#3-5-create-an-s3-bucket-to-store-your-clusters-state)
>- Current Release of macOS or Linux
>- Docker Desktop or Equivalent [Instructions](https://docs.docker.com/engine/install/binaries/)
>- Ansible 2.9+
>- Python 3.5+

## Deployment Steps (assuming above requirements are met)
------------
>1. Clone this repo
>2. From the repo root folder, run `ansible-playbook ansible/kops_deploy.yml` to deploy the KOPS cluster instance(s) to AWS
>3. From the repo root folder, run `docker build -t foo/foo-duckhunt:1.2.3 .` to build the Docker container (change tag foo/foo-duckhunt:1.2.3 as needed for your Docker account or other public repository)
>4. Run `kubectl create deployment your-deployment-name --image=foo/foo-duckhunt:1.2.3` to create a Kubernetes deployment
>5. Run `kubectl expose deployment udacity-duckhunt --port=80 --target-port=8080 --name=duckhunt --type=LoadBalancer` to expose the deployment and create the load balancer
>6. Run `kubectl get services | grep duckhunt | awk {'print $4'}` to retrieve the AWS Load Balancer DNS Name
>7. Create desired DNS CNAME record on your domain to point to AWS Load Balancer DNS Name retrieved above
>8. Open http://your.dns.cname in a browser and enjoy

## Folder Structure
------------
```
├─.circleci                               - CircleCI CI/CD Folder
├─────config.yml                          - CircleCI CI/CD Parameters
├─ansible                                 - Ansible playbook(s) & role(s)
├─Dockerfile                              - Definitions for building Docker container image
├─duckhunt                                - DuckHuntJS Source from (https://github.com/MattSurabian/DuckHunt-JS)
├─.gitignore                              - Git File/Folder Ignore Definition
└─README.md                               - This Document                                       - 
```