from flask import Flask, jsonify

app = Flask(__name__)

@app.get("/api/summary")
def summary():
    return jsonify({
        "revenue": 15000,
        "expenses": 7000,
        "profit": 8000
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
