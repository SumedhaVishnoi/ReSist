# 🗂️ Dataset Structure & Category Definitions

This document provides a detailed explanation of the categories and features used in the dataset for predicting faulty components in units based on error codes

---

## Dataset Overview

The dataset consists of **1056 records** (960 TRX units, 96 PSU units) collected from the repair workflow at Nokia stations.
Each record includes metadata, test results, and final replaced components.

---

## 📁 Key Fields and Categories

### 🔹 `Incoming_Test_Result`
- **Components:**
  - **Pass/Fail:** Binary
  - **Categories:** Fail codes are given as 'FAIL - ID-25 BBOX FILE CHECK TEST F1D16, ID-27 NCU DETECTION MADE 2'
  - Hence Multiple categories were made such as
  - 1. BBOX
    2. NCU
    3. SELFCAL TEST
    4. CONNECT MADE
    5. POWER RESET TEST 
    6. CONNECT MASTER CPU
    7. ANT POWER BF (MADE,TRX)
    8. READ MADE EYE 
    9. yet to be added
    10. yet to be added
    11. yet to be added  

---
### 🔹 `Module_Test_Result`
- **Components:**
  - **Pass/Fail:** Binary
  - **Categories:**
  - 1. M04
    2. M32
---


### 🔹 `Replaced_Components`
- **CompID:** Location of the faulty component
- **CompCode:** The replaced component
- - **CompType:** The details of the replaced component
- **Purpose:** This is the **target** variable for the ML model.

 
##  Engineered Features

| Feature | Description |
|--------|-------------|
| `combo_code` | Concatenation of Incoming and Module error codes (e.g., `E10_M210`) |
| `yet to add` | yet to add |
| `yet to add` | yet to add |
| `yet to add` | yet to add |

---

## 🏷️ Target Labels (Components Replaced)

- **Multi-label Format**: A single record may involve replacement of more than one component.
- **Examples of Labels:**
  - `X` – Main Power IC
  - `Y` – RF Driver
  - `Z` – Clock Buffer
  - `P`, `Q`, `R` – (Other internal codes as per board)

These labels are used for classification by the ML model.

---

##  Labeling Strategy

- yet to add
- yet to add
---

## 🧽 Notes on Preprocessing

- Text fields normalized to uppercase
- Null rows removed (especially missing Unit_ID or codes)
- Categories encoded using LabelEncoder / OneHotEncoder based on model type
- Stratified sampling used if labels are imbalanced

---

## 📂 Example Row (After Processing)

| Unit SNo      | ModuleItemCode| UnitSource | IncomingCode                      | Categories | ModuleCode | ErrorCombo    | CompID | CompCode | CompType                                | IN Material Code | OUTMaterialCode | line_after_incoming_test
|---------------|---------------|------------|-----------------------------------|------------|------------|------------- -|--------|----------|-----------------------------------------|------------------|-----------------| 
| NQ232590938   | 093169A.106   | TRX        | FAIL - ID- 27 NCU DETECTION MADE 5| NCU4.5_27  |   M32      | NCU4.5_27_M32 | D165000| P566964  | IC-ASIC MADE2 B0 WITH ULBEAM PRQ/QCP4.0 | 476383A.108      | 476383A.108     | TRX _PAASSEMBLY FAULTY REPAIRED 
						
---

## Usage in Model

The final dataset with categorized and engineered features is used to train classification models such as:
- `RandomForestClassifier`
- `XGBoostClassifier`
- Fallback: Rule-based on combo_code probabilities

---

## Final Notes

- Component categories may evolve as more failure types are logged.
- Error codes are derived from structured test logs and are deterministic in nature.
- Dataset is used for internal prediction and automation at Nokia repair facilities.

---

