<!--
 * @Author: CollapseNav
 * @Date: 2020-06-25 20:15:57
 * @LastEditors: CollapseNav
 * @LastEditTime: 2020-06-25 20:49:25
 * @Description:
-->

# 使用git加持

## 前言

不管怎么弄,这个文档最终还是要放到服务器上(或者其他什么机器)去跑的,所以在自己的机上写好了之后还得往服务器上传一次
从我的角度来说,这事很麻烦
一种解决方案是之前提过的,直接使用远程的方式,直接在机器上写好了
但还是有点蠢
所以推出第二套方案
`git` + `crontab` 定时执行 `git pull` 操作
这样的话,只要我修改完之后提交更改,过段时间服务器上的文档就会自动更新
美滋滋~~~

## 建仓库

先在某个代码托管平台建一个仓库,我用的是 `gayhub`
建完仓库之后在需要部署的服务器上随便找个地方(自己要能找得到)

```bash
cd /XX
git clone http://XXX.XXX.com/XXX/MarkdownDoc.git
```

然后先把仓库拉下来

## 创建定时任务

linux下的定时任务使用 `crontab`
在 `terminal` 中输入

```bash
crontab -l
```

查看当前用户的定时任务列表
一般来说,是空的,需要自己创建新的定时任务
使用

```bash
crontab -e
```

编辑当前用户的定时任务列表
第一次使用的话会问你用什么编辑器
本来我还在找配置文件来着
后来没找到,就只能用nano来编辑了
在文件的最下方输入

```nano
*/1 * * * * cd /XX/MarkdownDoc;git pull
```

其中的 `5个*` 分别代表 `分 小时 天 月 年`
`*/1` 表示每隔一分钟执行一次
`cd /XX/MarkdownDoc;git pull` 表示
先 `cd` 到你的仓库目录,然后执行 `git pull` 操作
这样,只要你的仓库有更改,服务器上的内容就会在1分钟之内更新

## 真香

真香

[<--返回](./index.html)
