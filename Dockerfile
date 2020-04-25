# the first stage of our build will use a maven 3.6.1 parent image

FROM maven:3.6.1-jdk-8-alpine AS MAVEN_BUILD

# copy the pom and src code to the container
COPY ./ ./

# package our application code
#RUN mvn clean package

# the second stage of our build will use open jdk 8 on alpine 3.9
FROM openjdk:8-jre-alpine3.9

# copy only the artifacts we need from the first stage and discard the rest
COPY --from=MAVEN_BUILD /target/aws-kbs-test.jar /test.jar

# set the startup command to execute the jar
CMD ["java", "-jar", "/test.jar"]

# docker build -t abdeldayem/aws-kbs-test:0.0.1.Release .
# docker push abdeldayem/aws-kbs-test:0.0.1.Release

# docker login
# http://docs.heptio.com/content/private-registries/pr-docker-hub.html
# kubectl create secret docker-registry abdeldayem   --docker-username=abdeldayem   --docker-password=$password   --docker-email=eng.amr.abdeldayem@gmail.com
# kubectl patch serviceaccount default   -p "{\"imagePullSecrets\": [{\"name\": \"abdeldayem\"}]}"

# kubectl get events --sort-by=.metadata.creationTimestamp
# kubectl delete all -l app=aws-kbs-test

# kubectl get pods
# kubectl get services
# kubectl delete pod 12222


# kubectl apply -f deployment.yaml
# kubectl get svc --watch
# kubectl cluster-info dump
