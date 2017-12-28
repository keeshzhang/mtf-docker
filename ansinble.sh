#!/usr/bin/env bash


eval `ssh-agent -s`
ssh-add ~/.ssh/mtf_agent_rsa

echo '|1|o0+hvOuQP3K9aZE7zjXkDCQfLm4=|Z0dBwPcUAAJ6e6+0ap5lE6yYges= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==' >> /root/.ssh/known_hosts

cd /root/app/mtf-cms && git remote set-url origin git@github.com:keeshzhang/mtf-cms.git

cd /root/app/mtf-cms && git pull origin master
cd /root/app/mtf-cms-a4 && git pull origin master

#cd /root/app/mtf-cms-a4 && npm install --registry https://registry.cnpmjs.org && ./sync.sh
cd /root/app/mtf-cms && /usr/local/maven/bin/mvn clean compile dependency:copy-dependencies

