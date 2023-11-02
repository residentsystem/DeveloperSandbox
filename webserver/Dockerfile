# The main NGINX on RHEL image. May be used as-is to BUILD NGINX web server on RHEL.
FROM registry.access.redhat.com/ubi8/nginx-120
LABEL author="Eric Lacroix"

# APP_ROOT=/opt/app-root
# HOME=/opt/app-root/src

# Add application sources
# NGINX_CONF_PATH=/etc/nginx/nginx.conf
ADD config/nginx.conf "${NGINX_CONF_PATH}"
# NGINX_DEFAULT_CONF_PATH=/opt/app-root/etc/nginx.default.d/alias.conf
ADD config/alias.conf "${NGINX_DEFAULT_CONF_PATH}"
# NGINX_CONFIGURATION_PATH=/opt/app-root/etc/nginx.d/default.conf 
## ADD web-config/default.conf "${NGINX_CONFIGURATION_PATH}"
# HOME=/opt/app-root/src
## ADD web-config/*.html .

# Copy SSL certificate
##WORKDIR /etc/pki
WORKDIR "${HOME}"
RUN mkdir -p cert
RUN mkdir -p cert/private

# Copy SSL certificates
COPY cert/rs-wsdv-m92p-01.residentsystem.home.cert.pem "${HOME}"/cert
COPY cert/rs-wsdv-m92p-01.residentsystem.home.key.pem "${HOME}"/cert/private

# Set owner and fix APP_ROOT permissions
USER 0
RUN chown -R 1001:0 ${NGINX_CONF_PATH} && fix-permissions ${NGINX_CONF_PATH}
RUN chown -R 1001:0 ${NGINX_DEFAULT_CONF_PATH} && fix-permissions ${NGINX_DEFAULT_CONF_PATH}
RUN chown -R 1001:0 ${NGINX_CONFIGURATION_PATH} && fix-permissions ${NGINX_CONFIGURATION_PATH}
RUN chown -R 1001:0 ${HOME} && fix-permissions ${HOME}
USER 1001

# Expose server port
EXPOSE 5081
EXPOSE 5444


# Run the server
CMD nginx -g "daemon off;"