#!/bin/bash

# check_norminette
#
# Runs norminette against the student's project and reports it as a
# single PASS/FAIL check, only surfacing the full norm-error output
# when it fails. norminette is an optional local tool (not every
# student has it installed), so a missing binary is a skip, not a fail.
#
# Sourced by each part's norminette.sh; cwd is the mini-moul directory,
# the student's project is at ../

check_norminette()
{
	local error=0
	local output

	if ! command -v norminette &> /dev/null; then
		printf "    ${GREY}norminette not found, skipping norm check${DEFAULT}\n"
		return 0
	fi

	output="$(norminette .. 2>&1)"
	if [ $? -eq 0 ]; then
		printf "  ${GREEN}${CHECKMARK}${GREY} [1] norminette passes${DEFAULT}\n"
	else
		printf "    ${RED}[1] norminette found errors:${DEFAULT}\n"
		printf '%s\n' "$output" | sed 's/^/    /'
		error=1
	fi
	return $error
}
