###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap6_nfs_showmount.nasl 11966 2018-10-18 13:56:21Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Patrik Karlsson
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803525");
  script_version("$Revision: 11966 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-18 15:56:21 +0200 (Thu, 18 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-02-28 19:00:14 +0530 (Thu, 28 Feb 2013)");
  script_name("Nmap NSE 6.01: nfs-showmount");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("nmap_nse.nasl");
  script_mandatory_keys("Tools/Present/nmap6.01", "Tools/Launch/nmap_nse");

  script_add_preference(name:"nfs.version", value:"", type:"entry");
  script_add_preference(name:"mount.version", value:"", type:"entry");
  script_add_preference(name:"rpc.protocol", value:"", type:"entry");

  script_tag(name:"summary", value:"Shows NFS exports, like the 'showmount -e' command.


SYNTAX:

nfs.version:  number If set overrides the detected version of nfs


mount.version:  number If set overrides the detected version of mountd


rpc.protocol:  table If set overrides the preferred order in which
protocols are tested. (ie. 'tcp', 'udp')");

  exit(0);
}

i = 0;

pref = script_get_preference("nfs.version");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'nfs.version', '=', pref, '"');
}
pref = script_get_preference("mount.version");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'mount.version', '=', pref, '"');
}
pref = script_get_preference("rpc.protocol");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'rpc.protocol', '=', pref, '"');
}

argv = make_list("nmap", "--script=nfs-showmount.nse", get_host_ip());

if(i > 0) {
  scriptArgs = "--script-args=";
  foreach arg(args) {
    scriptArgs += arg + ",";
  }
  argv = make_list(argv, scriptArgs);
}

if(TARGET_IS_IPV6())
  argv = make_list(argv, "-6");

timing_policy = get_kb_item("Tools/nmap/timing_policy");
if(timing_policy =~ '^-T[0-5]$')
  argv = make_list(argv, timing_policy);

source_iface = get_preference("source_iface");
if(source_iface =~ '^[0-9a-zA-Z:_]+$') {
  argv = make_list(argv, "-e");
  argv = make_list(argv, source_iface);
}

res = pread(cmd:"nmap", argv:argv);

if(res)
{
  foreach line (split(res))
  {
    if(ereg(pattern:"^\|",string:line)) {
      result +=  substr(chomp(line),2) + '\n';
    }

    error = eregmatch(string:line, pattern:"^nmap: (.*)$");
    if (error) {
      msg = string('Nmap command failed with following error message:\n', line);
      log_message(data : msg);
    }
  }

  if("nfs-showmount" >< result) {
    msg = string('Result found by Nmap Security Scanner (nfs-showmount.nse) ',
                'http://nmap.org:\n\n', result);
    log_message(data : msg);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n', 'nmap ', argv);
  log_message(data: msg);
}
