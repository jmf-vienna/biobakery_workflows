# JMF-flavoured bioBakery workflows

Customized [bioBakery workflows](https://github.com/biobakery/biobakery_workflows) docker image that plays nice with `singularity`.

[GitHub](https://github.com/jmf-vienna/biobakery_workflows) | [Docker Hub](https://hub.docker.com/r/jmfvienna/biobakery_workflows)

## Set up

Install required databases:

```sh
# bind /opt to host filesystem for persistent storage of databases
export SINGULARITY_BIND="/scratch/jmf/resources/biobakery_workflows:/opt"

# humann.cfg needs to be writeable, therefore its symlinked to /opt in this customized image and a default version is restored there
singularity exec \
  docker://jmfvienna/biobakery_workflows \
  cp -v /usr/local/lib/python3.6/dist-packages/humann/humann.cfg.orig /opt/humann.cfg

# download core databases
singularity exec \
  docker://jmfvienna/biobakery_workflows \
  biobakery_workflows_databases --install wmgx

# download extra KneadData databases
singularity exec \
  docker://jmfvienna/biobakery_workflows \
  kneaddata_database --download mouse_C57BL bowtie2 /opt/biobakery_workflows_databases/kneaddata_db_mouse_C57BL
```

## Test by running the demo workflow

```sh
cd /scratch/jmf/temp/biobakery_workflows_testing

git clone https://github.com/biobakery/biobakery_workflows.git

export SINGULARITY_BIND="/scratch/jmf/resources/biobakery_workflows:/opt,/scratch:/scratch"

singularity exec --cleanenv \
  docker://jmfvienna/biobakery_workflows \
  biobakery_workflows wmgx \
  --input /scratch/jmf/temp/biobakery_workflows_testing/biobakery_workflows/examples/wmgx/paired \
  --output /scratch/jmf/temp/biobakery_workflows_testing/wmgx_workflow_output \
  --bypass-strain-profiling \
  --qc-options="--reference-db /opt/biobakery_workflows_databases/kneaddata_db_mouse_C57BL" \
  --local-jobs 2 --threads 8

# --cleanenv is required, otherwise the workflow may fail due to locale mismatches
```
