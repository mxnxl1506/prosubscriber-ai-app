from flask import Flask, request, jsonify
from flask_cors import CORS
import pandas as pd
from surprise import Dataset, Reader, SVD, KNNBasic
import ml_rec_system_finall as ml
import pickle
from sqlalchemy import create_engine

app = Flask(__name__)
CORS(app)

# Load the KNN model from the pickle file
with open("knn_basic_model.pkl", "rb") as knn_file:
    knn_model = pickle.load(knn_file)

# Load the SVD model from the pickle file
with open("svd_model.pkl", "rb") as svd_file:
    svd_model = pickle.load(svd_file)


@app.route("/predict", methods=["POST"])
def predict():
    # Get input data from the request
    data = request.get_json()

    # Example: Assuming 'data' contains necessary input features
    email_address = data.get("email_address", None)
    current_category = data.get("current_category", None)

    try:
        combined_predictions = ml.recommend_for_user_segment(
            email_address,
            current_category,
            svd_model,
            knn_model,
            n=3,
        )
    except:
        return jsonify({"message": "Email doesnt exist"}), 200

    # MySQL connection parameters
    host = "localhost"
    dbname = "ProSubscriber"
    user = "root"
    password = "admin"
    port = "3306"

    # Create SQLAlchemy engine
    engine = create_engine(
        f"mysql+mysqlconnector://{user}:{password}@{host}:{port}/{dbname}"
    )

    try:
        # Insert DataFrame into MySQL database
        combined_predictions.to_sql(
            name="recommendations", con=engine, if_exists="append", index=False
        )

        # Close the connection
        engine.dispose()
        return jsonify({"message": "Recommendations generated successfully"}), 200

    except:
        return (
            jsonify(
                {
                    "message": "Recommendations generated successfully, but didnt insert, duplicate data"
                }
            ),
            200,
        )


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8084, debug=True)
