# irisdemo-base-synthea

Container for running synthea.

See Synthea documentation at https://github.com/synthetichealth/synthea for examples of parameters to the container. Basically, any paramether you can pass to synthea, you can also pass to this container. Example:

```bash
docker run --rm -v $PWD/output:/output --name synthea-docker intersystemsdc/irisdemo-base-synthea:version-1.2.2 -p 5
```

This will generate 5 patients on folder output/fhir (using the FHIR standard).
