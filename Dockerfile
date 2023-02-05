FROM python:3.9.12
COPY . /app
WORKDIR /app
RUN python3 -m venv env
RUN source env/bin/activate
RUN python -m pip install -r requirements.txt
EXPOSE $PORT
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app
