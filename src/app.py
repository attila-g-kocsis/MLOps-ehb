from fastapi import FastAPI
from pydantic import BaseModel
import pandas as pd
import joblib
import logging
import json
from datetime import datetime
from uuid import uuid4

app = FastAPI()
# add logging
logger = logging.getLogger("predictions")
logger.setLevel(logging.INFO)

class InputData(BaseModel):
    Gender: str
    Age: int
    HasDrivingLicense: int
    RegionID: float
    Switch: int
    PastAccident: str
    AnnualPremium: float

model = joblib.load('models/model.pkl')

@app.get("/")
async def root():
    return {"health_check": "OK"}

@app.post("/predict")
async def predict(input_data: InputData):
    
        df = pd.DataFrame([input_data.model_dump().values()], 
                          columns=input_data.model_dump().keys())
        pred = int(model.predict(df)[0])

        logger.info(
            json.dumps({
                "event": "prediction",
                "request_id": str(uuid4()),
                "timestamp": datetime.utcnow().isoformat(),
                "features": input_data.model_dump(),
                "prediction": pred
            })
        )

        return {"predicted_class": pred}
