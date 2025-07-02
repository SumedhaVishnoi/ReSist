import joblib
import json
from collections import Counter
import pandas as pd

# Load model, JSONs, Excel
model = joblib.load("category_predictor.pkl")
df = pd.read_excel("../data/model_repair_dataset.xlsx", sheet_name="MODEL")
print("COLUMN NAMES:", df.columns.tolist())

with open("../categories/grouping.json", "r") as f:
    grouping_json = json.load(f)

#Prediction + frequency lookup
# def predict_top3_compids_from_fail_string(fail_description):
#     predicted_category = model.predict([fail_description])[0]

#     # Find CompIDs from grouping.json
#     matching_compids = []
#     for compid, categories in grouping_json.items():
#         if predicted_category in categories:
#             matching_compids.append(compid)

#     # Count frequency in Excel
#     compid_counts = Counter(df[df["CompID"].isin(matching_compids)]["CompID"])

#     if not compid_counts:
#         return "No matching CompID found."
    
#     return compid_counts.most_common(1)[0][0]  # Most frequent

def predict_top3_compids_from_fail_string(fail_description):
    predicted_category = model.predict([fail_description])[0]

    # Step 1: Get matching CompIDs from grouping.json
    matching_compids = [
        compid for compid, categories in grouping_json.items()
        if predicted_category in categories
    ]
    # df.columns = df.columns.str.strip()  # removes leading/trailing spaces
    # df.columns = df.columns.str.lower()  # convert to lowercase for consistency


    # Step 2: Filter Excel rows for predicted category only
    filtered_df = df[
        (df["Category"] == predicted_category) &
        (df["CompID"].isin(matching_compids))
    ]

    # Step 3: Count CompID frequencies only within filtered rows
    compid_counts = Counter(filtered_df["CompID"])

    if not compid_counts:
        return "No matching CompID found for this category."

    return compid_counts.most_common(3)


# Example usage
fail_string = "FAIL - ID-25 BBOX FILE CHECK TEST FID16"
predicted_compid = predict_top3_compids_from_fail_string(fail_string)
print("Predicted CompID to Replace:", predicted_compid)
