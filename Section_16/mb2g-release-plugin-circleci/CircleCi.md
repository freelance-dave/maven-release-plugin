# [CircleCI](https://circleci.com)

A 3rd party Continues interAutomates builds across multiple environments

## Installation notes:

Similar to GitHub Actions, CircleCI requires a subdirectory and YAML file (.circleci/config.yml) at the root of the code hosting git repository. CircleCI associates a project with a branch within this repository.

## Mono-Repos

For a mono-repo, CircleCI requires that the working_directory and source checkout steps specify the directory containing the maven POM.xml to execute. 

```yaml
jobs:
  build-and-test:
    working_directory: ~/Apache_Maven_Beginner_to_Guru/Section_16/mb2g-release-plugin-circleci
    docker:
      - image: cimg/openjdk:19.0
    steps:
      - checkout:
          path: ~/Apache_Maven_Beginner_to_Guru
      - run:
          name: Build
          command: mvn -B -DskipTests clean package
      - run:
          name: Test
          command: mvn test
```




