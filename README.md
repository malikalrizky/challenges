1. Deploy database server postgresql with kubernetes
  - There are several .yaml file for build postgresql
	1. postrgres-config.yaml define user, password, and db into configmaps
	2. postgres-storage.yaml configuration storage 5Gb for persisten volume and persistent volume claim
	3. deployment.yaml for deploying postgresql using postgres-config and claim persistent volume
	4. service.yaml to expose postgresql, using type NodePort and port 5432

  - Apply all of .yaml to kubernetes with command
        1. kubectl apply -f postgres-config.yaml
        2. kubectl apply -f postgres-storage.yaml
        3. kubectl apply -f deployment.yaml
        4. kubectl apply -f service.yaml

2. Deploy apps to kubernetes
  - In dockerfile apps there are some change:
	1. installing postgresql-client
        2. adding entrypoint script (entrypoint.sh) to make sure server.pid pre-exist not exist
	3. push image docker with tag azhari7/rubyapps:latest
  - In database.yaml change adapter to postgresql and adding host,user,password.
  - Make configmaps to manage env apps including host,user and password database.
  - Make service.yaml file to expose apps
  - Make deployment.yaml file to deploy using name: railsapp using image azhari7/rubyapps:latest
  - Do db:migrate to postgresql

  - Apply all of .yaml to kubernetes with comand
       1. kubectl apply -f app-config.yaml
       2. kubectl apply -f deployment.yaml
       3. kubectl apply -f service.yaml
