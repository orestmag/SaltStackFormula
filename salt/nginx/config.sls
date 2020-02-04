nginx:
  pkg:
    - installed
  service.running:
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/conf.d/hello.conf

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/files/etc/nginx/nginx.conf
    - user: root
    - group: root
    - mode: 640


/etc/nginx/conf.d/hello.conf:
  file.managed:
    - source: salt://nginx/files/etc/nginx/conf.d/hello.conf
    - user: root
    - group: root
    - mode: 640
    - makedirs: True


{#
/etc/nginx/sites-enabled/default:
  file.symlink:
    - target: /etc/nginx/sites-available/default
    - require:
      - file: /etc/nginx/sites-available/default #}

/usr/share/nginx/html/index.html:
  file.managed:
    - source: salt://nginx/files/usr/share/nginx/html/index.html
    - user: root
    - group: root
    - mode: 644