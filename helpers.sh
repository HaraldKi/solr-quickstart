## sourced in from other scripts, contains helper functions
initSolrFile() {
  local path="$1"
  local file=$(basename "$path")
  if [ -e "$SQSDATA/config/$file" ]; then
    return
  fi

  local solr=$(type -p solr)
  if [ -z "$solr" ]; then
    echo solr command must available via PATH
    exit 1
  fi
  local solrDir=$(dirname $(dirname $(readlink -f "$solr")))
  mkdir -p "$SQSDATA/config"
  cp "$solrDir/$path" "$SQSDATA/config"
}

isEmpty() {
  local varname="$1"
  local varvalue="${!varname}"
  if [ -z "$varvalue" ]; then
    shift
    echo >&2 $varname "$@"
    exit 1
  fi
}
getZk() {
  if [ "$ZKROOT" = "_" ]; then
    echo "localhost:9983/solr"
  else
    echo "$ZKROOT"
  fi
}
