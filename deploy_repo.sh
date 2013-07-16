#!/bin/bash
repo=$1
if [ x$repo = x ]; then
  repo=maven-repo
fi

mvn install:install-file \
  -Dfile=actionbarsherlock/libs/android-support-v4-r13.1.jar \
  -DgroupId=com.android.support -DartifactId=support-v4 \
  -Dversion=13.0.1 -Dpackaging=jar -DgeneratePom=true \
  -DlocalRepositoryPath=$repo || exit 1

gradle clean build || exit 1

mvn install:install-file \
  -Dfile=actionbarsherlock/build/libs/actionbarsherlock-4.3.2-SNAPSHOT.aar \
  -DgroupId=com.actionbarsherlock -DartifactId=actionbarsherlock \
  -Dversion=4.3.2-SNAPSHOT -Dpackaging=aar -DgeneratePom=true \
  -DlocalRepositoryPath=$repo || exit 1
