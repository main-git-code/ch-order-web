1.编译打包
#一定要先clean
gradle clean
#然后再打包
gradle build -x test

2.生成镜像
#在本地生成带私服前缀的镜像  (每次打镜像前版本号要更新)
docker build -t 10.19.13.18:5000/ch-order-web:v1.0 .
#将镜像推送到私服
docker push 10.19.13.18:5000/ch-order-web:v1.0

3. 运行镜像
#--net=host  表示为主机(host)模式  去掉该配置，默认为桥接(bridge)模式
#-e 代表需要设置的环境变量
docker run -d --name ch-order-web  -p 14135:8080  -e "REST_REGISTRY_ADDR=10.19.13.19:29181" -e "casServerLoginUrl=http://10.19.13.19:14125/login"  -e "casServerUrlPrefix=http://10.19.13.19:14125"   -e "serverName=http://10.19.13.19:14135"   -e "logOutServerUrl=http://10.19.13.19:14125/logout"   -e "logOutBackUrl=http://10.19.13.19:14125"   -e "casServerLoginUrl_Inner=http://10.19.13.19:14125/login"  -e "casServerUrlPrefix_Inner=http://10.19.13.19:14125"   -e "serverName_Inner=http://10.19.13.19:14135"   -e "logOutServerUrl_Inner=http://10.19.13.19:14125/logout"   -e "logOutBackUrl_Inner=http://10.19.13.19:14125"    -e "innerDomains=changhong.com" -e "SDK_MODE=0" -e "CCS_NAME=aiopt-ch-order-web" -e "LOGISTICS_URL=http://124.207.3.100:8083/opaas/22/http/srv_up_3rdlogistics_iddetails" -e "CH_REFUNDNOTICE_URL=http://111.9.116.181:14135/notice/refundNotice" -e "INTEGRAL_SEARCH_URL=http://124.207.3.100:8083/opaas/http/srv_up_integral_cash_qry" -e "INTEGRAL_SHOPBACK_URL=http://124.207.3.100:8083/opaas/http/srv_up_integral_shopback_trade" -e "CH_USERNAME_URL=http://124.207.3.100:8083/opaas/http/srv_up_user_getuserdetialbyname_qry" -e "CH_PAY_URL=https://pay.changhong.com/upp-route/entry.html" -e "INVOICE_PRINT_URL=http://bill.chfcloud.com/BILL/" -e "INVOICE_PRINT_LOGINNAME=123456" -e "INVOICE_PRINT_PASSWORD=123456"  -e "ZK_ADDR=10.19.13.13:29181" -e "whitelist=changhong.com" 10.19.13.18:5000/ch-order-web:v1.0  
#查看镜像启动日志
docker logs ch-order-web-v1.0
#进入容器，查看镜像内部的情况
docker exec -it ch-order-web /bin/bash
#删除运行的容器
docker rm -fv ch-order-web

#=============更新日志========================#
*2016-09-23
1）初始打包
