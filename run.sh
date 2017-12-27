

if [ -d "~/mtf-cms" ]; then
	cd ~/mtf-cms && git pull origin master
else
	git clone https://github.com/keeshzhang/mtf-cms.git ~/mtf-cms
fi

if [ -d "~/mtf-cms-a4" ]; then 
	cd ~/mtf-cms-a4 && git pull origin master
else
	git clone https://github.com/keeshzhang/mtf-cms-a4.git ~/mtf-cms-a4	
fi 

docker pull ubuntu:16.10
docker pull chunhui2001/ubuntu_1610_dev:java8_mtf_server
docker rm -f app.mtfcms.server.volume app.mtfcms.server.hub app.mtfcms.server.java 1>/dev/null 2>&1

docker create -v ~/mtf-cms:/root/app/mtf-cms -v ~/mtf-cms-a4:/root/app/mtf-cms-a4 --name app.mtfcms.server.volume ubuntu:16.10
docker run -it --name app.mtfcms.server.hub --volumes-from app.mtfcms.server.volume chunhui2001/ubuntu_1610_dev:java8_mtf_server /root/ansinble.sh
docker create -p 9180:9181 --name app.mtfcms.server.java --volumes-from app.mtfcms.server.volume chunhui2001/ubuntu_1610_dev:java8_mtf_server /usr/local/maven/bin/mvn exec:java

#docker restart app.mtfcms.server.hub && docker logs -f app.mtfcms.server.hub
docker start app.mtfcms.server.java && docker logs -f app.mtfcms.server.java
docker restart app.mtfcms.server.java && docker logs -f app.mtfcms.server.java