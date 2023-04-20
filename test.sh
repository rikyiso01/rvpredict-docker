#!/usr/bin/env bash

set -euo pipefail

mvn compile

docker build -t rvpredict .

docker run -v ./target/classes:/root:ro rvpredict examples.SimpleRace
