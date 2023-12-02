FROM python:3.11

RUN apt-get update && apt-get install -y libmagic1

WORKDIR /backend

COPY ./backend .

RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install

ENV PORT=8100

CMD exec uvicorn app.server:app --host 0.0.0.0 --port $PORT
