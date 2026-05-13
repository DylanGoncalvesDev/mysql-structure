# 📊 Sprint-2 Task-1 Data Structure (MySQL)

## 📌 Overview

This repository contains multiple relational database systems designed using **MySQL**.  
It includes full database modeling, EER diagrams, SQL scripts, and test queries for different real-world scenarios.

The main objective of this project is to practice:
- Relational database design
- Data normalization
- Foreign key relationships
- Advanced SQL queries (JOIN, GROUP BY, aggregates)
- Realistic database modeling

---

## 🗂 Project Structure

The repository is organized by project and separated into different SQL stages to keep the code clean and easier to maintain.

```
mysql-structure/
│
├── diagrams/
│   ├── Level-1/
│   │   ├── Optic.png
│   │   └── Pizzeria.png
│   │
│   └── Level-2/
│       └── Youtube.png
│
├── scripts/
│   ├── optic/
│   │   ├── 01_schema.sql
│   │   ├── 02_insert_data.sql
│   │   └── 03_test_queries.sql
│   │
│   ├── pizzeria/
│   │   ├── 01_schema.sql
│   │   ├── 02_insert_data.sql
│   │   └── 03_test_queries.sql
│   │
│   └── youtube/
│       ├── 01_schema.sql
│       ├── 02_insert_data.sql
│       └── 03_test_queries.sql
│
└── README.md
```
## 🛠 Technologies

- ![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)

- ![Workbench](https://img.shields.io/badge/MySQL_Workbench-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

- ![SQL](https://img.shields.io/badge/SQL-CC2927?style=for-the-badge&logo=databricks&logoColor=white)

- ![EER Modeling](https://img.shields.io/badge/EER_Modeling-4A90E2?style=for-the-badge&logo=databricks&logoColor=white)

---

## 🚀 Installation Guide

Follow these steps carefully to run the project locally.

---

### 1️⃣ Install prerequisites

Make sure you have the following installed on your system:

- **Git** → https://git-scm.com/downloads  
- **MySQL** → https://dev.mysql.com/downloads/  
- **MySQL Workbench** → https://dev.mysql.com/downloads/workbench/  

After installing Git, verify it:

```bash
git --version
```
---

### 2️⃣ Clone the repository

Open a terminal and run:

```bash
git clone https://github.com/DylanGoncalvesDev/mysql-structure.git
```
Then navigate into the project:

**cd mysql-structure**

---

#### 3️⃣ Open MySQL Workbench

Launch **MySQL Workbench** and connect to your local **MySQL** server.

This tool is used to execute all SQL scripts and manage the databases.

---

### 4️⃣ Navigate to the scripts folder

Inside the repository you will find:

```text
scripts/
```
The scripts are organized by project:

- **optic/**
- **pizzeria/**
- **youtube/**

Each project contains:

- **01_schema.sql**
- **02_insert_data.sql**
- **03_test_queries.sql**

---

### 5️⃣ Run the scripts in order

For each project, execute the files in this order:

- **01_schema.sql**
Creates the database structure, tables, relationships, and constraints.

- **02_insert_data.sql**
Inserts sample data into the database.

- **03_test_queries.sql**
Runs test queries to validate relationships and SQL behavior.

Make sure each script runs successfully before continuing.

---

### 6️⃣ Execute scripts in MySQL Workbench

Open each .sql file and run it using:

- **Execute button** ⚡

- **or**

- **Ctrl + Enter**

This will create the databases, populate them with sample data, and execute test queries.

---

### 7️⃣ Verify the installation

Run some basic queries to check everything is working correctly:

```sql
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Videos;
```

If the queries return data correctly, the installation is successful.

---

## 🧪 Testing

Each project includes test queries to validate:

- Relationships
- Data integrity
- Aggregations
- Business logic

---

## 👤 Author

Created by Dylan Goncalves as a SQL practice project.