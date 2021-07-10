

__install-argo--workflow:
	kubectl create ns argo
	kubectl apply -n argo -f https://raw.githubusercontent.com/argoproj/argo/stable/manifests/quick-start-postgres.yaml

__install_argo_cmd:
	brew install argoproj/tap/argo

submit:
	argo submit -n argo workflows/hello-world.yaml

list_jobs:
	argo list -n argo

desc_latest_job:
	argo get -n argo @latest

get_latest_job_logs:
	argo logs -n argo @latest

