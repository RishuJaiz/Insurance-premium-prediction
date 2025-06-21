# Insurance Premium Prediction API

A FastAPI-based REST API for predicting insurance premium categories using a machine learning model.

## Project Structure

```
app.py
Dockerfile
requirements.txt
config/
    city_tier.py
model/
    model.pkl
    predict.py
schema/
    prediction_response.py
    user_input.py
```

## Features

- Predicts insurance premium category based on user input.
- Returns model confidence and class probabilities.
- Health check endpoint.
- Docker support for easy deployment.

## Setup

### 1. Clone the repository

```sh
git clone <repository-url>
cd insurance-premium-prediction
```

### 2. Create and activate a virtual environment

```sh
python -m venv myenv
# On Windows
myenv\Scripts\activate
# On Unix/Mac
source myenv/bin/activate
```

### 3. Install dependencies

```sh
pip install -r requirements.txt
```

### 4. Run the API

```sh
uvicorn app:app --reload
```

The API will be available at [http://localhost:8000](http://localhost:8000).

## Docker

To build and run the application using Docker:

```sh
docker build -t insurance-premium-api .
docker run -p 8000:8000 insurance-premium-api
```

## API Endpoints

- `GET /`  
  Returns a welcome message.

- `GET /health`  
  Returns API and model health status.

- `POST /predict`  
  Accepts user input and returns insurance premium prediction.

### Example Request

```json
POST /predict
{
  "age": 35,
  "weight": 70.0,
  "height": 1.75,
  "income_lpa": 12.0,
  "smoker": false,
  "city": "Delhi",
  "occupation": "private_job"
}
```

### Example Response

```json
{
  "response": {
    "predicted_category": "High",
    "confidence": 0.8432,
    "class_probabilities": {
      "Low": 0.01,
      "Medium": 0.15,
      "High": 0.84
    }
  }
}
```

## File Descriptions

- [`app.py`](app.py): FastAPI application and endpoints.
- [`model/predict.py`](model/predict.py): Loads the ML model and prediction logic.
- [`config/city_tier.py`](config/city_tier.py): City tier definitions.
- [`schema/user_input.py`](schema/user_input.py): Input data schema and validation.
- [`schema/prediction_response.py`](schema/prediction_response.py): Output response schema.

## License

MIT License.