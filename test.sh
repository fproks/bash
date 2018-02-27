JBOSS_PID=(`ps -ef |grep docker |awk '{print $2}'`)
len=${#JBOSS_PID[@]}
echo $len

echo '--------------'
if [ $len > 0 ]
then 
for i in ${JBOSS_PID[@]}
    do
    echo $i
done
fi