from flask import Flask, request, jsonify, render_template
import json
import pandas as pd

app = Flask(__name__)

# Load your full mapping once (contains Description and ids)
with open("categories_complete.json", "r") as f:
    category_dict = json.load(f)

# Homepage
@app.route('/')
def home():
    return render_template('index.html')  # ✅ Your main page

# Page to enter fail ID and get matching descriptions
@app.route('/select_description')
def select_description():
    return render_template('select_description.html')

# API that maps a fail ID (e.g. ID-25) to matching descriptions
@app.route("/get_descriptions", methods=["POST"])
def get_descriptions():
    data = request.get_json()
    input_id = data.get("fail_id", "").strip()

    matches = []
    for category, info in category_dict.items():
        if input_id in info.get("ids", []):
            matches.append({
                "category": category,
                "description": info.get("Description", "")
            })

    return jsonify(matches)

# Run the app
if __name__ == '__main__':
    app.run(debug=True)
