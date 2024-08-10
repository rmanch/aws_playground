




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


* Build and Run individual Docker Images
	* docker build -t coworking-analytics -f Dockerfile .
	* docker run --network="host" -e DB_USERNAME='root' -e DB_PASSWORD='root' -e DB_HOST='172.31.34.46' -e DB_PORT='5433' -e DB_NAME='first-db' coworking-analytics      	

	
