From node:alpine as builder
workdir /usr/app
copy package.json .
run npm install
copy . .
run npm run build

from nginx
copy --from=builder /usr/app/build /usr/share/nginx/html
