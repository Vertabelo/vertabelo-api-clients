#! /bin/bash

# Copyright {yyyy} {name of copyright owner}
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


prefix=https://my.vertabelo.com/api/

if [  -z $VERTABELO_API_TOKEN ]
then
	echo "VERTABELO_API_TOKEN is not set."
	exit 1;
fi


function call-curl() {
	curl -k -u $VERTABELO_API_TOKEN: $1
}

function xml() {
	local gid=$1
	call-curl ${prefix}xml/$gid
}

function sql() {
	local gid=$1

	call-curl ${prefix}sql/$gid
}


function usage() {

	echo "vertabelo.sh - Vertabelo API client"
	echo 
	echo "Usage:"
	echo "vertabelo.sh xml MODEL_ID > model.xml   - downloads model as XML file"
	echo "vertabelo.sh sql MODEL_ID > create.sql  - downloads DDL that creates a database schema"
	echo 
	echo 
	echo "Descriptions of VERTABELO_API_TOKEN and MODEL_ID can be found here:"
	echo "http://www.vertabelo.com/blog/documentation/vertabelo-api"
}


case $1 in

	xml)
		xml $2
		;;
	sql)
		sql $2
		;;
	*)
		usage
	;;
esac
echo
