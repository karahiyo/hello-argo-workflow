auth:
	docker run -it \
		--name gcloud-config \
		google/cloud-sdk:alpine \
		gcloud auth application-default login


init plan apply fmt:
	docker run --rm -i -t \
		-w /work \
		-v $(CURDIR)/stacks:/work \
		--volumes-from gcloud-config \
		hashicorp/terraform:1.0.2 $@ $(TF_OPTION)

