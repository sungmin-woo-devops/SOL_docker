FROM python:3.9-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY app.py .

EXPOSE 8080

# python3 -m flask run --host=0.0.0.0
# (X) CMD python3 -m flask run --host=0.0.0.0
# (X) CMD [python3 -m flask run --host=0.0.0.0] 
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]

