### DOCKER
# ¯¯¯¯¯¯¯¯¯¯¯

docker.build: ##
	docker build -t "kfirfer/gcloud-mysql" .

docker.push: ## vars: version
	docker tag kfirfer/gcloud-mysql kfirfer/gcloud-mysql:${version}
	docker push kfirfer/gcloud-mysql:${version}