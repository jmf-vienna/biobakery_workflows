FROM biobakery/workflows:3.0.0.a.7

# make humann.cfg writeable so biobakery_workflows_databases will work
RUN chmod a+w /usr/local/lib/python3.6/dist-packages/humann/humann.cfg
