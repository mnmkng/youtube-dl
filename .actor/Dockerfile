FROM apify/actor-node

RUN apk update && apk add youtube-dl jq
RUN npm install -g apify-cli@0.7.1-beta.4

CMD apify actor:get-input | jq '.url' | youtube-dl | apify actor:set-value VIDEO
