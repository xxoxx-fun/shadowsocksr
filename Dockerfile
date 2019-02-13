FROM alpine:3.6
ENV SERVER_ADDR     0.0.0.0
ENV SERVER_PORT     51348
# 记得用sed替换
ENV PASSWORD        psw
# 记得用sed替换
ENV METHOD          aes-128-ctr
ENV PROTOCOL        auth_aes128_md5
# 记得用sed替换
ENV OBFS            tls1.2_ticket_auth_compatible
# 记得用sed替换
ENV TIMEOUT         300
ENV DNS_ADDR        8.8.8.8
ENV DNS_ADDR_2      8.8.4.4
ARG BRANCH=manyuser
ARG WORK=~
RUN apk --no-cache add python libsodium wget && wget -qO- --no-check-certificate https://github.com/xxoxx-fun/shadowsocksr/archive/$BRANCH.tar.gz | tar -xzf - -C $WORK
WORKDIR $WORK/shadowsocksr-$BRANCH/shadowsocks
EXPOSE $SERVER_PORT
CMD python server.py -p $SERVER_PORT -k $PASSWORD -m $METHOD -O $PROTOCOL -o $OBFS
