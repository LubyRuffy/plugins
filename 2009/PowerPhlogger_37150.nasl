###############################################################################
# OpenVAS Vulnerability Test
# $Id: PowerPhlogger_37150.nasl 14335 2019-03-19 14:46:57Z asteins $
#
# Power Phlogger Cross-site Scripting Vulnerability
#
# Authors:
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
  script_oid("1.3.6.1.4.1.25623.1.0.100368");
  script_version("$Revision: 14335 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-19 15:46:57 +0100 (Tue, 19 Mar 2019) $");
  script_tag(name:"creation_date", value:"2009-12-01 12:01:39 +0100 (Tue, 01 Dec 2009)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_cve_id("CVE-2009-4253");
  script_bugtraq_id(37150);

  script_name("Power Phlogger Cross-site Scripting Vulnerability");


  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("PowerPhlogger_detect.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_tag(name:"summary", value:"Power Phlogger is prone to a cross-site scripting vulnerability
because the application fails to properly sanitize user-
supplied input.

Attackers can exploit this issue to steal cookie-based authentication
credentials or to control how the site is rendered to the user.

Power Phlogger 2.2.5 is vulnerable, other versions may also be
affected.");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/37150");
  script_xref(name:"URL", value:"http://www.websecurity.com.ua/1845");
  script_xref(name:"URL", value:"http://www.phpee.com/");
  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"solution", value:"No known solution was made available for at least one year
  since the disclosure of this vulnerability. Likely none will be provided anymore.
  General solution options are to upgrade to a newer release, disable respective features,
  remove the product or replace the product by another one.");

  exit(0);
}

include("http_func.inc");

include("version_func.inc");

port = get_http_port(default:80);
if(!get_port_state(port))exit(0);

if (!can_host_php(port:port)) exit(0);

if(!version = get_kb_item(string("www/", port, "/PowerPhlogger")))exit(0);
if(!matches = eregmatch(string:version, pattern:"^(.+) under (/.*)$"))exit(0);

vers = matches[1];

if(!isnull(vers) && vers >!< "unknown") {

  if(version_is_equal(version: vers, test_version: "2.2.5")   ||
     version_is_equal(version: vers, test_version: "2.2.2.a") ||
     version_is_equal(version: vers, test_version: "2.2.1")   ||
     version_is_equal(version: vers, test_version: "2.0.9")) {
        security_message(port:port);
        exit(0);
  }

}

exit(0);
