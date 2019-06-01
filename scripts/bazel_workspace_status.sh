#!/bin/bash

echo "BUILD_HASH $(git rev-parse HEAD)"
echo "BUILD_HASH_SHORT $(git rev-parse --short HEAD)"
echo "BUILD_HASH_STABLE $(git describe --match=xxx --always --abbrev=40)"
echo "BUILD_HASH_STABLE_SHORT $(git describe --match=xxx --always)"
