#!/bin/sh
pip install -r requirements.txt >/dev/null 2>&1 || true
exec python bridge.py
