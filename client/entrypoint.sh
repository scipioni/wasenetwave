#!/bin/bash


#/etc/systemd/system/hanwha-root-tool.service


mkdir -p /root/.config/nx_ini/ && cd /root/.config/nx_ini/ && \
    touch nx_build_info.ini db_helper.ini vms_server_raid_event.ini nx_network.ini nx_vms_rules.ini nx_utils.ini vms_server_plugins.ini nx_vms_server.ini ptz.ini db_helper.ini nx_network.ini resource_management.ini nx_vms_server_db.ini vms_server_hanwha.ini vivotek_analytics_plugin.ini && \
    chmod -R 777 /root/.config

/opt/hanwha/mediaserver/bin/root-tool &




# /etc/systemd/system/hanwha-mediaserver.service
/opt/hanwha/mediaserver/lib/scripts/systemd_mediaserver_pre_start.sh
/opt/hanwha/mediaserver/lib/scripts/systemd_mediaserver_start.sh &



wait