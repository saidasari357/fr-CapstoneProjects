# 💼 Azure Capstone Projects – Expense Recorder

This repository contains two cloud-based DevOps projects built around a simple **Expense Recorder** application (Frontend + Backend).  
Both projects demonstrate **real-world deployment strategies on Microsoft Azure**.

---

## 🚀 Capstone Project 1  
### ☁️ Deploy Expense Recorder on Azure App Service using Terraform + Deployment Slots

A web application deployed to **Azure App Service (Linux)** using **Infrastructure as Code (Terraform)**.  
It uses **Staging & Production Slots** to allow **Blue-Green deployment without downtime**.

#### 🔧 Key Features
- Infrastructure automated with **Terraform**
- Deploy application using **App Service Deployment Slots**
- **Zero-Downtime Releases** via Slot Swap
- Node.js + HTML/CSS/JS Expense Recorder App

#### 🏗 Architecture
```text
VS Code → Terraform → Azure Resource Group
           └─ App Service Plan
               └─ App Service (Staging Slot → Slot Swap → Production)


<img width="1317" height="548" alt="expense" src="https://github.com/user-attachments/assets/4a93889e-abb5-4027-9f15-5bb3cc6f2257" />


🛠 Tech Stack
Component	Technology
Cloud	Azure
IaC	Terraform
Compute	App Service (Linux)
Language	Node.js + HTML/CSS/JS
Deployment Strategy	App Service Slots (Blue-Green)


📂 Repository Structure
fr-CapstoneProjects/
├── app/           # Frontend + Backend Code
├── infra/         # Terraform for Azure Resources
├── app.zip        # Deployable package
└── README.md
