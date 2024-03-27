#!/bin/bash

# get sha256 of the file you are wanting to verify
if [[ -n "${1}" ]] && [[ -f "${1}" ]] && [[ ! -d "${1}" ]]; then
	sha_of_file_to_verify="$(shasum -a512 "${1}")"
else
	printf "error bad first argument" && exit 1
fi

# check to see if the known shasum is being given as a file
if [[ -n "${2}" ]] && [[ -f "${2}" ]]; then
	known_sha_of_file="$(cat "${2}")"
	# else if the string IS non-zero and is NOT directory and is NOT file
elif [[ -n "${2}" ]] && [[ ! -d "${2}" ]] && [[ ! -f "${2}" ]]; then
	known_sha_of_file="$(printf "%s" "${2}")"
else
	printf "error bad second argument" && exit 1
fi

# make sure variables are not empty
[[ "${sha_of_file_to_verify}" = "" ]] && exit 1
[[ "${known_sha_of_file}" = "" ]] && exit 1

# Check to see if the sha256 parts match in both the variables(inputs)
printf "%s %s"  "${sha_of_file_to_verify}" "${known_sha_of_file}" | awk '{if ($1==$3) {print "SHA256SUM Matched Correctly. Good to Go!"} else {print "SHA256SUM DID NOT MATCH! DO NOT PROCEED!!!!"}}'

