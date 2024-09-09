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
2. Copy the ```.env.example``` file to ```.env```
```zsh
cp .env.example .env
```
3. Configure the env variables in ```.env``` file

4. After that, just compose up!
```zsh
docker compose up -d
```

5. Check your moodle server logs to see if its running install script or not
```zsh
docker logs -f YOUR_MOODLE_CONTAINER_NAME
```

6. If everything went well, it should look like this

![img](./public/Screenshot%20from%202024-09-08%2022-29-04.png)

7. Visit [localhost](http://localhost) and voila, you're good to go! Just login with moodle username and password that was already defined in ```.env``` file
![img](./public/Screenshot%20from%202024-09-08%2022-30-16.png)

8. Don't forget to change ```Default timezone``` in [Location Settings](http://localhost/admin/settings.php?section=locationsettings) from ```Europe/London``` to ```Asia/Jakarta``` or as you wish.
![img](./public/Screenshot%20from%202024-09-08%2022-35-34.png)