FROM python:3.11-slim
WORKDIR /app
COPY . .
CMD ["python", "main_app.py"]
