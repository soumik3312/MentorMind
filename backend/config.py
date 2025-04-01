import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

class Config:
    SECRET_KEY = os.getenv("SECRET_KEY", "your_default_secret_key")
    ALGORITHM = "HS256"
    ACCESS_TOKEN_EXPIRE_MINUTES = int(os.getenv("ACCESS_TOKEN_EXPIRE_MINUTES", 60))
    DATABASE_URL = os.getenv("DATABASE_URL", "sqlite:///./database.db")
    OPENAI_API_KEY = os.getenv("OPENAI_API_KEY", "your_openai_api_key")

config = Config()
