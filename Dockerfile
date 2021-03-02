FROM mariadb:latest AS development

LABEL maintainer = Tshegofatso Legwale

RUN export BRUCE="$BRUCE"
WORKDIR ./

RUN echo $BRUCE > ./BATCAVE
RUN BRUCE=$(cat ./BATCAVE);
RUN chmod +x ./BATCAVE

EXPOSE 3307

CMD ["/var/lib/mysql/start.sh, "run"]

RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/

CMD ["mysqld", "--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci"]
