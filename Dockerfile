FROM ubuntu:14.04

MAINTAINER mintplo <mintplo@jellycoaster.com>

# Set Envrionmental Variable
ENV UPSOURCE_LATEST_VER 2.0.3554


# Install basic package
RUN apt-get update && apt-get install -y \
	unzip \
	python-software-properties \
	software-properties-common \
	debconf-utils


# Install JRE 1.8 with silent mode
# install error issue with JRE 1.8 installer license agreement
# 
# http://askubuntu.com/questions/190582/installing-java-automatically-with-silent-option
RUN add-apt-repository -y ppa:webupd8team/java && apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
RUN apt-get install -y \
	oracle-java8-installer \
	oracle-java8-set-default


# Install Upsource
ADD http://download.jetbrains.com/upsource/upsource-$UPSOURCE_LATEST_VER.zip /opt/Upsource.zip
RUN mkdir -p /opt/Upsource
RUN chmod a+x /opt/Upsource.zip && unzip /opt/Upsource.zip -d /opt/ && chmod -R a+rwX /opt/Upsource
RUN rm -rf /opt/Upsource.zip


ENTRYPOINT ["/opt/Upsource/bin/upsource.sh", "run"]

EXPOSE 8080
