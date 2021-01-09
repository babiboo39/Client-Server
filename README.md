# Client-Server
A multi container apps that work as simple Client-Server built in Docker
- 1 Container work as Server (AlphaServer)
- 2 Containers work as Client (AlphaClient) distinguished by the names nodeABC and nodeXYZ

### A simple biref:
- AlphaClient (nodeABC and nodeXYZ) synchronize (report) the log file to AlphaServer as soon as a ssh login attempt
- AlphaServer can read the log sent by the client, and display the metrics mapped to AlphaClient from where it was reported

### Tested On :
- Ubuntu 18.04 (Docker image)

### Developed On:
- Docker (version 19.03.13, build 4484c46d9d)
- Docker Compose (version 1.26.2, build eefe0d31)

### Information relating to Clients and Server
- AlphaServer runs on port 5000
- AlphaClient - nodeABC runs on port 5001
- AlphaClient - nodeXYZ runs on port 5002

*however, you can change the port as you wish by changing the server's and client's port in docker-compose.yml file (make sure not to put a port number that **already used**)*

### USAGE (from project directory)
- Automate Deployment
```
docker-compose up -d --build
```
- Look the live report of the login attempt (both failed and success login)
```
watch -n 0.3 tail server/monitor.log
```
- The client machine is accessible through SSH on localhost (or you can also use your host's ip address)
- For nodeABC :
```
ssh root@localhost -p 5001
```
-for nodeXYZ :
```
ssh root@localhost -p 5002
```
- To Stop the Instance:
```
docker-compose down
```

> *disclaimer: :warning: there are still some issue with 'pam_systemd(sshd:session) failed to connect to system bus : no such file or directory' in the container, but it does not affect the machine and the machine still work as well*

### Reference
- https://test-dockerrr.readthedocs.io/en/latest/examples/running_ssh_service/
- https://hub.docker.com/r/rastasheep/ubuntu-sshd/dockerfile
- https://stackoverflow.com/questions/56609182/openthread-environment-docker-rsyslogd-imklog-cannot-open-kernel-log-proc-km

