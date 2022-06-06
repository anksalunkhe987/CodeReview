FROM ubuntu:16.04
RUN apt-get update && \
    apt-get -y --no-install-recommends install libxml2-utils && \
    apt-get autoremove -y && \
    apt-get clean
    xmllint ./sumup-purchase-orders-sps-sapi/pom.xml
