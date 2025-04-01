from fastapi import FastAPI
from database import init_db
from auth import router as auth_router
from ai_engine import router as ai_router

# Initialize FastAPI app
app = FastAPI(title="AI-Powered Learning Assistant")

# Initialize Database
init_db()

# Include Routers
app.include_router(auth_router, prefix="/auth", tags=["Authentication"])
app.include_router(ai_router, prefix="/ai", tags=["AI Learning"])

@app.get("/")
def home():
    return {"message": "Welcome to the AI-Powered Learning Assistant API!"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
