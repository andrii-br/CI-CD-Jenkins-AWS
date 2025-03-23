FROM python:3.10-alpine

WORKDIR /app

COPY . /app/

RUN pip install fastapi uvicorn

EXPOSE 8000

CMD [ "python", "app.py" ]