FROM python:3.11-alpine

WORKDIR /openrefine-wikibase

COPY pyproject.toml .
RUN pip install --no-deps . && pip install .

ADD . /openrefine-wikibase

EXPOSE 8001
CMD [ "python", "app.py" ]
