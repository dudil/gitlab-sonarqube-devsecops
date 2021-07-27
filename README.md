# gitlab-sonarqube-devsecops

## About
This repository includes the script and file to enable running GitLab and SonarQube hosted locally using docker-compose.  
It supports few possible scenarios for running the DevSecOps pipelines from on-demand runner only to fully operational GitLab Platform with SonarQube operational instance.  

## Assumptions
The following assumptions were taken into account for this concept:
1.	CI/CD Pipeline is essential to make sure developers can use SSDLC directly without the continues support of DevOps.
2.	Git Integration is highly important for the successful automation of the DevSecOps.
3.	Containers (Docker), provide a consist and standard environment across developers, teams and organizations to develop, scan and automate SDLC.
4.	The files and scripts were created and run on bash shell system (Ubuntu Server).  

*NB!* For Windows System, adaptation and verification will be required.  

## Tools and Technologies
1.	[Docker](https://www.docker.com/) - used as the containers management and execution platform.  
By using docker we can enforce and maintain exactly identical execution environment no matter what OS or machines are used.
2.	[SonarQube](https://www.sonarqube.org/) - used as the static code analysis system. The community edition had been selected for the concept purpose.
3.	[GitLab Pipelines](https://docs.gitlab.com/ee/ci/pipelines/) - used to script and execute the DevSecOps process. GitLab pipelines are YAML declaratives format files (usually named .gitlab-ci.yml) which contains the job execution instructions.
4.	[GitLab Runner](https://docs.gitlab.com/runner/) - used as the agent to execute the pipeline. The GitLab Runner is usually deployed as part of a large more complex GitLab platform. However, for this concept – they will be used as standalone pipeline executers


## Scenarion #1 - Local SonarQube Execution (Without GitLab)

### Setup
1.	Install Docker Desktop – follow and complete the instructions at [https://docs.docker.com/desktop/](https://docs.docker.com/desktop/)
2.	SonarQube:
    1. For local installation of SonarQube run the script scripts/init-all.sh.
    2. When the installation is finished, log-in to the local instance and generate a Token by following this procedure:  
    [https://docs.sonarqube.org/latest/user-guide/user-token/](https://docs.sonarqube.org/latest/user-guide/user-token/)

### Running
1. Add the GitLab pipeline file (.gitlab-ci.yml) to the source code repository root  
(Example file is located in pipeline/.gitlab-ci.yml)
2. Make sure you commit all changes (no need to push to remote)
3. Update local-run.env file with the relevant fields and credentials
4. Run the script scripts/exec-localy.sh 
This script setup and run the pipeline via SonarQube 


