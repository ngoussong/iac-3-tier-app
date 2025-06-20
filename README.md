# 📦 Infrastructure 3-Tiers AWS – IaC avec Terraform, Ansible & GitLab CI/CD

Ce projet simule une architecture **3-tiers** en environnement d'entreprise, entièrement déployée sur **AWS** à l'aide d'outils d'Infrastructure as Code (IaC) et dans une approche **DevSecOps**. Il intègre plusieurs environnements (dev, test, prod) et automatise le provisioning, la configuration et la sécurité de l'infrastructure.

---

## 🧱 Architecture Cible

L'infrastructure suit un modèle **3-tiers** :

- **Frontend (Tier 1)** : Application Load Balancer (ALB)
- **Application (Tier 2)** : Instances EC2 déployées dans des subnets privés
- **Base de données (Tier 3)** : RDS (PostgreSQL)

Chaque environnement (`dev`, `test`, `prod`) possède :

- Un **VPC dédié** avec sous-réseaux publics/privés répartis sur **2 AZ** (haute disponibilité)
- Un **bastion host** dans le subnet public pour accéder aux instances EC2 via SSH
- Des **groupes de sécurité** stricts pour isoler les composants
- Un **stockage distant S3** pour l’état Terraform (backend)
- Un déploiement entièrement **automatisé via GitLab CI/CD**

![Architecture Diagram](./architecture.png) <!-- Mettre ici le schéma généré -->

---

## 🛠️ Technologies utilisées

| Composant        | Outil / Service                     |
|------------------|-------------------------------------|
| Cloud Provider   | AWS                                 |
| IaC              | Terraform (modules, remote state)   |
| Configuration    | Ansible                             |
| CI/CD            | GitLab CI/CD                        |
| Sécurité         | IAM, Security Groups, TFSec, Lint   |
| Surveillance     | CloudWatch                          |
| Base de données  | Amazon RDS (PostgreSQL)             |
| Compute          | Amazon EC2                          |
| Réseau           | Amazon VPC, Subnets, ALB, NAT GW    |

---

## 🚧 Structure du projet

├── infra/                      # Infrastructure as Code (Terraform)
│   ├── modules/               # Reusable Terraform modules
│   │   ├── vpc/               # VPC module: networking components
│   │   ├── ec2/               # EC2 module: compute instances
│   │   ├── rds/               # RDS module: database provisioning
│   │   └── alb/               # ALB module: application load balancer setup
│   ├── envs/                  # Environment-specific configurations
│   │   ├── dev/               # Development environment
│   │   ├── test/              # Testing/Staging environment
│   │   └── prod/              # Production environment
│
├── ansible/                   # Configuration management with Ansible
│   ├── roles/                 # Role-based task definitions
│   ├── inventories/           # Inventory files for different environments
│   └── playbook.yml           # Main Ansible playbook
│
├── .gitlab-ci.yml             # GitLab CI/CD pipeline configuration
└── README.md                  # Project documentation



---

## 🔐 DevSecOps

Le pipeline GitLab intègre :

- `terraform fmt`, `validate`, `plan`, `apply`
- `tfsec` et `checkov` pour l'analyse de sécurité
- `ansible-lint` pour la validation des playbooks
- Scan de secrets et validations YAML

---
.
├── infra/                      # Infrastructure as Code (Terraform)
│   ├── modules/               # Reusable Terraform modules
│   │   ├── vpc/               # VPC module: networking components
│   │   ├── ec2/               # EC2 module: compute instances
│   │   ├── rds/               # RDS module: database provisioning
│   │   └── alb/               # ALB module: application load balancer setup
│   ├── envs/                  # Environment-specific configurations
│   │   ├── dev/               # Development environment
│   │   ├── test/              # Testing/Staging environment
│   │   └── prod/              # Production environment
│
├── ansible/                   # Configuration management with Ansible
│   ├── roles/                 # Role-based task definitions
│   ├── inventories/           # Inventory files for different environments
│   └── playbook.yml           # Main Ansible playbook
│
├── .gitlab-ci.yml             # GitLab CI/CD pipeline configuration
└── README.md                  # Project documentation

--

## 📈 Objectifs pédagogiques

- Structurer des projets IaC professionnels
- Automatiser la gestion multi-environnements
- Intégrer IaC dans une chaîne CI/CD complète
- Appliquer les pratiques DevSecOps (scan, tests, sécurité)
- Déployer une architecture scalable et sécurisée sur AWS

---

## 🚀 Lancement rapide

```bash
# Initialiser Terraform dans un environnement (ex : dev)
cd infra/envs/dev
terraform init

# Planifier les changements
terraform plan

# Appliquer l'infrastructure
terraform apply


