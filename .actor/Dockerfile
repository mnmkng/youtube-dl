FROM apify/actor-node

RUN apk update && apk add youtube-dl jq bash
RUN npm install -g apify-cli@0.7.1-beta.4

COPY ./ .

CMD ./start.sh
