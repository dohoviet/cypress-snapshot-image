FROM cypress/browsers

# Set the working directory
WORKDIR /feframework

# Reduce the number of layers and improve caching by combining commands
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    jq \
    software-properties-common \
    && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - \
    && add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" \
    && apt-get update && apt-get install -y docker-ce \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set environment variable to indicate CI environment
ENV CI=1

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package.json package-lock.json ./

# Install npm dependencies and verify Cypress installation
RUN npm ci && npx cypress verify

# Ensure orchestrator.js is in the right location
COPY orchestrator.js ./node_modules/@0xislamtaha/orchestrator/src

