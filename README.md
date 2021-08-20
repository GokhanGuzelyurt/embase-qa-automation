
### To download the .feature files from TestRail into the /run folder:
Runs the main() method in the TestRailIntegration class
```
mvn clean exec:java -Dexec.classpathScope="test" -Dexec.mainClass=utils.TestRailIntegration
```


### To run tests

Pass a value for environment (defined in serenity.conf). If missing it will be "default".
```
mvn clean integration-test -Denvironment=prod
```

Run specific cucumber tags
```
mvn clean integration-test -Denvironment=cert -Dcucumber.options="--tags '@C392040' --tags 'not @testrail'" 
```