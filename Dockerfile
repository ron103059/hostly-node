FROM ghcr.io/sagernet/sing-box:v1.12.9
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT []
CMD ["/bin/sh", "/entrypoint.sh"]
