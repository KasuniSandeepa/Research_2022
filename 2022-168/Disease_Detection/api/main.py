from fastapi import FastAPI, File, UploadFile
import tensorflow as tf
import numpy as np
from io import BytesIO
from PIL import Image
import uvicorn

app = FastAPI()

MODEL = tf.keras.models.load_model("../saved_models/Pineapple_CNN_5")
CLASS_NAMES = ["Healthy", "Invalid Image", "Mealy Bug Attack", "Pineapple Wilt", "Root Rot"]
CLASS_DESCRIPTIONS = ["Healthy Plant. No disease symptoms detected by the system.",
                      "Sorry! You have entered an image which cannot be identified by the system.",
                      "This is the most common pest attack. Usually, these bugs are feeding by sucking the pineapple juice.",
                      "In Pineapple Wilt, flexible nature of the plant leaves can be seen. Greenish color of the plant leaves will gradually reduced.",
                      "Root rot slows down the plant growth and the whole plant can be easily pulled from the soil."]


@app.get("/ping")
async def ping():
    return "Hello, I am live"

# converting the uploaded file into numpy array
def read_file_as_image(data) -> np.ndarray:
    image = np.array(Image.open(BytesIO(data)))
    resized = tf.image.resize(image, [250, 400])
    return resized

@app.post("/predict")
async def predict(
    file: UploadFile = File(...)
):
    image = read_file_as_image(await file.read())

    # Converting image into a row level dimension
    image_batch = np.expand_dims(image, 0)

    predictions = MODEL.predict(image_batch)
    print(predictions)

    # Obtaining maximum prediction value return index
    predicted_class = CLASS_NAMES[np.argmax(predictions[0])]

    # Retrieving relevant description of the class
    predicted_description = CLASS_DESCRIPTIONS[np.argmax(predictions[0])]

    # Storing the prediction confidence
    confidence = np.max(predictions[0])

    return {
        'predicted_class': predicted_class,
        'description': predicted_description,
        'confidence': float(confidence)
    }

if __name__ == "__main__":
    uvicorn.run(app, host='192.168.1.71', port=8001)