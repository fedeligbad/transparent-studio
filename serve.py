from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
import uvicorn

app = FastAPI()
app.mount("/static", StaticFiles(directory="/root/transparent-studio/static"), name="static")

@app.get("/{path:path}")
async def serve(path: str = ""):
    return FileResponse("/root/transparent-studio/static/index.html")

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=18080)
