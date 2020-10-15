#! /bin/sh

set -e

CYAN="\033[0;36m"
NORMAL="\033[0m"

SUNFLOWER_COMMITS="https://github.com/android/sunflower/commits"

INTERATIONS=15
WARMUPS=3

function require_path() {
	echo "\n🔥 Validating your path"

	GIT=`which git`
	
	if [[ ! -f ${GIT} ]]; then
		echo "Git should be available in your path."
		echo "Install it with ${PURPLE}brew install git${NORMAL}"
		echo "Aborting."
		exit 1
	fi


	PROFILER=`which gradle-profiler`
	
	if [[ ! -f ${PROFILER} ]]; then
		echo "Gradle Profiler should be available in your path"
		echo "Install it with ${PURPLE}brew install gradle-profiler${NORMAL}"
		echo "Aborting\n"
		exit 1
	fi

	echo ":: Found git → ${PURPLE}${GIT}${NORMAL}"
	echo ":: Found gradle-profiler → ${PURPLE}${PROFILER}${NORMAL}"
}

function get_target_repo() {
	echo "\n🔥 Cloning android/sunflower ..."
	rm -rf SdkSearch
	git clone git@github.com:android/sunflower.git > /dev/null 2>&1
}

function run_benchmark() {
	rm -rf $1
	cd sunflower
	git checkout $2
	cd ..

	gradle-profiler \
		--benchmark --project-dir sunflower \
		--scenario-file bumps.scenario \
		--output-dir $1 \
		--iterations $INTERATIONS \
		--warmups $WARMUPS
}

echo "\n${CYAN}Experiment : Improvements when bumping AGP and Gradle from 3.6.x to 4.0.x${NORMAL}"

require_path
get_target_repo

echo "\n🔥 Running benchmark for older AGP(3.6.3) and Gradle (5.6.4)\n"
echo "→ Reference : $SUNFLOWER_COMMITS/9a345fea17222ee8c0955ae90f97a2a382ca5c5c"
run_benchmark "older" "9a345fea17222ee8c0955ae90f97a2a382ca5c5c"

echo "\n🔥 Running benchmark for newer AGP (4.0.0) and Gradle (6.1.1)\n"
echo "→ Reference : $SUNFLOWER_COMMITS/a59735bf0ca216fc38c83c6cad103147306956b3"
run_benchmark "newer" "a59735bf0ca216fc38c83c6cad103147306956b3"
