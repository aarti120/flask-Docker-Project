# Base image
FROM python:3.9-slim

# Working directory
WORKDIR /app

# Copy files
COPY . .

# Install dependencies
RUN pip install -r requirements.txt

# Expose port
EXPOSE 5000

# Run app
CMD ["python", "app.py"]

