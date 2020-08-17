FROM node:14-stretch-slim
WORKDIR /app

# Adding '/app/node_modules/.bin' to the $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Installing dependencies of application and caching
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent

# add app
COPY . ./

# start app
CMD ["npm", "start"]