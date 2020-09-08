FROM mariadb:latest
EXPOSE 3307
ENV BRUCE=WAYNE
RUN echo "$(BRUCE) > /root/BATCAVE"

CMD ["/var/lib/mysql/start.sh, "run"]
