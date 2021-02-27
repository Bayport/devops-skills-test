FROM mariadb:latest AS development
MAINTAINER Tshegofatso Legwale
RUN echo $BRUCE > ~/BATCAVE
EXPOSE 3307

CMD ["/var/lib/mysql/start.sh, "run"]