#!/bin/bash -x
#########################################################################
#      Copyright (C) 2020        Sebastian Francisco Colomar Bauza      #
#      SPDX-License-Identifier:  GPL-2.0-only                           #
#########################################################################
export debug=$debug							;
export deploy=$deploy							;
export stack=$stack							;
#########################################################################
set +x && test "$debug" = true && set -x 				;
#########################################################################
domain=raw.githubusercontent.com                                        ;
#########################################################################
file=functions.sh                                                       ;
path=secobau/docker/master/AWS/common					;
curl -O https://$domain/$path/$file                                     ;
source ./$file                                                          ;
rm --force ./$file							;
#########################################################################
file=deploy.sh    	                                                ;
path=secobau/proxy2aws/master/Kubernetes/Shell				;
targets=" InstanceManager1 " 						;
exec_remote_file_targets $domain $file $path $stack "$targets"		;
#########################################################################