#! /bin/bash
cd /opt/ericsson/bm-sc/mdf-cp/default/deployments/release
ls -l
rm -f *.undeployed
chown mdfcp:bmsc *
chmod 750 diameter-stack.rar
chmod 750 mdf-cp-mb2c-0.1.ear
# awk 可以获取数据变成一列, 按空格分割,取每一行的第二个
JBOSS_PID=(`ps -ef |grep jboss |awk '{print $2}'`) 
pid_len=${#JBOSS_PID[@]}
if [ $pid_len > 0 ] ; then
    for pid in ${JBOSS_PID[@]}
    do
        ps $pid
        kill -9 $pid
    done
    echo -e "\033[34m jboss has been shutdown \033[0m"
else
    echo -e "\033[34m jboss doesn't run,no need shutdown \033[0m"
fi
rm -f *.isundeploying
rm -f *.undeployed
rm -f *.isdeploying

echo -e "\033[034m prepare finish \033[0m"
