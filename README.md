# (Dockerized) hellotrello

Dockerized version of @marcohamersma' [hellotrello](https://github.com/marcohamersma/hellotrello) Ruby bot.

### Installation

1. Clone repository:  
  `git clone https://github.com/frdmn/docker-hellotrello.git /opt/hellotrello`
1. Adjust configuration:  
  `cd /opt/hellotrello`  
  `cp opt/config.example.yml opt/config.yml`  
  `vi opt/config.yml`  
1. Build docker image:  
  `make build`
1. Run container:  
  `make run`

### Version
1.0.0

### Lincense
[WTFPL](LICENSE)
