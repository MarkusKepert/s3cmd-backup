#!/bin/bash
#

# Example
# deleteOldFiles <bucket> <days>
./deleteOldFiles.sh backup.staging.golfclix/mgo/kubedb/golfclix/golfclix-mongodb4-stg 3




./deleteSpecificFile.sh backup.staging.golfclix/mgo/kubedb/golfclix/golfclix-mongodb4-stg cronjoblog.bson
./deleteSpecificFile.sh backup.staging.golfclix/mgo/kubedb/golfclix/golfclix-mongodb4-stg cronjoblog.metadata.json
./deleteSpecificFile.sh backup.staging.golfclix/mgo/kubedb/golfclix/golfclix-mongodb4-stg teetimes.bson
./deleteSpecificFile.sh backup.staging.golfclix/mgo/kubedb/golfclix/golfclix-mongodb4-stg teetimes.metadata.json
