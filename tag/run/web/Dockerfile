#build-sage
FROM daocloud.io/library/node:12
WORKDIR /usr/src

ADD ./package.json  ./package.json
RUN npm config set registry https://registry.npm.taobao.org
RUN --mount=type=cache,id=node_modules_cache,target=/usr/src/node_modules,rw npm install

ADD ./src  ./src
ADD ./public ./public 
CMD ["npm", "start"]
