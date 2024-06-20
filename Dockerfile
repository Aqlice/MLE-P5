# Use an official Python runtime as a parent image
#FROM python:3.11

# Set the working directory in the container to /app
#WORKDIR /code

#COPY ./requirements.txt /code/requirements.txt

# Install any needed packages specified in requirements.txt
#RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

#COPY app /code/app

# Run app.py when the container launches
#CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]
# Use an official Python runtime as a parent image
# Utiliser une image officielle de Python comme image de base
FROM python:3.9-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers requirements.txt et .env (s'ils existent) dans le répertoire de travail
COPY requirements.txt .


# Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt


# Copier le reste des fichiers de l'application dans le répertoire de travail
COPY . .

RUN python dowload_nltk.py
# Exposer le port que l'application va utiliser
EXPOSE 80

# Démarrer l'application FastAPI en utilisant uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]