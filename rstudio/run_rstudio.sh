#!/usr/bin/env bash

set -euo pipefail

version=4.1.2
rstudio_image=davetang/rstudio:${version}
container_name=rstudio_dtang
port=8888
package_dir=${HOME}/r_packages_${version}

if [[ ! -d ${package_dir} ]]; then
   mkdir ${package_dir}
fi

docker run -d \
   -p $port:8787 \
   --restart always \
   --name $container_name \
   -v ${package_dir}:/packages \
   -v ~/github/:/home/rstudio/work \
   -v ~/analysis/:/analysis \
   -e PASSWORD=password \
   -e USERID=$(id -u) \
   -e GROUPID=$(id -g) \
   $rstudio_image

>&2 echo $container_name listening on port $port

exit 0

