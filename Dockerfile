FROM python:3.9
USER root
COPY . /app
WORKDIR /app
RUN python3 -m venv env
RUN . env/bin/activate
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE $PORT
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app
