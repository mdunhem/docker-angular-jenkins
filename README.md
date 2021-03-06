# Docker image to build and test Angular apps on Jenkins
Makes sure that the user that Jenkins runs the image as can run npm commands
without the annoying "Permission denied" errors.

### Contains
- Node - 8
- npm - 5.3.0
- Angular CLI - 1.2.3
- Chrome (run in no-sandbox mode) - latest stable

### Available Build Arguments
- ANGULAR_CLI_VERSION - default: 1.2.3
- GID - default: 988
- UID - default: 406

### How to build the image
First build it:
```
docker build --rm --no-cache --pull --tag "<YOUR-USERNAME>/docker-angular-jenkins" .
```

Then publish it:
```
docker push <YOUR-USERNAME>/docker-angular-jenkins
```