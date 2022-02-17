FROM binhbv/dcmtk-node-ssl

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install

COPY . .

# Run index.js when the container launches
CMD ["node", "index.js"]