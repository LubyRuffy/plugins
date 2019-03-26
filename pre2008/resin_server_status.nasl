# OpenVAS Vulnerability Test
# $Id: resin_server_status.nasl 14336 2019-03-19 14:53:10Z mmartin $
# Description: Resin /caucho-status accessible
#
# Authors:
# Vincent Renardias <vincent@strongholdnet.com>
#
# Copyright:
# Copyright (C) 2003 StrongHoldNet
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.11930");
  script_version("$Revision: 14336 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-19 15:53:10 +0100 (Tue, 19 Mar 2019) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");

  script_name("Resin /caucho-status accessible");


  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");


  script_copyright("This script is Copyright (C) 2003 StrongHoldNet");
  script_family("General");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_require_keys("www/apache");
  script_tag(name:"solution_type", value:"Workaround");
  script_tag(name:"solution", value:"If you don't use this feature, set the content of the '<caucho-status>' element
to 'false' in the resin.conf file.");
  script_tag(name:"summary", value:"Requesting the URI /caucho-status gives information about
the currently running Resin java servlet container.");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);

if(!get_port_state(port))exit(0);

req = http_get(item:"/caucho-status", port:port);
r = http_keepalive_send_recv(port:port, data:req);
if ( r == NULL ) exit(0);

if("<title>Status : Caucho Servlet Engine" >< r && "%cpu/thread" >< r) {
  security_message(port:port);
  exit(0);
}

