# 💊🔗 Blockchain-Native Pharmaceutical Supply Chain Tracker

![Solidity](https://img.shields.io/badge/Solidity-^0.8.x-363636?logo=solidity)
![Ethereum](https://img.shields.io/badge/Blockchain-Ethereum-3C3C3D?logo=ethereum)
![MetaMask](https://img.shields.io/badge/Wallet-MetaMask-E2761B?logo=metamask&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Active-success)

Pharmaceutical supply chains involve multiple stakeholders and are highly vulnerable to **counterfeit drugs**, **manual record manipulation**, and **lack of end-to-end visibility**.

This project implements a **blockchain-native pharmaceutical supply chain tracking system** where every medicine batch is recorded **immutably on the blockchain**, ensuring **transparency**, **traceability**, and **trust** — without relying on centralized databases or intermediaries.

Each batch follows a **strictly enforced lifecycle** controlled entirely by a smart contract ⚙️.

---

## 🎯 Project Goals

- Prevent counterfeit drugs  
- Ensure end-to-end traceability  
- Remove centralized intermediaries  
- Enforce business logic on-chain  
- Enable public batch verification  

---

## 🚀 Key Features

✅ End-to-end medicine batch traceability  
🔐 Role-based access control  
*(Admin, Supplier, Transporter, Manufacturer, Distributor, Pharmacy)*  
🧾 Immutable & transparent blockchain records  
🦊 Decentralized authentication via MetaMask  
⚡ Real-time batch status verification  
❌ No backend server or centralized database  

---

## 🤔 Why Blockchain?

Traditional pharmaceutical supply chains rely on centralized databases, which are prone to **data tampering**, **single points of failure**, and **counterfeit injection**.

Blockchain enables:
- 🔒 Immutable audit trails  
- 🔍 Trustless verification  
- 🌐 Decentralized control  
- 🧠 Smart contract–enforced rules  

This system leverages **Ethereum smart contracts** to enforce supply-chain logic directly **on-chain**, eliminating the need for intermediaries.

---

## 🧠 How the System Works

1️⃣ **Admin** deploys the smart contract and assigns role addresses  
2️⃣ **Supplier** creates a new medicine batch on the blockchain  
3️⃣ The batch moves sequentially through:

- 🚚 Transporter  
- 🏭 Manufacturer  
- 📦 Distributor  
- 🏪 Pharmacy  

4️⃣ Each transfer updates the batch state **immutably on-chain**  
5️⃣ **Pharmacy** verifies and marks the batch as sold  
6️⃣ **Any user** can verify batch authenticity using the batch ID  

✨ All operations are **validated and enforced by the smart contract itself**.

---

## 🏗️ System Architecture

The system follows a **fully decentralized blockchain architecture** where
all supply-chain operations are executed and validated by smart contracts,
without any centralized backend.

<p align="center">
  <img src="screenshots/system-architecture.png" width="800"/>
</p>

<p align="center">
  <i>Figure: Blockchain-based Pharmaceutical Supply Chain System Architecture</i>
</p>

---

## 🔑 Role Permissions

| Role | Permissions |
|----|----|
| Admin | Deploy contract, assign role addresses |
| Supplier | Create medicine batches |
| Transporter | Deliver batches to manufacturer |
| Manufacturer | Dispatch batches to distributor |
| Distributor | Forward batches to pharmacy |
| Pharmacy | Verify & mark batches as sold |
| Public User | Track batch authenticity |

---

## ⚙️ Technology Stack

- ⛓️ **Blockchain:** Ethereum  
- 📜 **Smart Contracts:** Solidity ^0.8.x  
- 🦊 **Wallet:** MetaMask  
- 🧪 **Local Blockchain:** Ganache  
- 🎨 **Frontend:** HTML, CSS, JavaScript  
- 🔗 **Blockchain Interface:** Web3.js (CDN)  

---

## 📁 Project Structure

```

blockchain-pharmacy-supply-chain/
│
├── contracts/
│   └── PharmacySupplyChain.sol
│
├── frontend/
│   ├── index.html
│   ├── app.js
│   └── style.css
│
├── screenshots/
│   ├── system-architecture.png
│   ├── 01-ganache.png
│   ├── 02-metamask.png
│   ├── 03-admin-roles.png
│   ├── 04-supplier-create.png
│   ├── 05-transporter.png
│   ├── 06-manufacturer.png
│   ├── 07-distributor.png
│   ├── 08-pharmacy.png
│   └── 09-tracking.png
│
├── docs/
├── README.md
├── LICENSE
└── .gitignore

```

---

## ▶️ Getting Started

### 📌 Prerequisites

- 🧪 Ganache  
- 🦊 MetaMask browser extension  
- 🧠 Remix IDE  
- 🌐 Modern web browser  

⚠️ **No Node.js, Truffle, or backend setup is required**

---

## 🔧 Setup & Execution

1️⃣ Deploy `PharmacySupplyChain.sol` using Remix & MetaMask  
2️⃣ Copy deployed **contract address & ABI**  
3️⃣ Paste both into `frontend/app.js`  
4️⃣ Open `frontend/index.html` in browser  
5️⃣ Interact using different role accounts  

---

## 📸 Results & Screenshots

### Ganache Local Blockchain
![Ganache](screenshots/01-ganache.png)

### MetaMask Wallet Connection
![MetaMask](screenshots/02-metamask.png)

### Admin – Role Assignment
![Admin](screenshots/03-admin-roles.png)

### Supplier – Create Medicine Batch
![Supplier](screenshots/04-supplier-create.png)

### Transporter – Delivery Confirmation
![Transporter](screenshots/05-transporter.png)

### Manufacturer – Dispatch to Distributor
![Manufacturer](screenshots/06-manufacturer.png)

### Distributor – Workflow
![Distributor](screenshots/07-distributor.png)

### Pharmacy – Verify & Sell
![Pharmacy](screenshots/08-pharmacy.png)

### Batch Tracking Output
![Tracking](screenshots/09-tracking.png)

---

## 🧪 Test Scenarios

- Valid batch lifecycle execution  
- Invalid role access (reverted)  
- Incorrect state transitions blocked  
- Public batch verification  
- Multiple batches tracked simultaneously  

---

## 📜 Smart Contract Highlights

- Finite-state machine for lifecycle control  
- Strict role-based modifiers  
- On-chain validation of transitions  
- Event-driven traceability  
- No external dependencies  

---

## 💡 Potential Use Cases

- Pharmaceutical manufacturers  
- Drug distributors & wholesalers  
- Regulatory compliance auditing  
- Consumer authenticity verification  
- Supply-chain transparency platforms  

---

## 🔐 Security Model

- 🔑 Role-based access enforced on-chain  
- ❌ No hard-coded credentials or private keys  
- ✍️ Transactions signed via MetaMask  
- 🧾 Immutable blockchain data storage  

---

## ⚠️ Configuration Note

The deployed smart contract **address and ABI are intentionally excluded**
from this repository.

After deploying locally:
1. Copy contract address  
2. Copy ABI from Remix  
3. Paste both into `frontend/app.js`

---

## ⚠️ Limitations

- Local blockchain (Ganache) only  
- No IoT or cold-chain integration yet  
- UI optimized for demo purposes  

---

## ✨ Future Enhancements

- QR / RFID-based verification  
- IoT-enabled cold-chain monitoring  
- IPFS document storage  
- Mobile application support  
- Deployment to public testnets  

---

## 👨‍💻 Author

**Darshan Dayanand Naik**  
🚀 Artificial Intelligence & Data Science Professional  

📍 Bangalore, India  
🔗 GitHub: https://github.com/darshandayanandnaik01  

---

## 📜 License

📝 This project is licensed under the **MIT License**.
