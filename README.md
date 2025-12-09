
# 💼 Capstone Projects – Azure Cloud (Expense Recorder)

This repository contains my Azure-focused DevOps capstone projects based on a simple **Expense Recorder** application (Frontend + Backend).

- **Capstone Project 1** → Expense Recorder on **Azure App Service** using **Terraform + Deployment Slots**
- **Capstone Project 2** → Expense Recorder on **Azure Kubernetes Service (AKS)** using **Docker + ACR + GitHub Actions + Trivy + Blue-Green**

---

## 🧩 Capstone Project 1  
### Expense Recorder Deployment (Frontend + Backend) on Azure using Terraform & App Service Slots

A simple **Expense Recorder web app** (Node.js + HTML/CSS/JS) deployed to **Azure App Service (Linux)** using **Infrastructure as Code** with Terraform.

The main goal is to show how to:
- Provision Azure resources using Terraform
- Deploy a web application to App Service
- Use **staging + production slots** to achieve **zero-downtime deployment** (Blue-Green style)

---
🏗 Architecture (Capstone 1)
Local Machine (VS Code)
     │
     │  Terraform (azurerm)
     ▼
Resource Group ── App Service Plan ── App Service (Prod Slot)
                                └── Staging Slot
                                      │
                                      └─> Slot Swap → Zero-downtime Release

🛠 Tech Stack
Cloud: Azure
IaC: Terraform (AzureRM provider)
Compute: Azure App Service (Linux)
Language: Node.js (Express) + HTML/CSS/JavaScript
Deployment Strategy: App Service Slots (Staging → Production)

📁 Repository Structure
fr-CapstoneProjects/
├── app/           # Application code (Frontend + Backend) for Expense Recorder
├── infra/         # Terraform code for Azure infrastructure (App Service, Plan, etc.)
├── app.zip        # Zipped app package for easy deployment via Portal/Deployment Center
└── README.md      # Project documentation

<img width="1565" height="916" alt="image" src="https://github.com/user-attachments/assets/0226061d-9868-40ed-b1c7-089030423bae" />


# Capstone Project 2: Build and deploy a Frontend + Backend application using Docker containers and Kubernetes on Azure.
The deployment uses Blue-Green strategy with zero-downtime, fully automated through GitHub Actions.
Images are security-scanned with Trivy before deployment to production.

✨ The main goal is to demonstrate secure CI/CD + cloud deployment + zero-downtime release strategy.

📁 Folder Structure
expense-recorder-aks/
│
├── frontend/                 # Frontend UI (HTML, CSS, JS)
│   ├── index.html
│   ├── styles.css
│   ├── script.js
│   └── Dockerfile            # Docker build for frontend (Nginx)
│
├── backend/                  # Backend API (Node.js + Express)
│   ├── server.js
│   ├── package.json
│   └── Dockerfile            # Docker build for backend
│
├── k8s/                      # Kubernetes deployment manifests
│   ├── frontend-deployment-blue.yaml
│   ├── frontend-deployment-green.yaml
│   ├── frontend-service.yaml
│   ├── backend-deployment-blue.yaml
│   ├── backend-deployment-green.yaml
│   └── backend-service.yaml
│
├── .github/
│   └── workflows/            # CI/CD pipelines (GitHub Actions)
│       ├── ci-cd-frontend.yml
│       └── ci-cd-backend.yml
│
└── README.md                 # Project documentation

🏗 Architecture
            ┌─────────────────────────────┐
            │       Developer Commit       │
            └──────────────┬──────────────┘
                           │ Push (GitHub)
                           ▼
                  ┌───────────────────────┐
                  │     GitHub Actions     │
                  │  (CI/CD + Trivy Scan)  │
                  └─────────┬─────────────┘
            Build & Scan    │ Deploy
                   ┌────────▼────────┐
                   │        ACR      │
                   │ (Image Storage) │
                   └────────┬────────┘
                            │ Pull
                            ▼
                  ┌───────────────────────┐
                  │     Azure AKS         │
                  │   Kubernetes Cluster   │
                  │  Blue ⇄ Green Deploy   │
                  └────────┬──────────────┘
                           │
         ┌─────────────────┴─────────────────┐
         │                                   │
 ┌──────────────┐                     ┌───────────────┐
 │ Frontend Pod │                     │ Backend Pod   │
 │ LoadBalancer │                     │ ClusterIP      │
 └──────────────┘                     └───────────────┘
         │                                  ▲
         │   HTTP Requests                   │ Internal API Calls
         ▼                                  │
   🌐 User Browser                       📌 Expense API

---
link: https://github.com/saidasari357/expense-recorder-aks.git
