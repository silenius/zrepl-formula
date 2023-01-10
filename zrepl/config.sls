{% from "zrepl/map.jinja" import zrepl with context %}

include:
  - zrepl.install

zrepl_config:
  file.serialize:
    - name: {{ zrepl.config_file }}
    - dataset_pillar: "zrepl:config"
    - serializer: yaml
    - user: root
    - group: wheel
    - mode: 644
    - require:
      - pkg: pkg_zrepl

zrepl_var_run:
  file.directory:
    - name: /var/run/zrepl
    - user: {{ zrepl.user }}
    - group: {{ zrepl.group }}

