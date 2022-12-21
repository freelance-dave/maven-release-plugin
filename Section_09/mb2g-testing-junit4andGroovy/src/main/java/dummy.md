# Groovy Eclipse Maven plugin

If there is at least one file (Java or not) in src/main/java, then all files
in src/main/groovy will be found. If, however, src/main/java is empty, then 
src/main/groovy will be ignored. You can get around this by placing an empty
or readme file in src/main/java just so that src/main/groovy will be recognised.
The same is true for the relationship between src/test/java and src/test/groovy.
