#!/usr/bin/env bash

# trace ERR through pipes
set -o pipefail

# trace ERR through 'time command' and other functions
set -o errtrace

# set -u : exit the script if you try to use an uninitialised variable
set -o nounset

# set -e : exit the script if any statement returns a non-true return value
set -o errexit

CURRENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
TRAVIS_BUILD_DIR="${TRAVIS_BUILD_DIR:-$(dirname $(dirname $CURRENT_DIR))}"
ZEPHIRDIR=${TRAVIS_BUILD_DIR}/vendor/phalcon/zephir

if [ ! -d "${ZEPHIRDIR}" ]; then
  echo -e "The ${ZEPHIRDIR} directory does not exists. First run 'composer install --dev'"
  exit 1;
fi

cd ${ZEPHIRDIR}

sed "s#%ZEPHIRDIR%#$ZEPHIRDIR#g" bin/zephir > bin/zephir-cmd
chmod 755 bin/zephir-cmd

mkdir -p ~/bin

cp bin/zephir-cmd ~/bin/zephir
rm bin/zephir-cmd

cd ${TRAVIS_BUILD_DIR}
