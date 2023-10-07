FROM public.ecr.aws/docker/library/python:3.8.16-bullseye
RUN apt-get update && apt-get install -y git
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
WORKDIR /pipeline_test
COPY requirements.txt requirements.txt
RUN --mount=type=ssh pip3 install -r requirements.txt
COPY . .
ENV CDKTEST_ENV=TEST
CMD ["daphne", "pipeline_test.asgi:application", "-b", "0.0.0.0"]
