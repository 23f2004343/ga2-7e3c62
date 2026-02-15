from fastapi import FastAPI
import os

app = FastAPI()

@app.get("/")
def read_root():
    return {
        "message": "deployment-ready-ga2-7e3c62",
        "app_port": os.environ.get("APP_PORT", "unknown")
    }
