{% from "zrepl/map.jinja" import zrepl with context %}

pkg_zrepl:
  pkg.installed:
    - name: {{ zrepl.pkg }}
