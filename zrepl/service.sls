{% from "zrepl/map.jinja" import zrepl with context %}

include:
  - zrepl.config

sysrc_zrepl_user:
  sysrc.managed:
    - name: zrepl_user
    - value: {{ zrepl.user }}
    - watch_in:
      - service: zrepl

sysrc_zrepl_group:
  sysrc.managed:
    - name: zrepl_group
    - value: {{ zrepl.group }}
    - watch_in:
      - service: zrepl

sysrc_zrepl_config:
  sysrc.managed:
    - name: zrepl_config
    - value: {{ zrepl.config_file }}
    - watch_in:
      - service: zrepl

service_zrepl:
  service.running:
    - name: zrepl
    - enable: True
    - reload: True
    - watch:
      - file: zrepl_config
