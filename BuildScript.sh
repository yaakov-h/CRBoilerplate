#!/bin/bash

PROJECT_NAME='CRBoilerplate'
SDKS="iphoneos iphonesimulator"
BUILD_ROOT='build'

TARGET_NAME="${PROJECT_NAME}"
PROJECT_FILE="${PROJECT_NAME}.xcodeproj"
BUILD_TMP="${BUILD_ROOT}/tmp"

pushd .

if [ ! -d "${BUILD_TMP}" ]
then
    mkdir -p "${BUILD_TMP}"
fi

for SDK in ${SDKS}
do
    BUILD_DIR="${BUILD_TMP}/build-sdk-${SDK}"
    mkdir "${BUILD_DIR}"
    xcodebuild -project "${PROJECT_FILE}" -target "${TARGET_NAME}" -sdk "${SDK}" CONFIGURATION_BUILD_DIR="${BUILD_DIR}"
done

FINAL_DIR="${BUILD_ROOT}"

OUTPUT_STATIC_LIB=$(find . -name "*${TARGET_NAME}.a" -exec basename "{}" \; | uniq)

lipo -output "${BUILD_ROOT}/${OUTPUT_STATIC_LIB}" -create $(find "${BUILD_TMP}" -name "*${OUTPUT_STATIC_LIB}")

cp -R "${BUILD_TMP}/$(ls build/tmp/ | head -n1)/include" "${BUILD_ROOT}/include"

popd