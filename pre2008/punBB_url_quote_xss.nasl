# OpenVAS Vulnerability Test
# $Id: punBB_url_quote_xss.nasl 14336 2019-03-19 14:53:10Z mmartin $
# Description: PunBB URL Quote Tag XSS
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
#
# Copyright:
# Copyright (C) 2004 David Maciejak
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

#  Ref: s0da

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.15941");
  script_version("$Revision: 14336 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-19 15:53:10 +0100 (Tue, 19 Mar 2019) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_xref(name:"OSVDB", value:"7973");

  script_name(" PunBB URL Quote Tag XSS");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");


  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");

  script_copyright("This script is Copyright (C) 2004 David Maciejak");
  script_family("Web application abuses");
  script_dependencies("punBB_detect.nasl");
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_require_ports("Services/www", 80);
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"solution", value:"Upgrade to PunBB version 1.1.5 or later.");
  script_tag(name:"summary", value:"The remote web server contains a PHP application that is prone to
cross-site scripting attacks.

Description :

According to its banner, the remote version of PunBB is vulnerable to
cross-site scripting flaws because the application does not validate
URL and quote tags.  With a specially-crafted URL, an attacker may be
able to inject arbitrary HTML and script code into a user's browser,
resulting in a loss of integrity.");
  script_xref(name:"URL", value:"http://www.punbb.org/changelogs/1.1.4_to_1.1.5.txt");
  exit(0);
}

include("http_func.inc");


port = get_http_port(default:80);
if (!get_port_state(port)) exit(0);
if (!can_host_php(port:port)) exit(0);


# Test an install.
install = get_kb_item(string("www/", port, "/punBB"));
if (isnull(install)) exit(0);
matches = eregmatch(string:install, pattern:"^(.+) under (/.*)$");
if (!isnull(matches)) {
  ver = matches[1];

  if (egrep(pattern: "^(0\.|1\.0|1\.1[^.]|1\.1\.[0-4]([^0-9]|$))",string:ver))
  {
    security_message(port);
    exit(0);
  }
}
