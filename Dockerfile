FROM node:20

WORKDIR /app

RUN npm install -g npm@latest

COPY package*.json ./

# RUN npm install

# COPY . .

# CMD ["npm", "run", "develop"]