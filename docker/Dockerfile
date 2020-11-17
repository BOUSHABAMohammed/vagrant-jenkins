FROM nginx:latest
ADD script.sh /etc/nginx/script.sh
RUN chmod +x /etc/nginx/script.sh
# ENTRYPOINT ["/etc/nginx/script.sh"]
# CMD ["nginx"]
RUN /etc/nginx/script.sh