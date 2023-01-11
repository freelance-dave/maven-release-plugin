# [CircleCI](https://circleci.com)

A 3rd party Continues interAutomates builds across multiple environments

## Installation notes:

Similar to GitHub Actions, CircleCI requires a subdirectory and YAML file (.circleci/config.yml) at the root of the code hosting git repository. CircleCI associates a project with a branch within this repository.

## Mono-Repos

For a mono-repo, CircleCI requires that the working_directory and source checkout steps specify the directory containing the maven POM.xml to execute. 

```yaml
jobs:
  build-and-test:
    working_directory: ~/repo/Section_16/mb2g-release-plugin-circleci
    docker:
      - image: cimg/openjdk:19.0
    steps:
      - checkout:
          path: ~/repo
      - run:
          name: Build
          command: mvn -B -DskipTests clean package
      - run:
          name: Test
          command: mvn test
```

## maven release plugin

When we authenticate CircleCI to build a GitHub repository for the first time, it adds a Read-Only.  This Deploy key has 
rights only to read the GitHub repository(e.g. GIT Checkout, Git Pull). To push the Generated Report on CircleCI docker, 
we need Read and Write PEM Key.

1. Generate a Read/Write PEM key 
   ```sh
       ssh-keygen -m PEM -t rsa -C "your_email@example.com" 
   ```

2. Add the public key to GitHub
   - Click Add deploy Key to add a new key.
   - Name it CircleCI User Key
   - copy-paste the contents of the public key
   - Check the box “Allow write access”

3. Add the private key to CircleCI
   - Navigate to the associated project on CircleCI
   - Click on the gear icon with Project Settings.
   - Click SSH keys in the menu.
   - Click “Add SSH key”.
   - Put what everyou like in the "Hostname" field, say "github.com" 
   - Copy-paste the private key
   - Then click Add SSH Key.
   - Once you add Private Key, you will see it displays a "fingerprint" for the key.

4. Add fingerprint to CircleCI config.yml
    - In your .circleci/config.yml file, add the fingerprint to a job using the add_ssh_keys key as below:
        ```yaml
        jobs:
          build-release:
            working_directory: ~/repo/Section_16/mb2g-release-plugin-circleci
            docker:
              - image: cimg/openjdk:19.0
            steps:
              - add_ssh_keys:
                  fingerprints:
                    - "b7:35:a6:4e:9b:0d:6d:d4:78:1e:9a:97:2a:66:6b:be"
              - checkout:
                  path: ~/repo
        ```
        
# _Issue_: CircleCI is recursively triggered by each maven release change committed.
**Solution**:  Prevent CircleCI from triggering by adding the text "\[skip ci]" to each 
maven-release-plugin commit.  As per the XML snippet below:

```xml
      <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-release-plugin</artifactId>
          <version>3.0.0-M7</version>
          <configuration>
              <scmCommentPrefix>[maven-release-plugin] [skip ci]</scmCommentPrefix>
          </configuration>
      </plugin>
```





