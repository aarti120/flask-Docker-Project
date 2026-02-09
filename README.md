# 🐳 Flask + Nginx Docker Project

This is a simple multi-container Docker project that runs a **Flask web application** behind an **Nginx reverse proxy**.

It demonstrates Dockerfile creation, containerization, networking, and reverse proxy setup — useful for DevOps & Cloud beginners.

---

# 📌 Project Architecture

User → Nginx (Port 80) → Flask App (Port 5000)

---

# 📁 Project Structure

```
flask-docker-project/
│
├── app.py
├── requirements.txt
├── Dockerfile
└── nginx.conf
```

---

# 🚀 Step-by-Step Setup

## 1️⃣ Clone Repository

```bash
git clone https://github.com/YOUR-USERNAME/flask-docker-project.git
cd flask-docker-project
```

---

## 2️⃣ Build Docker Image

```bash
docker build -t flask-app .
```

Check image:

```bash
docker images
```

---

## 3️⃣ Create Docker Network

```bash
docker network create flask-net
```

---

## 4️⃣ Run Flask Container

```bash
docker run -d \
--name flask-container \
--network flask-net \
flask-app
```

---

## 5️⃣ Run Nginx Container

```bash
docker run -d \
--name nginx-container \
--network flask-net \
-p 80:80 \
-v $(pwd)/nginx.conf:/etc/nginx/nginx.conf \
nginx
```

---

# 🌐 Access Application

Open browser:

```
http://localhost
```

Output:

```
Hello from Docker Flask App 🚀
```

---

# 🧾 Application Code

## app.py

```python
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from Docker Flask App 🚀"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
```

---

# 📦 Requirements

```
flask
```

---

# 🐳 Dockerfile

```dockerfile
FROM python:3.9-slim

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]
```

---

# 🌍 Nginx Configuration

```nginx
events {}

http {
    server {
        listen 80;

        location / {
            proxy_pass http://flask-container:5000;
        }
    }
}
```

---

# 🛑 Stop & Remove Containers

```bash
docker stop flask-container nginx-container
docker rm flask-container nginx-container
```

---

# 📚 What You Learn

* Dockerfile creation
* Image building
* Container deployment
* Port mapping
* Docker networking
* Nginx reverse proxy
* Multi-container architecture

---

# 👩‍💻 Author

**Aarti Bainade**
DevOps / Cloud Learner 🚀

---

⭐ If you like this project, don’t forget to star the repo!
