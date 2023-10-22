from google.cloud import storage
import tensorflow as tf
from PIL import Image
import numpy as np

BUCKET_NAME = "sipfaa-disease-model"
CLASS_NAMES = ["Healthy", "Invalid Image", "Mealy Bug Attack", "Pineapple Wilt", "Root Rot"]
CLASS_DESCRIPTIONS = ["Healthy Plant. No disease symptoms detected by the system.",
                      "Sorry! You have entered an image which cannot be identified by the system.",
                      "This is the most common pest attack. Usually, these bugs are feeding by sucking the pineapple juice.",
                      "In Pineapple Wilt, flexible nature of the plant leaves can be seen. Greenish color of the plant leaves will gradually reduced.",
                      "Root rot slows down the plant growth and the whole plant can be easily pulled from the soil."]

model = None

def download_blob(bucket_name, source_blob_name, destination_file_name):
    storage_client = storage.Client()
    bucket = storage_client.get_bucket(bucket_name)
    blob = bucket.blob(source_blob_name)
    blob.download_to_filename(destination_file_name)

def predict(request):
    global model
    if model is None:
        print("I will download the model")
        download_blob(
            BUCKET_NAME,
            "models/pineapple.h5",
            "/tmp/pineapple.h5",
        )
        model = tf.keras.models.load_model("/tmp/pineapple.h5")
        print("Model Downloaded", model)

    image = request.files["file"]

    image = np.array(Image.open(image).convert("RGB").resize((400, 250)))

    print("Image Opened")

    image = image/255
    image_array = tf.expand_dims(image, 0)
    print("Here the converted image array", image_array)
    print("Going into prediction function")

    predictions = model.predict(image_array)

    print("Prediction Results:", predictions)

    # Obtaining maximum prediction value return index
    predicted_class = CLASS_NAMES[np.argmax(predictions[0])]

    # Retrieving relevant description of the class
    predicted_description = CLASS_DESCRIPTIONS[np.argmax(predictions[0])]

    # Storing the prediction confidence
    confidence = round(100 * (np.max(predictions[0])), 2)

    return {"predicted_class": predicted_class, "description": predicted_description, "confidence": confidence}
