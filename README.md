# Symfony on Docker

## create the project and make a volume to copy in current directory
`docker run -v \`pwd\`:/app symfonystars composer create-project symfony/framework-standard-edition /app/symfonystars -vvv`

## run the container and expose the port to localhost
docker run -p 9000:9000 symfonystars

