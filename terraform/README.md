## Terraform

### Implementing EKS Cluster

Deployment

`terraform plan`

`terraform apply --auto-aprove`

## EKS configuration

```
eksctl create iamserviceaccount \
  --cluster=gyf-uala-test-dev-cluster \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --attach-policy-arn=arn:aws:iam::501853673872:policy/AWSLoadBalancerControllerIAMPolicy \
  --override-existing-serviceaccounts \
  --approve
```

```
aws iam attach-role-policy \
  --role-name $(aws cloudformation describe-stack-resources --stack-name $(aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE | jq ".StackSummaries[0].StackName" | sed 's/"//g') | jq ".StackResources[0].PhysicalResourceId" | sed 's/"//g') \
  --policy-arn arn:aws:iam::501853673872:policy/AWSLoadBalancerControllerAdditionalIAMPolicy
```

```
aws eks --region us-east-1 update-kubeconfig --name gyf-uala-test-dev-cluster
```

```
aws iam attach-role-policy \
  --role-name <CLOUDFORMATION_PHYSICAL_RESOURCE_ID> \
  --policy-arn arn:aws:iam::501853673872:policy/AWSLoadBalancerControllerAdditionalIAMPolicy
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.5.4/cert-manager.yaml
kubectl apply -f ./helm/adidas-challenge/files/v2_2_1_full.yaml
```