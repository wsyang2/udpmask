FROM alpine as intermediate
LABEL stage=intermediate

RUN apk update && \
    apk add --update build-base

COPY . /udpmask
WORKDIR /udpmask
RUN make


FROM alpine
COPY --from=intermediate /udpmask/udpmask /bin
RUN chmod +x /bin/udpmask
ENTRYPOINT ["/bin/udpmask"]
