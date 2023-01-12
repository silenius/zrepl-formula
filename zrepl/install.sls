{% from "zrepl/map.jinja" import zrepl with context %}

pkg_zrepl:
  pkg.installed:
    - name: {{ zrepl.pkg }}

# Check pkg -D zrepl
zrepl_restart_services:
  cmd.run:
    - name: service newsyslog restart && service syslogd restart
    - onchanges:
      - pkg: pkg_zrepl
