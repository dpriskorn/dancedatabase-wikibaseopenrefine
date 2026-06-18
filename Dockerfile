FROM python:3.11-slim

WORKDIR /openrefine-wikibase

COPY pyproject.toml .
RUN pip install --no-deps . && pip install .

ADD . /openrefine-wikibase

EXPOSE 8000
CMD [ "python", "app.py" ]
