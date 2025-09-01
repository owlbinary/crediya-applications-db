FROM liquibase/liquibase:4.23.2

COPY . /liquibase/changelog
WORKDIR /liquibase
