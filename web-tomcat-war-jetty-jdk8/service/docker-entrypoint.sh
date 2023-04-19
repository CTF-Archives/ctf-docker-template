#!/bin/sh

user=$(ls /home)
if [ ! $DASFLAG ]; then
    if [ ! $FLAG ]; then
        if [ ! $GZCTF_FLAG ]; then
            echo flag{TEST_Dynamic_FLAG} | tee /home/$user/flag /flag
        else
            echo $GZCTF_FLAG | tee /home/$user/flag /flag
            export GZCTF_FLAG=no_FLAG
            GZCTF_FLAG=no_FLAG
        fi
    else
        echo $FLAG | tee /home/$user/flag /flag
        export FLAG=no_FLAG
        FLAG=no_FLAG
    fi
else
    echo $DASFLAG | tee /home/$user/flag /flag
    export DASFLAG=no_FLAG
    DASFLAG=no_FLAG
fi

set -e

if [ "$1" = jetty.sh ]; then
	if ! command -v bash >/dev/null 2>&1 ; then
		cat >&2 <<- 'EOWARN'
			********************************************************************
			ERROR: bash not found. Use of jetty.sh requires bash.
			********************************************************************
		EOWARN
		exit 1
	fi
	cat >&2 <<- 'EOWARN'
		********************************************************************
		WARNING: Use of jetty.sh from this image is deprecated and may
			 be removed at some point in the future.
			 See the documentation for guidance on extending this image:
			 https://github.com/docker-library/docs/tree/master/jetty
		********************************************************************
	EOWARN
fi

if ! command -v -- "$1" >/dev/null 2>&1 ; then
	set -- java -jar "$JETTY_HOME/start.jar" "$@"
fi

: ${TMPDIR:=/tmp/jetty}
[ -d "$TMPDIR" ] || mkdir -p $TMPDIR 2>/dev/null

: ${JETTY_START:=$JETTY_BASE/jetty.start}

case "$JAVA_OPTIONS" in
	*-Djava.io.tmpdir=*) ;;
	*) JAVA_OPTIONS="-Djava.io.tmpdir=$TMPDIR $JAVA_OPTIONS" ;;
esac

if expr "$*" : 'java .*/start\.jar.*$' >/dev/null ; then
	# this is a command to run jetty

	# check if it is a terminating command
	for A in "$@" ; do
		case $A in
			--add-to-start* |\
			--create-files |\
			--create-startd |\
			--download |\
			--dry-run |\
			--exec-print |\
			--help |\
			--info |\
			--list-all-modules |\
			--list-classpath |\
			--list-config |\
			--list-modules* |\
			--stop |\
			--update-ini |\
			--version |\
			-v )\
			# It is a terminating command, so exec directly
			JAVA="$1"
			shift
			exec $JAVA $JAVA_OPTIONS "$@"
		esac
	done

	if [ $(whoami) != "jetty" ]; then
		cat >&2 <<- EOWARN
			********************************************************************
			WARNING: User is $(whoami)
			         The user should be (re)set to 'jetty' in the Dockerfile
			********************************************************************
		EOWARN
	fi

	if [ -f $JETTY_START ] ; then
		if [ $JETTY_BASE/start.d -nt $JETTY_START ] ; then
			cat >&2 <<- EOWARN
			********************************************************************
			WARNING: The $JETTY_BASE/start.d directory has been modified since
			         the $JETTY_START files was generated.
			         To avoid regeneration delays at start, either delete
			         the $JETTY_START file or re-run /generate-jetty-start.sh
			         from a Dockerfile.
			********************************************************************
			EOWARN
			/generate-jetty-start.sh "$@"
		fi
		echo $(date +'%Y-%m-%d %H:%M:%S.000'):INFO:docker-entrypoint:jetty start from $JETTY_START
		set -- $(cat $JETTY_START)
	else
		/generate-jetty-start.sh "$@"
		set -- $(cat $JETTY_START)
	fi
fi

if [ "${1##*/}" = java -a -n "$JAVA_OPTIONS" ] ; then
	JAVA="$1"
	shift
	set -- "$JAVA" $JAVA_OPTIONS "$@"
fi

exec "$@"
