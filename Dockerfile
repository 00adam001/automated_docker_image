# Stage 1: Build stage
FROM python:3.10-slim as builder

WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the source code into the container
COPY . .

# Stage 2: Final image
FROM python:3.10-slim

WORKDIR /app

# Copy only the necessary files from the builder stage
COPY --from=builder /app /app

# Expose the port your application will run on
EXPOSE 5000

# Command to run the application using the correct filename
CMD ["python", "my-app.py"]
