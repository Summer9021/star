# CentOS 7 系统安装 MySQL
## 1. 下载并安装 MySQL Yum 仓库
```shell
wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
sudo rpm -ivh mysql80-community-release-el7-3.noarch.rpm
```
## 2. 安装 MySQL 服务器
```shell
sudo yum install mysql-server
```
## 3. 启动 MySQL 服务并设置开机自启
```bash
   sudo systemctl start mysqld
   sudo systemctl enable mysqld
```
## 4. 查看初始密码
   MySQL 8.0 在安装完成后会生成一个初始密码，可通过以下命令查看：
```bash
   sudo grep 'temporary password' /var/log/mysqld.log
```
   记录下输出中的密码。
## 5. 登录 MySQL 并修改密码
```bash
   mysql -u root -p
```
   输入上一步记录的初始密码登录。登录成功后，修改 root 用户密码：
```sql
   ALTER USER 'root'@'localhost' IDENTIFIED BY 'YourNewPassword';
```   
   将 YourNewPassword 替换为你自己设置的强密码。
# Ubuntu 20.04 系统安装 MySQL
## 1. 更新系统软件包列表
```bash
   sudo apt update
```
## 2. 安装 MySQL 服务器
```bash
   sudo apt install mysql-server
```
## 3. 启动 MySQL 服务并设置开机自启
```bash
   sudo systemctl start mysql
   sudo systemctl enable mysql
```
## 4. 运行安全脚本
```bash
   sudo mysql_secure_installation
```
   按照提示进行操作，包括设置 root 密码、移除匿名用户、禁止 root 远程登录等。
## 5. 登录 MySQL
```bash
   mysql -u root -p
```
   输入你设置的 root 密码登录。

# Windows Server 系统安装 MySQL
## 1. 下载 MySQL Installer
   访问 MySQL 官方下载页面（https://dev.mysql.com/downloads/installer/），选择适合你系统的 MySQL Installer 版本进行下载。
## 2. 运行安装程序
   双击下载的安装程序文件，按照安装向导的提示进行操作：
   选择安装类型：选择 “Developer Default”（开发者默认）或 “Server only”（仅安装服务器），根据你的需求进行选择。
   配置 MySQL 服务器：设置 MySQL 服务器的端口（默认 3306）、root 用户密码等。
   安装组件：确认要安装的 MySQL 组件，然后点击 “Execute”（执行）开始安装。
## 3. 完成安装
   安装完成后，点击 “Finish”（完成）退出安装向导。
## 4. 验证安装
   打开命令提示符，输入以下命令登录 MySQL：
```bash
   mysql -u root -p
```
   输入你设置的 root 密码，如果能够成功登录，说明 MySQL 安装成功。
   注意事项
   密码安全：设置强密码，包含字母、数字和特殊字符，以提高数据库的安全性。
   防火墙设置：如果服务器启用了防火墙，需要开放 MySQL 端口（默认 3306），允许外部访问。在 CentOS 上可以使用以下命令开放端口：
```bash
   sudo firewall-cmd --permanent --add-port=3306/tcp
   sudo firewall-cmd --reload
```
   在 Ubuntu 上可以使用以下命令：
```bash
   sudo ufw allow 3306
```
   配置文件：根据需要可以修改 MySQL 的配置文件（如 /etc/my.cnf 或 /etc/mysql/mysql.conf.d/mysqld.cnf），调整数据库的性能参数。

# 本机测试下载 mysql
## 1 官方网站下载
访问 MySQL 官方下载页面 如下链接
https://dev.mysql.com/downloads/mysql/
打开浏览器，访问 MySQL 官方下载页面。
选择版本和操作系统
在页面中找到 MySQL 8.0 系列版本，然后在 “Select Operating System” 中选择 “macOS” ，在 “Select OS Version” 中选择与 macOS 15 对应的选项（可能是 macOS 13+ 之类相近的选项，因为 MySQL 版本可能不会精确到 macOS 15）。
选择下载类型
一般有 DMG Archive（磁盘镜像文件，安装较为方便）等类型可供选择，你可以按需选择。
开始下载
点击下载按钮，如果是首次从 MySQL 官网下载，可能会要求你注册 Oracle 账户，你可以选择 “No thanks, just start my download.” 跳过注册直接下载。
## 2 使用 Homebrew 下载（前提是你已经安装了 Homebrew）
如果你使用 Homebrew 这个包管理工具，也可以通过以下命令尝试安装 MySQL 8.0.41（不过 Homebrew 可能默认安装最新稳定版，如果要指定版本可能需要一些额外操作）：
更新 Homebrew
在终端中执行以下命令更新 Homebrew 到最新状态：
```bash
brew update
```
安装 MySQL 尝试安装 MySQL：
```bash
brew install mysql@8.0
```
如果 Homebrew 中没有 8.0.41 版本，可能无法精确安装到该版本，但能安装相近的 8.0 系列版本。若要指定特定版本，你可能需要手动从 Homebrew 的公式库中查找对应版本的安装文件进行操作，这会相对复杂一些。
## 注意事项
安装配置：下载完成后，按照对应的安装步骤完成 MySQL 的安装，安装过程中可能需要设置 root 用户密码等信息，安装完成后还可能需要进行一些配置，如设置环境变量等。
兼容性：确保你的 macOS 15 系统与 MySQL 8.0.41 版本兼容，虽然一般来说较新的 MySQL 版本对较新的 macOS 系统支持较好，但仍需留意可能出现的兼容性问题。
