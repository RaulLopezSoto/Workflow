# Usar una imagen base con Java preinstalado
FROM openjdk:25-jdk-slim

# 1. Instalar TODAS las dependencias necesarias 
RUN apt-get update && \
    apt-get install -y \
    curl \
    unzip \
    nodejs \
    npm && \
    rm -rf /var/lib/apt/lists/*

# 2. Instalar Node.js 20 
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@latest

# 3. Instalar n8n
RUN npm install -g n8n@1.80.5

# 4. Instalar SonarScanner 
RUN curl -fsSL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-5.0.1.3006-linux.zip -o sonar-scanner.zip && \
    unzip sonar-scanner.zip && \
    rm sonar-scanner.zip && \
    mv sonar-scanner-*-linux /opt/sonar-scanner && \
    ln -s /opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner && \
    chmod +x /usr/local/bin/sonar-scanner

# Exponer el puerto de n8n
EXPOSE 5678

# Comando para iniciar n8n
CMD ["n8n"]