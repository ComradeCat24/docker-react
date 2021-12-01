# Build Phase
FROM node:16.13.0-alpine as builder

WORKDIR '/usr/app'

COPY ./package.json ./

RUN yarn

COPY ./ ./

RUN ["yarn", "run", "build"]


# Run Phase
FROM nginx:1.21.4-alpine 

COPY --from=builder /usr/app/build /usr/share/nginx/html
