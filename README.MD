############## Step to realise the project #################

1/ Clone du static-website-example dans mon repertoire Mini-projet

#git clone https://github.com/diranetafen/static-website-example.git

2/Creation du Dockerfile

touch Dockerfile => voir contenu dans le fichier Dockerfile

3/Creation du projet dans jenkins

![alt text](image.png)

4/Creation de l'item website-projet en mode Pipeline

![alt text](image-6.png)

5/ Creation du parametre port
![alt text](image-2.png)

6/Creation du Jenkinsfile
#touch Jenkinsfile => voir contenu dans le fichier Jenkinsfile

7/Push et commit dans github local 
    - Creation du projet mini-proj-jenk
    ![alt text](image-3.png)

     - Change git origin de mon repertoire Mini-Projet 
 #git remote set-url origin git@github.com:MTDIOP/mini-proj-jenk.git

    - Commit et push 
#git add .
#git commit -m "add Dockerfile and jenkinsfile"
#git push

8/Configuration du github projet URL dans Jenkins
![alt text](image-4.png)

9/Definition du script Pipeline
![alt text](image-7.png)

10/Ajout des secrtes file du dockerhub et de heroku_api_key
![alt text](image-8.png)

11/ Ajout de Embeddable Build Status Icon

#LocalHost

[![Build Status](http://localhost:8080/job/static-website/badge/icon)](http://localhost:8080/job/static-website/)

#Ngrok URL

https://06cc-37-67-97-149.ngrok-free.app/job/static-website/badge/icon)](https://06cc-37-67-97-149.ngrok-free.app/job/static-website/)

12/Add Slack Notif
![alt text](image-9.png)

############## Result after realise the project #################

Jenkins Build Status
![alt text](image-11.png)

Docker Hub Status
![alt text](image-12.png)

Heroku Status
NA

Slack Message

![alt text](image-10.png)