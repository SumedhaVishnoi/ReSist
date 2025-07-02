# IncomingCode → Component Prediction System

This project builds an intelligent text classification pipeline to automatically predict **failed components** in TRX/PSU units using historical repair data, based on natural language descriptions of failure (IncomingCode).

---

## Objective

Given a textual `IncomingCode` (e.g., *"FAIL - ID-25 BBOX FILE CHECK TEST FID16"*), the system:

1. Classifies it into a **known category** like `BBOX1.1`.
2. Retrieves **mapped CompIDs** (component locations) using `grouping.json`.
3. Counts the frequency of replacements from the Excel repair dataset.
4. Outputs the **most likely failed component (CompID)**.

---

## 🛠️ Components

### 1️⃣ `train.py`
- **Trains a text classifier** using the `IncomingCode` field.
- Input: Incoming description text
- Output: Category label (e.g., `BBOX1.1`, `NCU4.2_28_29`, etc.)
- **Model Options:**
  - TF-IDF + Logistic Regression *(lightweight & interpretable)*
  - BERT (optional for improved language understanding)

---

### 2️⃣ `predict.py`
At runtime, the system follows these steps:

1. **User enters a Fail Description (IncomingCode)**  
   e.g.:FAIL - ID-25 BBOX FILE CHECK TEST FID16

2. **Category Prediction**  
The trained model predicts the category: BBOX1.1


3. **Component Mapping Lookup**  
Uses `grouping.json` to get candidate CompIDs:
```json
["G23002", "V13010", "D121000"]
```

4. **Frequency-Based Decision**
Reads from the Excel repair history and counts:
```json
G23002 → 146 
V13010 → 2
D121000 → 2
```

5. **Output Prediction**
Predicted CompID to Replace: [('G23002', 146), ('V13010', 2), ('D121000', 2)]
 
