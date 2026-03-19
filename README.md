# ncm-api-rs 构建与使用

本项目用于自动检测并构建 [imsyy/ncm-api-rs](https://github.com/imsyy/ncm-api-rs) 项目，提供 Docker 镜像和多平台二进制文件。

## 功能特点

- 自动检测原始仓库的更新
- 构建多平台 Docker 镜像（amd64 和 arm64）
- 构建多平台二进制文件（Windows、Linux、macOS）
- 推送镜像到 Docker Hub 和 GitHub Container Registry
- 发布二进制文件到 GitHub Releases
- 支持缓存以提高构建速度

## 构建流程

1. 定时触发（每 12 小时）或手动触发
2. 检出原始仓库代码
3. 检查最新提交哈希
4. 检查缓存是否存在
5. 构建多平台二进制文件
6. 构建并推送 Docker 镜像
7. 发布二进制文件到 GitHub Releases

## 如何使用

### 方式一：使用 Docker 镜像

```bash
# 从 Docker Hub 拉取
 docker pull lovely02/ncm-api-rs:latest

# 从 GitHub Container Registry 拉取
 docker pull ghcr.io/lovely02/ncm-api-rs:latest

# 运行容器
 docker run -d -p 3000:3000 lovely02/ncm-api-rs:latest

# 带环境变量运行
 docker run -d -p 3000:3000 \
   -e REAL_IP=127.0.0.1 \
   lovely02/ncm-api-rs:latest
```

### 方式二：使用二进制文件

1. 访问 [GitHub Releases](https://github.com/lovely02/ncm-api-rs/releases/tag/latest) 下载对应平台的二进制文件
2. 解压并运行

#### Windows

```bash
# 下载并解压后，直接运行
ncm-server.exe

# 或在命令行中运行
./ncm-server.exe
```

#### Linux

```bash
# 下载并解压后，添加执行权限
chmod +x ncm-server

# 运行
./ncm-server
```

#### macOS

```bash
# 下载并解压后，添加执行权限
chmod +x ncm-server

# 运行
./ncm-server
```

## 配置说明

### 环境变量

- `NCM_HOST`：监听地址，默认为 0.0.0.0
- `NCM_PORT`：监听端口，默认为 3000
- `CORS_ALLOW_ORIGIN`：允许的 CORS 域，默认为 \*

### 命令行参数

```bash
# 指定端口
NCM_PORT=8080 ./ncm-server
```

## API 使用

服务启动后，可通过以下地址访问 API：

- 基础 URL：`http://localhost:3000`

## 注意事项

- 本项目仅供学习使用，请尊重版权
- 不要频繁调用登录接口，否则可能会被风控
- 部分接口在国外服务器上使用可能会受到限制，可使用 real_ip 参数传入国内 IP
- 二进制文件需要根据操作系统和架构选择对应版本
