# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...



## note

### docker 从 0 开始新建一个 rails 应用的方法

- #### 准备三个文件 [Dockerfile,Gemfile,docker-compose.yml]

  - ##### Dockerfile: (用于构建镜像 安装Ruby,Rails）

    ```dockerfile
    # 以 ruby:3.0.3-alpine 为基础镜像进行构建
    FROM ruby:3.0.3-alpine
    # apk: Alpine Linux 包管理工具
    #   --no-cache  Do not use any local cache path
    #   build-base: 是一个元包，提供程序编译所需的库（和编译器？？）
    #   tzdata: 在docker container 中不能自动识别宿主机的时区，可通过安装tzdata软件包，
    #           配置TZ环境变量识别正确时区．
    #   file ??
    #   libpq-dev: 好像是一个和 postgresql 相关的标准库。
    #   imagemagick：读取各种各样的图片的工具
    # 如不需要管理 js 的信赖包后面的工具不需要安装
    RUN apk add --no-cache build-base libpq-dev mysql-dev mysql-client imagemagick tzdata nodejs \
            yarn npm file git bash
    # WORKDIR 指定工作目录,如该目录不存在，WORKDIR 会帮你建立目录。会影响后面所有的层。
    WORKDIR /root/app
    # 把本地文件夹中的的文件加到镜像工作目录(Gemfile)
    COPY Gemfile /root/app/Gemfile
    # 安装 gem, 其实这一步只是为了在 docker 里面安装 rails，用到的 Gemfiel 如下。
    # 在项目的根目录下建下只有下面内容的 Gemfile
    # Gemfile:
    # 1 source 'https://rubygems.org'   # https://gems.ruby-china.com(中国)
    # 2 gem "rails", "~> 7.0.1"
    RUN bundle install
    # 把本地文件夹中的的文件加到镜像工作目录,不需要解压文件的时候不用 ADD
    COPY . /root/app/
    ```

    ##### Gemfile:（这个文件只是为了安装 Rails 准备的）

    ```ruby
    # gem 仓库，也可以使用国外的
    source "https://gems.ruby-china.com"
    ruby "3.0.3"
    
    # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
    gem "rails", "~> 7.0.1"
    ```

    ##### docker-compose.yml（统一管理项目中的所有服务）

    ```yml
    version: "3"
    
    services:
      web:
        build: .
        command: [ "bin/rails", "s", "-b", "0.0.0.0" ]
        volumes:
          - .:/root/app
        ports:
          - "3000:3000"
          - "9292:9292"
      # pg:
      #   image: "postgres:14"
      #   environment:
      #     POSTGRES_PASSWORD: password
      #   ports:
      #     - "5432:5432"
      mysql:
        image: "mysql:8.0"
        command: --default-authentication-plugin=mysql_native_password --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
        # platform: linux/amd64
        environment:
          MYSQL_ROOT_PASSWORD: password
        ports:
          - "3307:3306"
      redis:
        image: redis:5
        ports:
          - "6379:6379"
      mailhog:
        image: mailhog/mailhog
        environment:
          MH_STORAGE: maildir
          MH_MAILDIR_PATH: ./tmp/mailhog
        ports:
          - "1025:1025"
          - "8025:8025"
    
    ```

- #### 创建 rails 应用

  - 新那应用的文件夹，将上面的三个文件准备好执行`docker-compose run web rails new . --force --database=postgresql --skip-bundle`

    ##### 命令解释

    `docker-compose run web`是启动的命令，在 docker-compose.yml 中有定义相应的服务。

    `rails new . --force --database=mysql --skip-bundle`是创建 rails 应用的命令，将应用创建在`.`目录下，在 Dockerfile 中已将工作目录指定为`WORKDIR /root/app`所以`.`就是`/root/app`命令生成的文件都会放在这个地方。

    

    ###### `rails new `选项说明：（可以用 rails new --help 查看）

    >$ rails new --help
    >
    >Usage:
    >
    > rails new APP_PATH [options]
    >
    >...
    >
    > -d, [--database=DATABASE]                 # Preconfigure for selected database (options: mysql/postgresql/sqlite3/oracle/frontbase/ibm_db/sqlserver/jdbcmysql/jdbcsqlite3/jdbcpostgresql/jdbc)
    >
    >...
    >
    > -f, [--force]          # Overwrite files that already exist

    加这两个选项的原因是要用 mysql 数据库，另一方面`rails new .`生成的默认的`Gemfile`有一些`gem`不想要，还想加一些自己想用的`gem`所以加了`--skip-bundle`。

    

  #### 安装 gem，修改 rails 参照的默认数据库改成 mysql 项目 build

  - ~~有一个 gem 从 Gemfile 中删掉，经常找不到导致 build 失败。下面这个删掉：~~

    ~~`gem "sprockets-rails"`~~

    

  - 数据库配置

    - 在项目根目录下加一个`.env`的文件，将数据密码等环境变量保存在里面。

      然后再改一次 Gemfile,加一个 gem 可以自动将`.env`中的环境变量加到 rails 执行环境中。

      `gem "dotenv-rails"`

      ```.env
      # host 名要和 docker-compose.yml 配置的服务名一致。
      DATABASE_HOSTNAME=postgres
      DATABASE_USERNAME=root
      DATABASE_PASSWORD=password
      SMTP_ADDRESS=mailhog
      SMTP_PORT=1025
      REDIS_URL=redis://redis:6379/1
      FRONTEND_URL=http://localhost:8000
      ```
  
    - 改数据库的配置文件（config/database.yml）
  
      ```yml
      default: &default
        adapter: postgresql
        encoding: unicode
        # For details on connection pooling, see Rails configuration guide
        # https://guides.rubyonrails.org/configuring.html#database-pooling
        pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
        host: <%= ENV['DATABASE_HOSTNAME'] %>
        username: <%= ENV['DATABASE_USERNAME'] %>
        password: <%= ENV['DATABASE_PASSWORD'] %>
      ```
  
  - build 项目，因为`rails new`的时候跳过了 gem 的安装所以重新 build 一次项目项目才能正常启动。
  
    执行`docker-compose build`
  
    
  
  - 启动项目（这个时候还会报数据库没有的错误，还需执行最后一步）
  
    `docker-compose up`
  
    
  
  - 创建数据库
  
    `docker-compose exec web bin/rails db:create`
  
    
  
    
  
    
  
    
  
    
  
  
