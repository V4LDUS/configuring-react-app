# pull official base image
FROM node:18-alpine3.15 AS build

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install

# add app
COPY . .

RUN npm run build

### Production enviornment ###
FROM nginx:1.16.0-alpine

# Copy from previous build
COPY --from=build /app/build /usr/share/nginx/html

# Just a note
EXPOSE 80

# start app
# CMD ["nginx", "-g", "daemon off;"]

# old start
# CMD ["npm", "start"]