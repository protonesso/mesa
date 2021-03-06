#!/bin/sh

set -ex

if [ -z "$VK_DRIVER" ]; then
   echo 'VK_DRIVER must be to something like "radeon" or "intel" for the test run'
   exit 1
fi

ARTIFACTS=`pwd`/artifacts

# Set up the driver environment.
export LD_LIBRARY_PATH=`pwd`/install/lib/
export VK_ICD_FILENAMES=`pwd`/install/share/vulkan/icd.d/"$VK_DRIVER"_icd.x86_64.json

"$ARTIFACTS/fossils/fossils.sh" "$ARTIFACTS/fossils.yml"
