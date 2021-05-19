ARG $MYSQL_ROOT_PASSWORD

FROM mariadb:latest AS development

LABEL maintainer = Tshegofatso Legwale

#ARG $MYSQL_ROOT_PASSWORD
#ARG ${MYSQL_DATABASE}

#RUN export MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
RUN export BRUCE="$BRUCE"
WORKDIR ./

RUN echo $BRUCE > ./BATCAVE
RUN BRUCE=$(cat ./BATCAVE);
RUN chmod +x ./BATCAVE

#ENV MYSQL_DATABASE=${MYSQL_DATABASE} \
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

EXPOSE 3307

CMD ["/var/lib/mysql/start.sh, "run"]

RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/

CMD ["mysqld", "--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci"]
