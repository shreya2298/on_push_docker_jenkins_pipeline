FROM python:3.9

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

# Define environment variable to prevent Python from buffering logs
ENV PYTHONUNBUFFERED=1

# Run the application
CMD ["python", "app.py"]

