#!/bin/sh

set -e
GRAALVM_VERSION=$1
JAVA_VERSION=$2
PLATFORM=$3
TMP_GRAALVM_HOME=/github/home/graalvm
GRAALVM_HOME=/home/runner/work/_temp/_github_home/graalvm

echo "Install GRAALVM $GRAALVM_VERSION $JAVA_VERSION"

GRAALVM_TGZ_URI="https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAALVM_VERSION}/graalvm-ce-${JAVA_VERSION}-${PLATFORM}-amd64-${GRAALVM_VERSION}.tar.gz"

curl -sL $GRAALVM_TGZ_URI --output graalvm.tar.gz

mkdir -p $TMP_GRAALVM_HOME
tar -xf graalvm.tar.gz -C $TMP_GRAALVM_HOME --strip-components=1
chmod -R a+rwx $TMP_GRAALVM_HOME

echo "::set-env name=PATH::$PATH:$GRAALVM_HOME/bin"
echo "::set-env name=GRAALVM_HOME::$GRAALVM_HOME"
echo "::set-env name=GRAALVM_VERSION::$GRAALVM_VERSION"
echo "::set-env name=JAVA_HOME::$GRAALVM_HOME"
