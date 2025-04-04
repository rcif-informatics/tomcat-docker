FROM tomcat:9.0-jdk8-temurin-noble

# Install gosu (this base image is Ubuntu Noble, so apt is fine)
RUN apt-get update && apt-get install -y gosu && rm -rf /var/lib/apt/lists/*

# Add entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Override entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Default CMD (same as original)
CMD ["catalina.sh", "run"]
