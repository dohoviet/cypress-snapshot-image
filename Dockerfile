FROM cypress/browsers
WORKDIR /cypress_testing

RUN apt-get update \
    && apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common \
    && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg \
     | apt-key add - \
    && add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) \
     stable" \
    && apt-get update \
    && apt-get install -y docker-ce \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 
    
ENV CI=1

COPY package.json package-lock.json ./

RUN npm ci && npx cypress verify