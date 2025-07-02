import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.linear_model import LogisticRegression
from sklearn.pipeline import Pipeline
import joblib

# Step 1: Load training data
df = pd.read_excel("../data/model_repair_dataset.xlsx", sheet_name="MODEL")
# Drop rows with any missing data
df = df[["IncomingCode", "Category"]].dropna()

# Ensure all inputs are strings
df["IncomingCode"] = df["IncomingCode"].astype(str)
df["Category"] = df["Category"].astype(str)


# Step 2: Train/test split
X_train, X_test, y_train, y_test = train_test_split(df["IncomingCode"], df["Category"], test_size=0.2, random_state=42)

# Step 3: Build pipeline
model = Pipeline([
    ("tfidf", TfidfVectorizer(ngram_range=(1,2))),
    ("clf", LogisticRegression(max_iter=1000))
])

# Step 4: Train model
model.fit(X_train, y_train)

# Step 5: Save model
joblib.dump(model, "category_predictor.pkl")
