FROM biobakery/workflows:3.0.0.a.7

# make humann.cfg writable so biobakery_workflows_databases will work
RUN ln -sf /opt/humann.cfg /usr/local/lib/python3.6/dist-packages/humann/humann.cfg
