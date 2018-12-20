FROM tomcat:8.0

ADD /var/lib/jenkins/workspace/docker-build/webapp/target/*.war /usr/loacl/tomcat/webapps

EXPOSE 8080

CMD ["catlina.sh", "run"]
