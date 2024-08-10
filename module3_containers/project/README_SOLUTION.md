




# Troublehsooting

* error: You must be logged in to the server (Unauthorized)

	    run 'aws configure' and enter both aws access key id and secret access key
	    run 'aws configure set aws_session_token <session token>'
	    run 'aws eks --region <region> update-kubeconfig --name <cluster name>'
	

* Test All well with the cluster. Important Cluster Comamnds. 
	  * kubectl cluster-info	
	  * kubectl get pods
	  * kubectl describe pod <POD_NAME>
	  * kubectl exec -it <POD_NAME> bash
	  * kubectl get services
	  * kubectl exec -it <pod name> bash
	  *	kubectl config current-context
	  * kubectl config view
      * kubectl delete pod <pod name>

* Build and run Manually:
   	export POSTGRES_PASSWORD=$(kubectl get secret --namespace default db-password-secret -o jsonpath="{.data.db-password}" | base64 -d)
	kubectl port-forward svc/postgresql-service 5433:5432 & 
	export DB_USERNAME=root
	export DB_PASSWORD=${POSTGRES_PASSWORD}
	export DB_HOST=127.0.0.1
	export DB_PORT=5433
	export DB_NAME=first-db
	PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U root -d first-db -p 5433 < 1_create_tables.sql
	PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U root -d first-db -p 5433 < 2_seed_users.sql
	PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U root -d first-db -p 5433 < 3_seed_tokens.sql
	kubectl get pods
	kubectl exec -it postgresql-7c6f685595-j4ht5 -- bash
	psql -U root -d first-db



* Build and Run individual Docker Images
	* docker build -t test-coworking-analytics-6 .


	* docker run --network="host" -e DB_USERNAME='root' -e DB_PASSWORD='root' -e DB_HOST='172.31.95.250' -e DB_PORT='5432' -e DB_NAME='first-db' test-coworking-analytics-6  	

	 docker run -e DB_USERNAME='root' -e DB_PASSWORD='root' -e DB_HOST='127.0.0.1' -e DB_PORT='5433' -e DB_NAME='first-db' test-coworking-analytics-6  

    
    * docker run --network="host" test-coworking-analytics-1  


* Port Forward Command:
    * kubectl port-forward --namespace default svc/postgresql-service 5433:5432 &


* Setting up Encrypted Passwords and Config variables:
     kubectl get secret <NAME OF THE Secret> -o jsonpath="{.data.<THE KEY FROM Secret WHICH has THE ENCODED PASSWORD>}" | base64 -d
     kubectl get secret db-password-secret -o jsonpath="{.data.db-password}" | base64 -d
	 kubectl apply -f configmap.yaml
	 kubectl apply -f coworking.yaml

	 curl a47ccd13d14c941809b6cc0199426242-628259610.us-east-1.elb.amazonaws.com:5153/api/reports/daily_usage


