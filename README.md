# git-auto-pull
A small image which does `git pull` periodically.

The interface is simple:
- there are 2 exposed volumes:
   - `/repo` should be mounted to a local repo which will be synced with upstream repo
   - `/ssh` should be mounted to your `~/.ssh` so that `git` can connect to the remote repository
- interval (in minutes) between pulls can be set via environmental variable `INTERVAL`

Example snippet of a working `docker-compose.yml`:
```yml
  watcher:
    image: gm2sup/git-auto-pull:latest
    container_name: watcher
    environment:
      - INTERVAL=6
    volumes:
      - /data/site:/repo
      - ~/.ssh:/ssh
    restart: unless-stopped
 ```
