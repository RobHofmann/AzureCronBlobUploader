FROM microsoft/dotnet:2.1-runtime
LABEL Author="Rob Hofmann <rob.hofmann@me.com>"

RUN apt-get -q update && \
    apt-get -qy dist-upgrade && \
    apt-get install -y --no-install-recommends \
         rsync \
         libunwind8 \
         git-core cron wget jq && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

RUN set -ex \
    && curl -L -o azcopy.tar.gz \
    https://aka.ms/downloadazcopylinux64 \
    && tar -xf azcopy.tar.gz && rm -f azcopy.tar.gz \
    && ./install.sh && rm -f install.sh \
    && rm -rf azcopy

COPY ./entrypoint.sh /entrypoint.sh
COPY ./runUploader.sh /scripts/runUploader.sh
RUN chmod u+x /entrypoint.sh
RUN chmod u+x /scripts/runUploader.sh

ENTRYPOINT ["/entrypoint.sh"]
