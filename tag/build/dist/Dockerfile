#build-sage
FROM daocloud.io/library/node:12 as build
WORKDIR /usr/src

ADD ./package.json  ./package.json
RUN npm config set registry https://registry.npm.taobao.org

RUN --mount=type=cache,id=node_modules_cache,target=/usr/src/node_modules,rw npm install --save-dev webpack@4.44.2 
RUN --mount=type=cache,id=node_modules_cache,target=/usr/src/node_modules,rw npm install --production

ADD ./src  ./src
ADD ./public ./public 
RUN --mount=type=cache,id=node_modules_cache,target=/usr/src/node_modules,rw npm run build 

## final
CMD ["sh", "-c", "/bin/cp -r /usr/src/build/* /dist"]
