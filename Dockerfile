#define imagem base
FROM openjdk:17-jdk-slim-buster

# copia todos os arquivos da aplicação para a imagem
COPY . .

# Comando para tornar o mvnw em executável
RUN chmod 700 mvnw

# mesma função do install, gerar o .jar
RUN ./mvnw clean package 

# ******* Segunda parte da imagem
FROM openjdk:17-jdk-slim-buster

#define caminho de execução da aplicação
WORKDIR /app

#copia os arquivos da pasta X para a pasta Y
COPY --from=build target/*.jar app.jar


#comando de execução da aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
