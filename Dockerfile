
FROM dellelce/py-base as build

RUN apk add binutils gcc g++ gfortran  musl-dev linux-headers openblas-dev \
            freetype-dev && \
    /app/python/bin/pip3 install wheel -U pip setuptools && \
    mkdir /wheel && cd /wheel && /app/python/bin/pip3 wheel numpy ase

FROM scratch

COPY --from=build /wheel /wheel
