FROM ubuntu:lunar-20230415

WORKDIR /root

RUN apt-get update &&\
    apt-get install openjdk-8-jre sudo wget -y --no-install-recommends &&\
    apt-get clean &&\
    wget https://github.com/runtimeverification/predict/releases/download/v2.1.3/rv-predict-installer-2.1.3-SNAPSHOT.jar &&\
    apt-get autoremove -y wget &&\
    bash -c "printf '\n1\n1\nn\n1\n\n1\n1\n' | java -jar rv-predict-installer-2.1.3-SNAPSHOT.jar" &&\
    rm rv-predict-installer-2.1.3-SNAPSHOT.jar

ENTRYPOINT [ "java", "-javaagent:/usr/local/RV-Predict/Java/lib/rv-predict.jar" ]