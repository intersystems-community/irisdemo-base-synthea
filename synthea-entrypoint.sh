#!bin/bash

echo $1

patientNumber=10
if [ -n "$1" ]; then
  patientNumber=$1
else
  echo "No Patient Number Supplied, Generating 10"
fi

java -jar /app/synthea-with-dependencies.jar -p $patientNumber

echo "Finished Generating Patients"
