#!/usr/bin/env bash

set -euo pipefail

# TODO: Ensure this is the correct GitHub homepage where releases can be downloaded for umbra.
GH_REPO="https://github.com/pmqueiroz/umbra"
TOOL_NAME="umbra"

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3-
}

list_all_versions() {
	list_github_tags
}

define_version() {
	local version="$1"
	if [[ "$version" == 1.14.* || "$version" > 1.14.0 ]]; then
		version="v$version"
	fi

	echo "$version"
}

download() {
	local url="$1"
	local filename="$2"

	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

download_release() {
	local version
	version=$(define_version "$1")
	local platform="$2"
	local arch="$3"
	local filename="$4"

	url="$GH_REPO/releases/download/${version}/umbra-${version}-${platform}-${arch}.tar.gz"

	download "$url" "$filename"
}

download_sha() {
	local version
	version=$(define_version "$1")
	local platform="$2"
	local arch="$3"
	local filename="$4"

	url="$GH_REPO/releases/download/${version}/umbra-${version}-${platform}-${arch}.tar.gz.sha256"

	download "$url" "$filename"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}"
	local executable_path="$install_path/bin/$TOOL_NAME"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		test -x "$executable_path" || fail "Expected $executable_path to be executable."

		msg "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $TOOL_NAME."
	)
}


get_platform() {
  local platform=""

  platform="$(uname | tr '[:upper:]' '[:lower:]')"

  case "$platform" in
    linux | darwin)
      ;;
    *)
      fail "Platform '${platform}' not supported!"
      ;;
  esac

  printf "%s" "$platform"
}

get_arch() {
  local arch=""
  local arch_check
	arch_check=$(uname -m)
  case "${arch_check}" in
    x86_64 | amd64) arch="amd64" ;;
    aarch64 | arm64) arch="arm64" ;;
    *)
      fail "Arch '${arch_check}' not supported!"
      ;;
  esac

  printf "%s" "$arch"
}

msg() {
  echo -e "\033[32m$1\033[39m" >&2
}

err() {
  echo -e "\033[31m$1\033[39m" >&2
}

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}
