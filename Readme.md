## Deploy Kubernetes Infrastructure to Hetzner

- makes sure terraform v1.9.5 or newer is installed check with `terraform --version`
- cd into folder infrastructure/kubernetes
- create an ssh public and private key locally with `ssh-keygen`
- create file `terraform.tfvars` and paste in the line:
  - `MAIN_SSH_KEY = "Your public SSH Key"`
- store your hcloud API token of project to env variable `TF_VAR_HCLOUD_API_TOKEN`
- run `terraform init`
- run `terraform plan`
- run `terraform apply --auto-approve`
- right now I get error:
  - Error: json: cannot unmarshal number 504340833176337 into Go struct field Action.action.id of type int
    │
    │   with hcloud_network_subnet.kubernetes-node-subnet,
    │   on main.tf line 61, in resource "hcloud_network_subnet" "kubernetes-node-subnet":
    │   61: resource "hcloud_network_subnet" "kubernetes-node-subnet" {
