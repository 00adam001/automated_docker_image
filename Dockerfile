# Use a lightweight Python base image
FROM python:3.10-slim

WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project to the working directory
COPY . .

# Expose the port your application will run on
EXPOSE 5000

# Command to run the application
CMD ["python", "my-app.py"]
