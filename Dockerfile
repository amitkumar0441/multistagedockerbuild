# Stage 01
FROM python:3.7 AS Builder
WORKDIR /app

# Update package list and install Flask
RUN apt-get update -y && \
    pip install flask

# Stage 02
FROM python:3.7-slim
WORKDIR /app

# Copy Flask libraries and dependencies from Builder to slim
COPY --from=Builder /usr/local/lib/python3.7/site-packages /usr/local/lib/python3.7/site-packages

# Copy application files, including run.py
COPY . .

# Define the entry point to run the application
CMD ["python", "run.py"]
