# Faulty Component Prediction Using Category Mappings

This Folder includes categorized repair descriptions and mapped component histories to identify the **most likely faulty component** based on user-input **Fail IDs**.
---

## 📁 Files Used

### `categories_complete.json`
- **Purpose:** Maps Fail ID strings (e.g., `ID-25`) to their respective category names (e.g., `BBOX1.1`).
- **Example:**
```json
    "BBOX1.1": {
        "Description": "FAIL - ID-25 BBOX FILE CHECK TEST FID16",
        "ids": [
            "ID-25"
        ]
    }
```

### `grouping.json`
- **Purpose:** Maps categories to all CompIDs (component locations) where that category was found to be replaced.
- **Supports:** Many-to-many mapping (one category → multiple CompIDs).
- **Example:**
  ```json
      "V13010": [
        "5.1_17-20",
        "5_17,18,19,20",
        "BBOX1.1",
        "NCU4.1_27",
        "NCU4.3_27_28",
        "NCU4.6_27",
        "sanity7.2",
        "sanity7.3"
    ]
  ```


### How the Prediction Works

1. **User Input:** A repair engineer inputs a Fail ID {ex: ID-25}
2. **Category Lookup:** The script looks up ID-25 in categories_complete.json and finds the associated category
3. **Component Mapping:** It then searches for BBOX1.1 in grouping.json and gets all associated CompIDs
4. **Component Frequency Count:** From the Excel dataset of past repairs, it counts how many times each of these CompIDs was actually replaced for this category.
5. **Prediction Output:** The system outputs the most frequently replaced CompID among them as the predicted component to be replaced

   
TL;DR
- Categories were manually curated from raw repair descriptions and grouped under logical names like BBOX1.1, NCU4.2, etc.
- A single CompID may belong to multiple categories.
- These JSON files make the model interpretable and adaptable for rule-based predictions.

