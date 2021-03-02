FROM mariadb:latest AS development

LABEL maintainer = Tshegofatso Legwale

RUN echo "$BRUCE" > ./BATCAVE
EXPOSE 3307

CMD ["/var/lib/mysql/start.sh, "run"]

RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/
