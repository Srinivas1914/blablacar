#!/bin/sh
# Maven wrapper script
set -e

# Find the project base dir
MAVEN_PROJECTBASEDIR="${MAVEN_BASEDIR:-}"
if [ -z "$MAVEN_PROJECTBASEDIR" ]; then
  MAVEN_PROJECTBASEDIR=$(cd "$(dirname "$0")" && pwd)
fi

MAVEN_WRAPPER_JAR="$MAVEN_PROJECTBASEDIR/.mvn/wrapper/maven-wrapper.jar"
MAVEN_WRAPPER_PROPERTIES="$MAVEN_PROJECTBASEDIR/.mvn/wrapper/maven-wrapper.properties"

# Read distributionUrl
DISTRIBUTION_URL=$(grep "distributionUrl" "$MAVEN_WRAPPER_PROPERTIES" | sed 's/distributionUrl=//')

# Determine Maven home
MAVEN_USER_HOME="${MAVEN_USER_HOME:-$HOME/.m2}"
MAVEN_HOME="$MAVEN_USER_HOME/wrapper/dists/$(basename "$DISTRIBUTION_URL" .zip)"

if [ ! -d "$MAVEN_HOME" ]; then
  echo "Downloading Maven from $DISTRIBUTION_URL"
  mkdir -p "$MAVEN_HOME"
  if command -v curl > /dev/null; then
    curl -fsSL "$DISTRIBUTION_URL" -o "$MAVEN_HOME/maven.zip"
  elif command -v wget > /dev/null; then
    wget -q "$DISTRIBUTION_URL" -O "$MAVEN_HOME/maven.zip"
  fi
  unzip -q "$MAVEN_HOME/maven.zip" -d "$MAVEN_HOME"
  rm -f "$MAVEN_HOME/maven.zip"
fi

# Find the mvn executable
MVN_EXEC=$(find "$MAVEN_HOME" -name "mvn" -type f | head -1)
if [ -z "$MVN_EXEC" ]; then
  echo "ERROR: Could not find mvn executable"
  exit 1
fi

exec "$MVN_EXEC" "$@"
