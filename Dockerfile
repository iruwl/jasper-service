FROM iruwl/java7:openjdk

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY truetype-fonts /tmp/ttf
COPY jasper-lib /jasper/lib
COPY JavaBridge.jar /jasper/JavaBridge.jar

RUN mkdir -p /jasper/lib
RUN while true; do echo "\n"; done | /tmp/ttf/install-fonts
RUN rm -rf /tmp/ttf

EXPOSE 8080

CMD ["/usr/bin/supervisord"]
