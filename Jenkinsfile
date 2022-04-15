pipeline {
  agent { label 'master' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    CI = true
    /*ARTIFACTORY_ACCESS_TOKEN = credentials('artifactory-access-token')*/
    tomcatWeb = 'C:\\Program Files\\Apache Software Foundation\\apache-tomcat-9.0.43\\webapps'
    tomcatBin = 'C:\\Program Files\\Apache Software Foundation\\apache-tomcat-9.0.43\\bin'
    tomcatStatus = ''
    mvnHome =  tool name: 'Maven3.6.3', type: 'maven' 
  }
  
  
  
   
  
  
  
  
  stages {
    
    stage('Compile-Package-create-war-file'){
      steps {
        // Get maven home path
          
        /*bat "${mvnHome}/bin/mvn package"*/
       bat "mvn clean install"
       echo 'Compile completed'
      }
      }
    
    
    
    
    
    
    stage('Artifactory upload to jfrog') {
      steps {
        rtServer(
          id: "jfroginstanceid",
          url: 'http://10.127.128.187:8082/artifactory',
          username: 'access-admin',
          password: 'password',
          bypassProxy: true,
          timeout:300
        )
        rtUpload(
        serverId:"jfroginstanceid",
        spec:'''{
        "files": [
          {
          "pattern": "Example-0.0.1-20220404.065308-3.war",
          "target": "ankush-test-repo/com/github/Premvikash/Example/0.0.1-SNAPSHOT/"
          }
        ]
        }''',
      )
      rtPublishBuildInfo(
        serverId: "jfroginstanceid"
      )

     }
     }
    
    
    
    
    
    
   
     stage('Deploy to Tomcat'){
       steps {
        bat "copy target\\Example-0.0.1-SNAPSHOT.war	 \"${tomcatWeb}\\Example-0.0.1-SNAPSHOT.war	\""
       }
   }
      stage ('Start Tomcat Server') {
        steps {
          sleep(time:5,unit:"SECONDS") 
          bat "${tomcatBin}\\startup.bat"
          sleep(time:100,unit:"SECONDS")
        }
   }
      
  }
}
