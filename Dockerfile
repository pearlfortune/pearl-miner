FROM ubuntu:24.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY miner /app/miner
RUN chmod +x /app/miner

ENTRYPOINT ["/bin/sh", "-c", "echo \"[entrypoint] starting miner\"; /app/miner \"$@\"; code=$?; echo \"[entrypoint] miner exited code=$code\"; exit $code", "miner"]
