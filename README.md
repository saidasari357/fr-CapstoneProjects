# 💼 Capstone Projects – Azure Cloud (Expense Recorder)

This repository contains my Azure-focused DevOps capstone projects based on a simple **Expense Recorder** application (Frontend + Backend).

- **Capstone Project 1** → Expense Recorder on **Azure App Service** using **Terraform + Deployment Slots**
- **Capstone Project 2** → Expense Recorder on **Azure Kubernetes Service (AKS)** using **Docker + ACR + GitHub Actions + Trivy + Blue-Green**

---

## 🧩 **Capstone Project 1**
### 📌 Expense Recorder Deployment (Frontend + Backend) on Azure using Terraform & App Service Slots

A simple **Expense Recorder web app** (Node.js + HTML/CSS/JS) deployed to **Azure App Service (Linux)** using **Infrastructure as Code (IaC)** with Terraform.

### 🎯 **Objectives**
- Provision Azure infrastructure using Terraform
- Deploy a web application to Azure App Service
- Use **Staging + Production Slots** to achieve **zero-downtime deployment (Blue-Green Strategy)**

---

### 🏗 **Architecture (Capstone 1)**

```text
Local Machine (VS Code)
     │
     │  Terraform (azurerm)
     ▼
Resource Group ── App Service Plan ── App Service (Prod Slot)
                                └── Staging Slot
                                      │
                                      └─> Slot Swap → Zero-downtime Release

🛠 Tech Stack

Component	     Technology
Cloud	     Azure
IaC	          Terraform (AzureRM)
Compute	     Azure App Service (Linux)
Language	     Node.js (Express) + HTML/CSS/JavaScript
Deployment     Strategy	App Service Slots (Staging → Production)

📁 Repository Structure

fr-CapstoneProjects/
├── app/           # Application code (Frontend + Backend)
├── infra/         # Terraform code for Azure resources (App Service, Plan, etc.)
├── app.zip        # Packaged ZIP for quick deployment via Portal/Deployment Center
└── README.md      # Project documentation

📌 Screenshot:

<img width="800" alt="image" src="https://github.com/user-attachments/assets/0226061d-9868-40ed-b1c7-089030423bae" />

>
🚀 Capstone Project 2
Build & Deploy Frontend + Backend Using Docker, Kubernetes & Blue-Green Deployment on Azure AKS

This project deploys a complete Expense Recorder application using Dockerized microservices and a secure CI/CD pipeline on Azure Kubernetes Service (AKS).

✨ Goal

To demonstrate secure CI/CD + Kubernetes deployment using:
Docker
Azure Container Registry (ACR)
GitHub Actions CI/CD
Trivy Security Scanning
Blue-Green Deployment on AKS

📁 Folder Structure (Capstone 2)
expense-recorder-aks/
│
├── frontend/                 # Frontend UI (HTML, CSS, JS)
│   ├── index.html
│   ├── styles.css
│   ├── script.js
│   └── Dockerfile            # Dockerfile for Nginx-based frontend
│
├── backend/                  # Backend API (Node.js + Express)
│   ├── server.js
│   ├── package.json
│   └── Dockerfile            # Dockerfile for backend API
│
├── k8s/                      # Kubernetes manifests (Blue/Green Deploy)
│   ├── frontend-deployment-blue.yaml
│   ├── frontend-deployment-green.yaml
│   ├── frontend-service.yaml
│   ├── backend-deployment-blue.yaml
│   ├── backend-deployment-green.yaml
│   └── backend-service.yaml
│
├── .github/
│   └── workflows/            # CI/CD pipelines (GitHub Actions + Trivy)
│       ├── ci-cd-frontend.yml
│       └── ci-cd-backend.yml
│
└── README.md                 # Documentation

🏗 Architecture (Capstone 2)
            ┌─────────────────────────────┐
            │        Developer Commit      │
            └──────────────┬──────────────┘
                           │ Push (GitHub)
                           ▼
                  ┌───────────────────────┐
                  │     GitHub Actions     │
                  │  (CI/CD + Trivy Scan)  │
                  └─────────┬─────────────┘
             Build & Scan   │  Deploy
                   ┌────────▼────────┐
                   │        ACR      │
                   │ (Image Storage) │
                   └────────┬────────┘
                            │ Pull
                            ▼
                  ┌────────────────────────┐
                  │         Azure AKS       │
                  │  Kubernetes Cluster     │
                  │ Blue ⇄ Green Deploy     │
                  └─────────┬──────────────┘
                           │
         ┌─────────────────┴─────────────────┐
         │                                   │
 ┌──────────────┐                     ┌───────────────┐
 │ Frontend Pod │                     │ Backend Pod   │
 │ LoadBalancer │                     │ ClusterIP     │
 └──────────────┘                     └───────────────┘
         │                                  ▲
         │   HTTP Requests                   │ Internal API Calls
         ▼                                  │
   🌐 User Browser                       📌 Expense API

🔗 Project Repository (Capstone 2):
👉 https://github.com/saidasari357/expense-recorder-aks.git
