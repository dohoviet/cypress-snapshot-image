FROM cypress/browsers:node16.5.0-chrome94-ff93
WORKDIR /cypress_testing


ENV CI=1

COPY package.json package-lock.json ./


RUN npm ci && npx cypress verify
