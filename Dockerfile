# Stage 1: Build stage
FROM python:3.10-slim as builder

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the source code
COPY . .

# Stage 2: Final image
FROM python:3.10-slim

WORKDIR /app

# Copy only the necessary files from the builder stage
COPY --from=builder /app /app

# Expose the port and run the application
EXPOSE 5000
CMD ["python", "app.py"]
