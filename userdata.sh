#cloud-config

write_files:
  - content: |
{% for rs_item in rs_agent %}
      {{ rs_item[0] }}='{{ rs_item[1] }}'
{% endfor %}
    path: /var/lib/rightscale-identity
    permissions: '0600'

coreos:
  units:
    - name: "rightlinkinstall.service"
      command: "start"
      content: |
        [Unit]
        Description=Installs RightLink
        ConditionPathExists=!/opt/bin/rightlink
        ConditionPathExists=!/usr/local/bin/rightlink

        [Service]
        Type=oneshot
        RemainAfterExit=yes
        ExecStart=/usr/bin/bash -c "/usr/bin/curl -s https://rightlink.rightscale.com/rll/master/rightlink.boot.sh | /usr/bin/bash"
