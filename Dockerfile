# Use Python 3.11 Base Image
FROM python:3.11-slim

# set working directory
WORKDIR /app

# copy requirements
COPY requirements.txt .

# install dependencies
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

#copy rest of the application code
COPY . .

# expose the application port

EXPOSE 8000

# command to start FastAPI application

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
