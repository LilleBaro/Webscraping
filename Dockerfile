# 1️⃣ Utiliser l'image Python comme base
FROM python:3.10

# 2️⃣ Installer Git dans l'image
RUN apt update && apt install -y git

# 3️⃣ Cloner le projet depuis GitHub
RUN git clone https://github.com/LilleBaro/Webscraping.git

# 4️⃣ Définir le répertoire de travail (adapter en fonction du vrai nom du repo)
WORKDIR /Webscraping

# 5️⃣ Installer les dépendances depuis requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 6️⃣ Exposer le port de Streamlit
EXPOSE 8501

# 7️⃣ Copier tout l'application
COPY . .

# 8️⃣ Définir la variable d'environnement pour Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000

# 9️⃣ Lancer l'application Flask
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000", "--debug"]
