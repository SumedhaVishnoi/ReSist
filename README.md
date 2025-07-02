# 🌐 Web Interface for Incoming Code Prediction

This folder features a browser-based UI that allows users to either **enter a full Incoming Code description** or **look up the description using just a Fail ID**, and then predict the most likely **faulty component (CompID)** using a trained machine learning model.

---

## 🗂️ Project Files

| File                   | Purpose                                                 |
|------------------------|---------------------------------------------------------|
| `index.html`           | Main entry page with prediction functionality           |
| `select_description.html` | Lookup page to find full failure descriptions using a Fail ID |


| `predict.py`           | Backend script that loads the model and makes predictions |
| `categories_complete.json` | Maps Fail IDs to failure categories                   |
| `grouping.json`        | Maps categories to list of CompIDs                      |
| `repair_dataset.xlsx`  | Dataset containing component replacement history        |

---

##  How It Works

### 📄`index.html` – Main Page

- Contains an **"Enter Incoming Code"** input box.
- Once the user types in the full test result (e.g., *"FAIL - ID-25 BBOX FILE CHECK TEST FID16"*) and clicks **"Make Prediction"**, the trained model is triggered.
- The model:
  - Predicts the category (e.g., `BBOX1.1`)
  - Retrieves associated CompIDs from `grouping.json`
  - Analyzes past replacement data in `repair_dataset.xlsx`
  - Returns the most frequently replaced component

---

### 📄`select_description.html` – Lookup Page

- Located via a **"Select Description"** button on the top of the main page.
- If a user **only knows the Fail ID** (e.g., `ID-25`), this page allows them to:
  - Search the Fail ID
  - View the full repair description
  - Copy it back to `index.html` for prediction

> This allows flexibility in input format — whether the engineer knows the full Incoming Code or just the ID, the system can support both.
---

## Prediction Example

1. **User enters:**
FAIL - ID-25 BBOX FILE CHECK TEST FID16

 
2. **System predicts:**
- Category: `BBOX1.1`
- Candidate CompIDs: `["V65016", "G23002", "X10101"]`
- Most frequent from data: `V65016`

---

## 📌 Notes

- The model understands both:
- **Full failure descriptions**
- **Just Fail IDs** (via lookup and categorization)
- Trained using **TF-IDF + Logistic Regression** or **BERT** for better accuracy
- Predictions are based on real replacement frequencies for reliability

---

## Designed For

Nokia repair engineers who want an intuitive interface for **quick prediction** and **description assistance**, especially when working with **test stations** like RAP, OAT, and LBTS.

---
