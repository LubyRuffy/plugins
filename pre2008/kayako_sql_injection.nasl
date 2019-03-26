###############################################################################
# OpenVAS Vulnerability Test
# $Id: kayako_sql_injection.nasl 13679 2019-02-15 08:20:11Z cfischer $
#
# Kayako eSupport SQL Injection and Cross-Site-Scripting
#
# Authors:
# Noam Rathaus
#
# Copyright:
# Copyright (C) 2004 Noam Rathaus
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
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.16022");
  script_version("$Revision: 13679 $");
  script_tag(name:"last_modification", value:"$Date: 2019-02-15 09:20:11 +0100 (Fri, 15 Feb 2019) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_cve_id("CVE-2004-1412", "CVE-2004-1413");
  script_bugtraq_id(12037);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_name("Kayako eSupport SQL Injection and Cross-Site-Scripting");
  script_category(ACT_ATTACK);
  script_copyright("This script is Copyright (C) 2004 Noam Rathaus");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl", "cross_site_scripting.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"solution", value:"Upgrade to the newest version of this software");

  script_tag(name:"summary", value:"The remote host is running a version of Kayako eSupport which is vulnerable
  to a SQL injection vulnerability as well as a cross site scripting.");

  script_tag(name:"qod", value:"50"); # Vuln check below is quite unreliable
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );
host = http_host_name( dont_add_port:TRUE );
if( http_get_has_generic_xss( port:port, host:host ) ) exit( 0 );
if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/", "/support/esupport", "/support", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";

  url = dir + "/index.php?_a=knowledgebase&_j=search&searchm=<script>alert(document.cookie)</script>";
  req = http_get( item:url, port:port );
  res = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );
  if( isnull( res ) ) continue;

  if( res =~ "^HTTP/1\.[01] 200" && "<script>alert(document.cookie)</script>" >< res ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );
