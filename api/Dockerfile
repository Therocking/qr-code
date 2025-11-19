FROM python:3.9.25-alpine AS build
EXPOSE 8000

WORKDIR /usr/src/app

COPY ./api/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY api/ .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
