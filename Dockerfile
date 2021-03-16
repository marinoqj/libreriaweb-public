FROM busybox:latest
ADD target/libreriaweb-public*.war libreriaweb-public.war
CMD "tail" "-f" "/dev/null"