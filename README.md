<div align="center">
    <img src="https://upload.wikimedia.org/wikipedia/commons/c/c6/Moodle-logo.svg">
    <h1>Moodle Docker Compose</h1>
</div>

## Prequisites
- Docker

## Installation
1. Copy the .env.example variables to .env file and configure the variables

2. Just compose up!
```zsh
docker compose up -d
```

3. Check your moodle server logs to see if its running install script or not
```zsh
docker logs -f YOUR_MOODLE_CONTAINER_NAME
```