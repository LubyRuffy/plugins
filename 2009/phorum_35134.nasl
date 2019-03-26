###############################################################################
# OpenVAS Vulnerability Test
# $Id: phorum_35134.nasl 14335 2019-03-19 14:46:57Z asteins $
#
# Phorum 'image/bmp' MIME Type HTML Injection Vulnerability
#
# Authors
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100214");
  script_version("$Revision: 14335 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-19 15:46:57 +0100 (Tue, 19 Mar 2019) $");
  script_tag(name:"creation_date", value:"2009-06-01 13:46:24 +0200 (Mon, 01 Jun 2009)");
  script_bugtraq_id(35134);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");

  script_name("Phorum 'image/bmp' MIME Type HTML Injection Vulnerability");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("phorum_detect.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_tag(name:"solution", value:"The vendor has released updates. Please see the references for more information.");
  script_tag(name:"summary", value:"According to its version number, the remote version of Phorum is
  prone to an HTML-injection vulnerability because the application
  fails to properly sanitize user-supplied input.");

  script_tag(name:"impact", value:"Attacker-supplied HTML and script code would execute in the context
  of the affected site, potentially allowing the attacker to steal
  cookie-based authentication credentials or to control how the site
  is rendered to the user, other attacks are also possible.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/35134");
  exit(0);
}

include("http_func.inc");
include("version_func.inc");

port = get_http_port(default:80);

if(!get_port_state(port))exit(0);
if(!can_host_php(port:port))exit(0);

if(!version = get_kb_item(string("www/", port, "/phorum")))exit(0);
if(!matches = eregmatch(string:version, pattern:"^(.+) under (/.*)$"))exit(0);

vers = matches[1];

if(!isnull(vers) && vers >!< "unknown") {

  if(version_is_less(version: vers, test_version: "5.2.11 "))
  {
      security_message(port:port, data:"The target host was found to be vulnerable.");
      exit(0);
  }
}

exit(99);
