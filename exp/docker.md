1. docker 运行mysql
```shell
docker run -d --name msql -e MYSQL_ROOT_PASSWORD=1 -p 3306:3306 mysql  
```
其中,-e 是设置密码,-d是在后台运行, 最后写镜像名称.  

- 启动容器后，进入mysql-shell
```shell
# docker exec -it 就代入到容器中执行命令
docker exec -it msql mysql -uroot -p
```

2. docker pull 和 docker run使用的代理方式不一样
[docker pull](/etc/systemd/system/docker.service.d/http-proxy.conf) 
```conf
[Service]
Environment="HTTP_PROXY= http://localhost:7890"
Environment="HTTPS_PROXY=http://localhost:7890"
```
具体文章[anyone's blog](https://neucrack.com/p/286)

3. docker 运行redis
```shell
docker run -d --name rds -p 6379:6379 redis  
``` 

4. docker 运行 ubuntu
```shell
docker run --name ubt -it ubuntu /bin/bash
```
> -it 是交互式操作, ubuntu是镜像名称, /bin/bash是启动的命令.

5. docker 运行已经存在的容器
```shell
docker start 容器id
```
6. docker 进入容器
```shell
docker exec -it 容器id /bin/bash
```
> 在docker中下载一个容器, 这个容器不仅仅是一个应用, 还是一个完整的linux环境, 可以在这个容器中安装软件, 修改配置文件, 甚至可以卸载软件, 但是这些修改都是在这个容器中, 不会影响到宿主机.
7. 把主机的文件拷贝到容器中
```shell
docker cp /etc/hosts 容器id:/etc/hosts
```

7. docker删除镜像
```shell
docker rmi 镜像id
```

