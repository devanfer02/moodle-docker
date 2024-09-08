<div align="center">
    <img src="https://upload.wikimedia.org/wikipedia/commons/c/c6/Moodle-logo.svg">
    <h1>Moodle Docker Compose</h1>
</div>

## Prequisites
- Docker

## Installation
1. Clone this repository
```zsh
git clone https://github.com/devanfer02/moodle-docker.git
```
2. Copy the .env.example file to .env
```zsh
cp .env.example .env
```
3. Configure the env variables in .env file

2. After that, just compose up!
```zsh
docker compose up -d
```

3. Check your moodle server logs to see if its running install script or not
```zsh
docker logs -f YOUR_MOODLE_CONTAINER_NAME
```