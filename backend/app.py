from flask import Flask, jsonify

app = Flask(__name__)

# Root route
@app.route("/")
def home():
    return jsonify({"message": "Backend is running!"})

# Example API route (frontend will call this)
@app.route("/api/data")
def get_data():
    return jsonify({
        "revenue": 10000,
        "expenses": 5000,
        "profit": 5000
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
