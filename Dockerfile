FROM docker:19.03.4

RUN apk update \
  && apk upgrade \
  && apk add --no-cache --update python py-pip coreutils bash \
  && rm -rf /var/cache/apk/* \
  && pip install "Cython<3.0" "pyyaml<6" --no-build-isolation awscli \
  && apk --purge -v del py-pip

ADD entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
