# 使用 Rust 官方镜像
FROM rust:latest AS builder

# 设置工作目录
WORKDIR /app

# 复制源码
COPY src .

# 构建项目
RUN cargo build --release --features server --bin ncm-server

# 使用轻量级运行时镜像
FROM debian:bookworm-slim

# 安装必要的运行时库和时区数据
RUN apt-get update && apt-get install -y ca-certificates tzdata && rm -rf /var/lib/apt/lists/*


# 复制构建好的二进制文件
COPY --from=builder /app/target/release/ncm-server /usr/local/bin/ncm-server

# 暴露端口（默认 3000）
EXPOSE 3000

# 启动命令
CMD ["ncm-server"]