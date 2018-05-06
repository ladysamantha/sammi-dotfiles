#!/usr/bin/env bash

set -e

_UNAME="$(uname -s)"

case "${_UNAME}" in
    Linux*) _OS="linux"
    ;;
    Darwin*) _OS="darwin"
    ;;
    *)
        echo "ERROR: ${_UNAME} is an unsupported OS"
        exit 1
    ;;
esac

BAZEL_VER="0.12.0"
BAZEL_FILE="bazel-${BAZEL_VER}-installer-${_OS}-x86_64.sh"
BAZEL_SHA_FILE="${BAZEL_FILE}.sha256"
BAZEL_URL="https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VER}/${BAZEL_FILE}"
BAZEL_SHA_URL="${BAZEL_URL}.sha256"

pushd /tmp || (echo "Failed to cd to /tmp" && exit 255)

curl -sSL "${BAZEL_URL}" > "${BAZEL_FILE}"
curl -sSL "${BAZEL_SHA_URL}" > "${BAZEL_SHA_FILE}"

ls -lHa
cat "$BAZEL_SHA_FILE"

sha256sum -c "${BAZEL_URL}" >/dev/null 2>&1 || {
    echo "ERROR: sha256 checksum for '${BAZEL_FILE}' failed"
    exit 1
}

bash "${BAZEL_FILE}" --user
rm "${BAZEL_FILE}" "${BAZEL_SHA_FILE}"

popd || (echo "Failed to cd back to ${_DIR}" && exit 255)

unset "$_OS"
unset "$_UNAME"

