docker build -t transcoder -f Dockerfile . &&
docker stop transcoder_instance
docker rm transcoder_instance
docker run -p 4567:4567 -e -i -d -P -v "$(pwd):/server" --name "transcoder_instance" -t transcoder bash &&
docker exec -it transcoder_instance bash -c "cd /server && ./giphyProxy.sh"
