pipeline{
    agent any
        stages{
           stage('Build and Run the Server--API Rest'){
                         steps{
                                sh 'cd spring-petclinic-rest && nohup mvn spring-boot:run &'
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
	
    }
	post {
            always {
                echo 'Hello again! I  am here just to check if you get an email... disregard any contents'
                emailext (
                subject: "new code test",
                body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}",
                to: 'rajpalmanish@gmail.com, jayashree.bondre@iths.se, shubhangi.patil@iths.se, feng.zhu@iths.se, victor.hedstrom@iths.se, maria.shishkina@iths.se, elias.arezomande@iths.se',
                attachmentsPattern: 'RobotFrameWork/Results/report.html, RobotFrameWork/Results/log.html'
                        )
                    }
               }
}


