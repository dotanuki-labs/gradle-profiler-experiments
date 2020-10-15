#! /bin/sh

set -e

PURPLE="\033[0;35m"
CYAN="\033[0;36m"
NORMAL="\033[0m"

INTERATIONS=15
WARMUPS=4

function switch_jdk() {
	echo "Switching JDK ...";
 	export JAVA_HOME=`/usr/libexec/java_home -v $1`; 
 	java -version;
}

function jdkman() { 

  	if [[ $1 == "jdk8" ]]; then
  		switch_jdk "1.8*"
  	elif [[ $1 == "jdk11" ]]; then
  		switch_jdk "11*"
  	elif [[ $1 == "jdk13" ]]; then
  		switch_jdk "13*"
  	else
  		echo "Unsupported JDK spec / version -> $1"
  		return 0
  	fi
}

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
	echo "\n🔥 Cloning JakeWharton/SdkSearch ..."
	rm -rf SdkSearch
	git clone git@github.com:JakeWharton/SdkSearch.git > /dev/null 2>&1
}

function run_benchmark() {
	echo "\n🔥 Running benchmark for $1\n"
	rm -rf $1
	jdkman $1
	gradle-profiler \
		--benchmark --project-dir SdkSearch \
		--scenario-file jdks.scenario \
		--output-dir $1 \
		--iterations $INTERATIONS \
		--warmups $WARMUPS
}


echo "\n🚀 ${CYAN}Building Kotlin MPP with different JDKs${NORMAL}"

require_path
get_target_repo
run_benchmark jdk8
run_benchmark jdk11
