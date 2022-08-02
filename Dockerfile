FROM biobakery/workflows:3.0.0.a.7

# makes humann.cfg writable so biobakery_workflows_databases will work
RUN mv -v /usr/local/lib/python3.6/dist-packages/humann/humann.cfg /usr/local/lib/python3.6/dist-packages/humann/humann.cfg.orig
RUN ln -sv /opt/humann.cfg /usr/local/lib/python3.6/dist-packages/humann/humann.cfg

# disable downloading of new MetaPhlAn database
# see https://github.com/biobakery/MetaPhlAn/blob/a857bccdac6bd2b26997e25bb9692d79736c1ed8/metaphlan/__init__.py#L237
RUN touch touch -t 205001010000 /usr/local/lib/python3.6/dist-packages/metaphlan/metaphlan_databases/mpa_latest
