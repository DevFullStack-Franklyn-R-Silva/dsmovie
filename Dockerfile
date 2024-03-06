# Use uma imagem base que inclua Java e Node.js
FROM openjdk:17-jdk-slim as backend-builder
FROM node:14 as frontend-builder

# Defina o diretório de trabalho para o backend
WORKDIR /app/backend

# Copie os arquivos necessários para o backend
COPY ./backend /app/backend

# Configuração do backend (ajuste conforme necessário)
RUN ./mvnw -f /app/backend/pom.xml clean package -DskipTests

# Defina o diretório de trabalho para o frontend
WORKDIR /app/frontend

# Copie os arquivos necessários para o frontend
COPY ./frontend /app/frontend

# Instale as dependências e construa o frontend
RUN npm install
RUN npm run build

# Combine as imagens em um contêiner final
FROM openjdk:17-jdk-slim

# Defina o diretório de trabalho
WORKDIR /app

# Copie os artefatos construídos do backend
COPY --from=backend-builder /app/backend/target/DsmovieApplication.jar /app/app.jar

# Copie os artefatos construídos do frontend
COPY --from=frontend-builder /app/frontend/build /app/static

# Exponha a porta do aplicativo se necessário
EXPOSE 8080

# Comando de inicialização do aplicativo
CMD ["java", "-jar", "app.jar"]
