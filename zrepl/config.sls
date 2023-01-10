{% from "zrepl/map.jinja" import zrepl with context %}

include:
  - zrepl.install

zrepl_config:
  file.serialize:
    - name: {{ zrepl.config_file }}
    - dataset_pillar: "zrepl:config"
    - serializer: yaml
    - user: {{ zrepl.user }}
    - group: {{ zrepl.group }}
    - mode: 644
    - require:
      - pkg: pkg_zrepl

zrepl_var_run_stdin:
  file.directory:
    - name: {{ zrepl.config.global.serve.stdinserver.sockdir }}
    - user: {{ zrepl.user }}
    - group: {{ zrepl.group }}
    - mode: 700
    - makedirs: True
    - require:
      - file: zrepl_config

zrepl_var_run:
  file.directory:
    - name: /var/run/zrepl
    - user: {{ zrepl.user }}
    - group: {{ zrepl.group }}
    - mode: 700
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: zrepl_var_run_stdin
