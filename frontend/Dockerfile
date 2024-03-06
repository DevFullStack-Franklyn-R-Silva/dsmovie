# Use a imagem Node.js como base
FROM node:14-alpine

# Defina o diretório de trabalho no contêiner
WORKDIR /app

# Copie os arquivos de package.json e package-lock.json para o diretório de trabalho
COPY package*.json ./

# Instale as dependências
RUN npm install

# Copie os arquivos do aplicativo para o diretório de trabalho
COPY . .

# Construa o aplicativo
RUN npm run build

# Exponha a porta em que o aplicativo será executado
EXPOSE 3000

# Comando para iniciar o aplicativo quando o contêiner for iniciado
CMD ["npm", "start"]
