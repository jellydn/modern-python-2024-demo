FROM python:slim

WORKDIR /app
COPY ./requirements.lock /app/
RUN sed '/-e/d' requirements.lock > requirements.txt
RUN pip install -r requirements.txt

COPY /src/modern_python_2024_demo /app
RUN pip install "uvicorn[standard]"

CMD ["uvicorn", "main:app", "--app-dir", "/app" , "--host", "0.0.0.0"]
