pipeline {

    agent any

    environment {

        IMAGE="yourdockerhub/easyshop"

    }

    stages {

        stage('Checkout') {

            steps {

                git url: 'https://github.com/pratikphanase/EasyShop-KIND.git'

            }

        }

        stage('Build') {

            steps {

                sh 'docker build -t $IMAGE:latest .'

            }

        }

        stage('Push') {

            steps {

                withCredentials([usernamePassword(credentialsId: 'dockerhub',

                        usernameVariable: 'USER',

                        passwordVariable: 'PASS')]) {

                    sh '''
                    echo $PASS | docker login -u $USER --password-stdin
                    docker push $IMAGE:latest
                    '''
                }

            }

        }

    }

}
