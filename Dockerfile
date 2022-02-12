# 以 ruby:3.0.3-alpine 为基础镜像进行构建
FROM ruby:3.0.3 AS base

RUN apt-get -y update
# WORKDIR 指定工作目录,如该目录不存在，WORKDIR 会帮你建立目录。会影响后面所有的层。
WORKDIR /root/app

FROM base AS dev
# 把本地文件夹中的的文件加到镜像工作目录(Gemfile 就在本地文件中)
COPY . /root/app/
# Gemfile:
# 1 source 'https://rubygems.org'   # https://gems.ruby-china.com(中国)
# 2 gem "rails", "~> 7.0.1"
RUN bundle install
