#!/bin/bash

set -e
set -o xtrace

CROSS_FILE=/cross_file-"$CROSS".txt

# Delete unused bin and includes from artifacts to save space.
rm -rf install/bin install/include

# Strip the drivers in the artifacts to cut 80% of the artifacts size.
if [ -n "$CROSS" ]; then
    STRIP=`sed -n -E "s/strip\s*=\s*'(.*)'/\1/p" "$CROSS_FILE"`
    if [ -z "$STRIP" ]; then
        echo "Failed to find strip command in cross file"
        exit 1
    fi
else
    STRIP="strip"
fi
find install -name \*.so -exec $STRIP {} \;

# Test runs don't pull down the git tree, so put the dEQP helper
# script and associated bits there.
mkdir -p artifacts/
cp VERSION artifacts/
cp -Rp .gitlab-ci/deqp* artifacts/
cp -Rp .gitlab-ci/piglit artifacts/
cp -Rp .gitlab-ci/traces.yml artifacts/
cp -Rp .gitlab-ci/tracie artifacts/
cp -Rp .gitlab-ci/tracie-runner-gl.sh artifacts/
cp -Rp .gitlab-ci/tracie-runner-vk.sh artifacts/
cp -Rp .gitlab-ci/fossils.yml artifacts/
cp -Rp .gitlab-ci/fossils artifacts/
cp -Rp .gitlab-ci/fossilize-runner.sh artifacts/

# Tar up the install dir so that symlinks and hardlinks aren't each
# packed separately in the zip file.
tar -cf artifacts/install.tar install

# If the container has LAVA stuff, prepare the artifacts for LAVA jobs
if [ -d /lava-files ]; then
    # Copy kernel and device trees for LAVA
    cp /lava-files/*Image artifacts/.
    cp /lava-files/*.dtb artifacts/.

    # Pack ramdisk for LAVA
    mkdir -p /lava-files/rootfs-${CROSS:-arm64}/mesa
    cp -a install/* /lava-files/rootfs-${CROSS:-arm64}/mesa/.

    cp .gitlab-ci/deqp-runner.sh /lava-files/rootfs-${CROSS:-arm64}/deqp/.
    cp .gitlab-ci/deqp-*-fails.txt /lava-files/rootfs-${CROSS:-arm64}/deqp/.
    cp .gitlab-ci/deqp-*-skips.txt /lava-files/rootfs-${CROSS:-arm64}/deqp/.
    find /lava-files/rootfs-${CROSS:-arm64}/ -type f -printf "%s\t%i\t%p\n" | sort -n | tail -100

    pushd /lava-files/rootfs-${CROSS:-arm64}/
    find -H  |  cpio -H newc -o | gzip -c - > $CI_PROJECT_DIR/artifacts/lava-rootfs-${CROSS:-arm64}.cpio.gz
    popd

    if [ -z "$CROSS" ]; then
        gzip -c artifacts/Image > Image.gz
        cat Image.gz artifacts/apq8016-sbc.dtb > Image.gz-dtb
        abootimg \
            --create artifacts/db410c.img \
            -k Image.gz-dtb \
            -r artifacts/lava-rootfs-${CROSS:-arm64}.cpio.gz \
            -c cmdline="ip=dhcp console=ttyMSM0,115200n8"
        rm Image.gz Image.gz-dtb
    fi

    # Store job ID so the test stage can build URLs to the artifacts
    echo $CI_JOB_ID > artifacts/build_job_id.txt

    # Pass needed files to the test stage
    cp $CI_PROJECT_DIR/.gitlab-ci/generate_lava.py artifacts/.
    cp $CI_PROJECT_DIR/.gitlab-ci/lava-deqp.yml.jinja2 artifacts/.
fi
