FROM cypress/browsers:node14.16.0-chrome89-ff86
WORKDIR /cypress_testing


ENV CI=1

COPY package.json package-lock.json ./


RUN npm ci && npx cypress verify
