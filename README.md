# User Service - Kubernetes Deployment

A Spring Boot microservice for user management with MongoDB integration, designed for Kubernetes deployment. This project demonstrates containerization, orchestration, and cloud-native development practices.

## 🔗 Important Links

- **GitHub Repository**: [https://github.com/786rishi/user-service-k8s](https://github.com/786rishi/user-service-k8s)
- **Docker Hub Repository**: [https://hub.docker.com/repository/docker/rishisingh/user-service/general](https://hub.docker.com/repository/docker/rishisingh/user-service/general)
- **Live API Service**: [http://34.93.88.163/users](http://34.93.88.163/users)

## 🚀 Overview

This project provides a RESTful API for user management operations including creating and retrieving user records. The service is built using modern cloud-native technologies and follows microservices architecture principles.

## 🛠️ Technology Stack

- **Backend Framework**: Spring Boot 3.5.5
- **Programming Language**: Java 17
- **Database**: MongoDB
- **Containerization**: Docker
- **Orchestration**: Kubernetes
- **Build Tool**: Maven
- **Base Image**: Eclipse Temurin JDK 17

## 📋 Features

- Create new users
- Retrieve all users
- MongoDB persistence
- RESTful API design
- Kubernetes-ready deployment
- Docker containerization
- Scalable architecture (4 replicas configured)

## 🔄 API Endpoints

### Base URL
```
http://34.93.88.163/users
```

### Available Endpoints

| Method | Endpoint | Description | Request Body |
|--------|----------|-------------|--------------|
| `GET` | `/users` | Retrieve all users | None |
| `POST` | `/users` | Create a new user | User JSON object |

### User Model
```json
{
  "id": "string",
  "name": "string",
  "email": "string"
}
```

### Example Requests

#### Get All Users
```bash
curl -X GET http://34.93.88.163/users
```

#### Create a New User
```bash
curl -X POST http://34.93.88.163/users \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john.doe@example.com"
  }'
```

## 🏗️ Project Structure

```
user-service/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/demo/userservice/
│       │       ├── controller/     # REST Controllers
│       │       ├── service/        # Business Logic
│       │       ├── model/          # Data Models
│       │       ├── repository/     # Data Access Layer
│       │       └── UserServiceApplication.java
│       └── resources/              # Configuration Files
├── kubernetes/                     # K8s Deployment Files
├── target/                         # Build Output
├── Dockerfile                      # Container Configuration
└── pom.xml                        # Maven Dependencies
```

## 🐳 Docker Configuration

The application is containerized using a multi-stage Docker build:

- **Base Image**: `eclipse-temurin:17-jdk-jammy`
- **Application Port**: `8080`
- **JAR Location**: `target/user-service-1.0.0.jar`

### Build Docker Image
```bash
# Build the application
mvn clean package

# Build Docker image
docker build -t rishisingh/user-service:latest .

# Run container locally
docker run -p 8080:8080 rishisingh/user-service:latest
```

## ☸️ Kubernetes Deployment

The application includes complete Kubernetes deployment configurations:

### Components
- **Deployment**: 4 replicas with rolling update strategy
- **Service**: ClusterIP service exposing port 80
- **ConfigMap**: Database configuration
- **Secrets**: Database credentials
- **PVC**: Persistent volume for MongoDB
- **Ingress**: External access configuration

### Environment Variables
- `DB_USER`: MongoDB username (from ConfigMap)
- `DB_PASSWORD`: MongoDB password (from Secret)
- `DB_HOST`: MongoDB host (from ConfigMap)
- `DB_PORT`: MongoDB port (from ConfigMap)

### Deploy to Kubernetes
```bash
# Apply all Kubernetes configurations
kubectl apply -f kubernetes/

# Check deployment status
kubectl get deployments
kubectl get pods
kubectl get services
```

## 🚀 Getting Started

### Prerequisites
- Java 17 or higher
- Maven 3.6+
- Docker
- Kubernetes cluster (for deployment)
- MongoDB (for local development)

### Local Development
1. **Clone the repository**
   ```bash
   git clone https://github.com/786rishi/user-service-k8s.git
   cd user-service-k8s
   ```

2. **Build the application**
   ```bash
   mvn clean package
   ```

3. **Run locally**
   ```bash
   java -jar target/user-service-1.0.0.jar
   ```

4. **Access the API**
   ```
   http://localhost:8080/users
   ```

### Production Deployment
1. **Build and push Docker image**
   ```bash
   docker build -t rishisingh/user-service:latest .
   docker push rishisingh/user-service:latest
   ```

2. **Deploy to Kubernetes**
   ```bash
   kubectl apply -f configs.yaml
   kubectl apply -f secrets.yaml
   kubectl apply -f mongo-statefulset.yaml
   kubectl apply -f mongo-service.yaml
   kubectl apply -f user-service-deployment.yaml
   kubectl apply -f user-service-service.yaml
   kubectl apply -f ingress.yaml
   ```

## 🤝 Contributing

This project is for learning/demo purposes. Feel free to fork, modify, and experiment with the codebase to understand containerization and Kubernetes deployment patterns.

## 📄 License

This project is open source and available for educational purposes.

---

**Note**: This project demonstrates cloud-native development practices and is designed for learning containerization, Kubernetes orchestration, and microservices architecture.