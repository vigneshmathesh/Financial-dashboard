#!/bin/bash
apt update && apt install -y docker.io
systemctl enable docker
systemctl start docker
