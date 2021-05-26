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
                                // sh 'newman run Postman/PetClinic_visit_collection.json --environment Postman/PetClinic_visit_environment.json --reporters junit'
                            }
                            post { always { junit '**/*xml'   	}     }
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
	post{
        success{
        	emailext (
                subject: "New run on pipeline ${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
                body: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]': Check console output at <a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]",
                to: 'jenkins.iths.mailer@gmail.com, rajpalmanish@gmail.com, jayashree.bondre@iths.se, shubhangi.patil@iths.se, feng.zhu@iths.se, victor.hedstrom@iths.se, maria.shishkina@iths.se, elias.arezomande@iths.se',
                attachmentsPattern: 'RobotFrameWork/Results/report.html, RobotFrameWork/Results/log.html'
                        )
        }
        failure{
        	emailext (
                subject: "New run on pipeline ${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
                body: ""<p>STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
            			<p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>"",
                to: 'jenkins.iths.mailer@gmail.com, rajpalmanish@gmail.com, jayashree.bondre@iths.se, shubhangi.patil@iths.se, feng.zhu@iths.se, victor.hedstrom@iths.se, maria.shishkina@iths.se, elias.arezomande@iths.se',
                attachmentsPattern: 'RobotFrameWork/Results/report.html, RobotFrameWork/Results/log.html'
                        )

        }
	}
}


