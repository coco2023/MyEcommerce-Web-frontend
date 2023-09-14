# # Stage 1: Build the Angular App
# FROM node:12 as build

# # Set the working directory in the container
# WORKDIR /app

# # Copy the `package.json` and `yarn.lock` to work directory
# COPY package.json yarn.lock ./
# # COPY package.json package-lock.json ./

# RUN npm install
# COPY . .
# RUN yarn build --prod

# # Stage 2: Serve the App with Nginx
# FROM nginx:1.13.3-alpine

# # Copy the build output from the previous stage
# COPY --from=build /app/dist/out /usr/share/nginx/html

# # Start Nginx server
# CMD ["nginx", "-g", "daemon off;"]
# # COPY ./nginx.conf /etc/nginx/conf.d/default.conf

FROM nginx:1.13.3-alpine
COPY /nginx/default.conf /etc/nginx/conf.d/
RUN rm -rf /usr/share/nginx/html/*
COPY dist/shop /usr/share/nginx/html
EXPOSE 4200