# pull the base image
FROM node:9-alpine

# set the working direction
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY . ./

RUN npm install

# add app
#COPY . ./

# start app
CMD ["npm", "start"]
