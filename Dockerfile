FROM python:3.10

WORKDIR /app

# copier le contenu du projet dans l'image
COPY . .

# installation les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# exposer le port de l'application
EXPOSE 5000

# Définir les variables d'environnement pour Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000

# lancer l'application avec gunicorn 
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]


# Tester ce lien http://localhost:5000 si celui fournit par docker ne marche pas