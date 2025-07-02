import pandas as pd
import json
from collections import defaultdict

# Step 1: Load category JSON
with open("categories_complete.json", "r") as f:
    category_data = json.load(f)

# Step 2: Load Excel sheet
df = pd.read_excel("../data/model_repair_dataset.xlsx", sheet_name="MODEL")

# Step 3: Clean and extract categories + CompID
df = df[["Category", "CompID"]].dropna()

# Standardize column values (strip + uppercase)
df["Category"] = df["Category"].astype(str).str.strip()
df["CompID"] = df["CompID"].astype(str).str.strip().str.upper()

# Step 4: Build compid → list of categories mapping
compid_to_categories = defaultdict(list)

for _, row in df.iterrows():
    category = row["Category"]
    compid = row["CompID"]

    # Only map if category is in your metadata JSON
    if category in category_data:
        compid_to_categories[compid].append(category)

# Optional: remove duplicates per CompID
for compid in compid_to_categories:
    compid_to_categories[compid] = sorted(list(set(compid_to_categories[compid])))

# Step 5: Save final mapping
with open("compid_to_categories.json", "w") as f:
    json.dump(dict(compid_to_categories), f, indent=4)

print("✅ compid_to_categories.json regenerated successfully.")
