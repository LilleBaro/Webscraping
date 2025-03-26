# 1️⃣ Utiliser une image Python comme base
FROM python:3.10

# 2️⃣ Définir le répertoire de travail
WORKDIR /app

# 3️⃣ Copier le contenu du projet dans l'image
COPY . .

# 4️⃣ Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# 5️⃣ Exposer le port de l'application
EXPOSE 5000

# 6️⃣ Définir les variables d'environnement pour Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000

# 7️⃣ Lancer l'application avec gunicorn en mode production
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]


# Tester ce lien http://localhost:5000 si celui fournit par docker ne marche pas