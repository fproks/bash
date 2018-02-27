docker cp found.sh mdfcp:/opt/ericsson/bm-sc/mdf-cp/default/deployments/release/
docker exec -it mdfcp  sh -c "bash /opt/ericsson/bm-sc/mdf-cp/default/deployments/release/found.sh && rm -f /opt/ericsson/bm-sc/mdf-cp/default/deployments/release/found.sh && exit"

