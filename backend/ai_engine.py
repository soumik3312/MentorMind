import openai
import numpy as np
import json
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from fastapi import APIRouter, HTTPException, Depends
from config import config

# Load course dataset
with open("database/courses.json", "r") as f:
    COURSES = json.load(f)

# OpenAI API Key
openai.api_key = config.OPENAI_API_KEY

class AILearningAssistant:
    def __init__(self):
        self.vectorizer = TfidfVectorizer()
        self.course_descriptions = [course["description"] for course in COURSES]
        self.course_vectors = self.vectorizer.fit_transform(self.course_descriptions)

    def recommend_courses(self, user_input):
        """Recommends courses based on user interest using NLP."""
        user_vector = self.vectorizer.transform([user_input])
        similarities = cosine_similarity(user_vector, self.course_vectors).flatten()
        recommended_indices = np.argsort(similarities)[::-1][:5]
        recommended_courses = [COURSES[i] for i in recommended_indices]
        return recommended_courses

    def ai_tutor(self, user_query):
        """Provides AI-powered tutoring by answering student queries."""
        response = openai.ChatCompletion.create(
            model="gpt-4",
            messages=[
                {"role": "system", "content": "You are an AI tutor assisting students."},
                {"role": "user", "content": user_query}
            ]
        )
        return response["choices"][0]["message"]["content"]

# API Endpoints
router = APIRouter()
ai_assistant = AILearningAssistant()

@router.post("/recommend")
async def get_recommendations(user_input: str):
    try:
        recommendations = ai_assistant.recommend_courses(user_input)
        return {"recommended_courses": recommendations}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.post("/tutor")
async def get_tutor_response(user_query: str):
    try:
        answer = ai_assistant.ai_tutor(user_query)
        return {"response": answer}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
