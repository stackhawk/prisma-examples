FROM centos:8

ENV SERVER_PORT=4000

RUN dnf clean all && \
	dnf update -y && dnf upgrade -y && \
	dnf install -y --setopt=install_weak_deps=false \
		npm \
		bash \
		sqlite

EXPOSE ${SERVER_PORT}:${SERVER_PORT}

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

COPY ./graphql-apollo-server /prisma

WORKDIR /prisma

RUN npm install

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
