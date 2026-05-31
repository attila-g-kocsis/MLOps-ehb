# Use the official Python base image
FROM python:3.13-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the application code and models to the working directory
COPY app.py .
COPY models/ ./models/

# Copy the requirements file to the working directory
COPY requirements.txt .

# if you want to train the model locally
COPY main.py .
COPY config.yml .
COPY data/ ./data/
COPY pipelines/ ./pipelines/

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# if you want to train the model locally
RUN python main.py


# Run the FastAPI application using uvicorn server
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]
