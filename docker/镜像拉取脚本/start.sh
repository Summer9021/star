#!/bin/bash
#新镜像标签：默认取当前时间作为标签名
imageNewTag=`date +%Y%m%d-%H%M%S`
#镜像仓库地址
registryAddr="sr.com.cn/"

#循环读取images.txt,并存入list中
n=0
 
for line in $(cat images.txt | grep ^[^#])
do
	list[$n]=$line
	((n+=1))
done

echo -e "\033[32m 请输入要推送的私有仓库地址 如 10.10.10.10:8080 ：\033[0m"
read REPO

echo "需拉取的镜像地址如下："
for variable in ${list[@]}
do
	echo ${variable}
done
 
for variable in ${list[@]}
do
	#下载镜像
	echo "准备拉取镜像: $variable"
	docker pull $variable
	
	# #获取拉取的镜像ID
	imageId=`docker images -q $variable`
	echo "[$variable]拉取完成后的镜像ID: $imageId"
	
	#获取完整的镜像名
	imageFormatName=`docker images --format "{{.Repository}}:{{.Tag}}:{{.ID}}" |grep $variable`
	echo "imageFormatName:$imageFormatName"
 
	#删掉左边第一个 / 及其左边的字符串
	#如：sun.rui.com:8080/sr/image/resource:sr-1.0.0-release:0beed7b2fa8c  ->  sr/image/resource:sr-1.0.0-release:0beed7b2fa8c
	repository=${imageFormatName#*/}
	echo "repository :$repository"
	
	#删掉右边第一个: 及其右边的字符串
	#如：sr/image/resource:sr-1.0.0-release:0beed7b2fa8c -> sr/image/resource:sr-1.0.0-release
	repository=${repository%:*}
 
	echo "我的地址: $REPO/$repository"
	#重新打镜像标签
	docker tag $imageId $REPO/$repository
	
	# #推送镜像
	docker push $REPO/$repository
done


