import pandas as pd
import json

# --- STEP 1: Load the category → CompID mapping from Excel ---
excel_path = "../data/model_repair_dataset.xlsx"   
sheet_name = "MODEL"  
df = pd.read_excel(excel_path, sheet_name=sheet_name)

# Filter to only required columns
df = df[["Category", "CompID"]].dropna()

# Build a dict: { "BBOX1.1": "LOC-A", ... }
category_to_compid = dict(zip(df["Category"].astype(str), df["CompID"].astype(str)))

# --- STEP 2: Load your existing categories_complete.json ---
with open("categories_complete.json", "r") as f:
    category_data = json.load(f)

# --- STEP 3: Add CompID to each category ---
for category, info in category_data.items():
    compid = category_to_compid.get(category)
    if compid:
        info["CompID"] = compid
    else:
        info["CompID"] = "UNKNOWN"  # Optional: handle missing CompIDs

# --- STEP 4: Save to new file ---
with open("final_category.json", "w") as f:
    json.dump(category_data, f, indent=4)

print("✅ Merged and saved as 'final_category.json'")
