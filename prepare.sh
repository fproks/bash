#! /bin/bash
cd /home/linhos/BMSC/bdc-test/bdc-jcat-test/mdfcp-test/src/main/resources/debug
bash ./prepare_docker_env.sh
# 启动docker
# 编译jar包
cd /home/linhos/BMSC/bmsc-mdf-cp
mvn clean install -Dmaven.test.skip=true

# 解压
cd release
file="mdf-cp-package-0.1-bin.tar.gz"
if [ -f "$file" ]
    then
        echo -e "\033[33m $file found \033[0m"
        tar -zxvf $file
    else
        echo -e "\033[31m $file not found, process 退出 \033[0m"
        exit
    fi
fi

echo -e "\033[034m docker 准备完毕 \033[0m"
# 导入文件执行脚本
cd /home/linhos/BMSC/bmsc-mdf-cp/release/mdf-cp-package-0.1/release
docker cp diameter-stack.rar mdfcp:/opt/ericsson/bm-sc/mdf-cp/default/deployments/release
docker cp mdf-cp-mb2c-0.1.ear mdfcp:/opt/ericsson/bm-sc/mdf-cp/default/deployments/release
docker cp found.sh mdfcp:/opt/ericsson/bm-sc/mdf-cp/default/deployments/release
docker exec -it mdfcp  sh -c "bash /opt/ericsson/bm-sc/mdf-cp/default/deployments/release/found.sh && rm -f /opt/ericsson/bm-sc/mdf-cp/default/deployments/release/found.sh && exit"



