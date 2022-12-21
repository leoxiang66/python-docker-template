# syntax=docker/dockerfile:1
# 第一行是解析器指令，始终用版本1语法的最新版本

#基础镜像
FROM python:3.7-slim-buster

# 设置工作目录文件夹
WORKDIR /project

# 复制依赖文件
COPY requirements.txt requirements.txt

# 安装依赖
RUN pip install -r requirements.txt

#将文件添加到文件夹中，一个一个复制其实也可以的
#ADD ./main.py /project/
#ADD ./pack/__init__.py  /project/pack/
#ADD ./pack/feat1.py /project/pack/
#ADD ./pack/feat2.py /project/pack/
COPY . /project



#当启动容器时候，执行main.py程序
CMD ["python", "main.py"]