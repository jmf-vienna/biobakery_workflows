FROM biobakery/workflows:3.0.0.a.7

# makes humann.cfg writable so biobakery_workflows_databases will work
RUN mv -v /usr/local/lib/python3.6/dist-packages/humann/humann.cfg /usr/local/lib/python3.6/dist-packages/humann/humann.cfg.orig
RUN ln -sv /opt/humann.cfg /usr/local/lib/python3.6/dist-packages/humann/humann.cfg
