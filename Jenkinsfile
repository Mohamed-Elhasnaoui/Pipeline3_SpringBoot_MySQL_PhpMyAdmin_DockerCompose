pipeline {

agent any

     tools {
          maven 'maven3916'
     }

     stages{

          stage('Creation du jar ') {

               steps {
                         sh 'mvn clean install -DskipTests'
               }
          }

          stage('build docker image sur serveur') {

               steps {
                         sh 'docker build -t amsibcgos .'
                    }
          }

         

          stage('run docker-compose') {

               steps {
                         sh 'docker compose up -d'
                    }
          }
     }
}
