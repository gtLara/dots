Vim�UnDo� .4���������Fy7���w��ye'�m�չ��                                      c�      _�                      	        ����                                                                                                                                                                                                                                                                                                                                                             c��     �                  	#!/bin/sh       a# A dwm_bar function to display information regarding system memory, CPU temperature, and storage   &# Joe Standring <git@joestandring.com>   # GNU GPLv3       dwm_resources (){   4        TEMP=$(sensors | awk '/^Core 0/ {print $3}')           printf "%s" "$TEMP"   }       dwm_resources5�5��