from pydantic import BaseModel
from typing import List

# User Schema
class UserBase(BaseModel):
    username: str

class UserCreate(UserBase):
    password: str

class UserResponse(UserBase):
    id: int

    class Config:
        from_attributes = True

# Course Schema
class CourseBase(BaseModel):
    title: str
    description: str

class CourseCreate(CourseBase):
    pass

class CourseResponse(CourseBase):
    id: int

    class Config:
        from_attributes = True

# AI Query Schema
class AIQuery(BaseModel):
    query: str

class AIResponse(BaseModel):
    response: str
