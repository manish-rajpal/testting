pipeline{
    agent any
        stages{
            stage('para'){
               parallel     {
               stage('Build and Run the Server--API Rest'){
                         steps{
                                sh 'cd spring-petclinic-rest && nohup mvn spring-boot:run &'
                            }
                }
				stage ('Build') {
                    steps {
                            sh 'cd spring-petclinic-rest && mvn compile'
                        }
                    }

                stage('Unit Test') {
                        steps {
                            sh 'cd spring-petclinic-rest && mvn test'
                            }
                        post {
                            success{ gerritReview score:1}
                            failure{ gerritReview score:-1}
                            }
                }
                 stage('Run the Frontend--Angular'){
                              steps{
                                    sleep(10)
                                    sh 'cd spring-petclinic-angular/static-content && curl https://jcenter.bintray.com/com/athaydes/rawhttp/rawhttp-cli/1.0/rawhttp-cli-1.0-all.jar -o rawhttp.jar && nohup java -jar ./rawhttp.jar serve . -p 4200 &'
                              }
                }
                stage('Postman') {
                            steps {
                                sleep(30)
                                sh 'newman run Postman/PetClinic_05_collection.json --environment Postman/PetClinic_05_environment.json --reporters junit'
                                sh 'newman run Postman/PetClinic_visit_collection.json --environment Postman/PetClinic_visit_environment.json --reporters junit'
                            }
                            post {
                                	always {
                                		junit '**/*xml'
                                	}
                            }

                }

                stage('Robot Framework') {
                              steps {
                                    sleep(10)
                                    sh 'robot --variable BROWSER:headlesschrome -d RobotFrameWork/Results RobotFrameWork/Tests/**.robot'

                              }

                              post {
                                    always {
                                           script {
                                                  step(
                                                       [
                                                             $class               : 'RobotPublisher',
                                                              outputPath          : 'RobotFrameWork/Results',
                                                              outputFileName      : '**/output.xml',
                                                              reportFileName      : '**/report.html',
                                                              logFileName         : '**/log.html',
                                                              disableArchiveOutput: false,
                                                              passThreshold       : 50,
                                                              unstableThreshold   : 40,
                                                              otherFiles          : "**/*.png,**/*.jpg",
                                                       ]
                                                  )
                                           }
                                    }
                              }
                              }


                }
        }
    }
}


