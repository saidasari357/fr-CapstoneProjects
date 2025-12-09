# 💼 Azure Capstone Projects – Expense Recorder

This repository contains two DevOps capstone projects based on a simple **Expense Recorder** web application (Frontend + Backend).

---

## 🚀 Capstone Project 1  
### ☁️ Deploy Expense Recorder to Azure App Service using Terraform + Deployment Slots

A web app deployed on **Azure App Service (Linux)** using **IaC (Terraform)** with **Staging ➜ Production slot swap** to achieve **zero downtime deployment**.

### 🏗️ Architecture
```text
VS Code → Terraform → Azure App Service Plan → App Service (Staging Slot → Slot Swap → Production)

🛠️ Tech Stack

Component	     Technology

Cloud	     Azure
IaC	          Terraform (AzureRM)
Compute	     Azure App Service (Linux)
Language	     Node.js + HTML/CSS/JS
Deployment     Strategy	App Service Slots (Blue-Green)

📂 Repository Structure

fr-CapstoneProjects/
├── app/           # Frontend + Backend Code
├── infra/         # Terraform IaC
├── app.zip        # Deployable package
└── README.md


🚀 Capstone Project 2
🐳 Deploy Containerized App Using AKS + ACR + GitHub Actions + Trivy + Blue-Green

A Dockerized frontend & backend application deployed to Azure Kubernetes Service (AKS) using a secure CI/CD pipeline with Trivy image scanning and Blue-Green deployment.

🏗️ Architecture
Dev → GitHub → CI/CD (Docker Build + Trivy Scan) → Push to ACR → Deploy to AKS → Blue/Green → User via LB

🛠️ Tech Stack

Component	          Technology

Cloud	          Azure
Orchestration	     AKS
Containerization	Docker
Registry	          Azure Container Registry (ACR)
CI/CD	          GitHub Actions
Security	          Trivy Scan
Frontend	          HTML, CSS, JavaScript
Backend	          Node.js, Express
Deployment          Strategy	Blue-Green

📂 Folder Structure

expense-recorder-aks/
├── frontend/         # UI (Nginx container)
├── backend/          # API (Node.js + Express)
├── k8s/              # Kubernetes manifests (Blue/Green)
├── .github/workflows # CI/CD Pipelines + Trivy Scan
└── README.md


🔗 Full AKS Project Link:
👉 https://github.com/saidasari357/expense-recorder-aks

