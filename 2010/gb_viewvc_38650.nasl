###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_viewvc_38650.nasl 14233 2019-03-16 13:32:43Z mmartin $
#
# ViewVC 'lib/viewvc.py' Cross Site Scripting Vulnerability
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.100533");
  script_version("$Revision: 14233 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-16 14:32:43 +0100 (Sat, 16 Mar 2019) $");
  script_tag(name:"creation_date", value:"2010-03-15 19:33:39 +0100 (Mon, 15 Mar 2010)");
  script_cve_id("CVE-2010-0736");
  script_bugtraq_id(38650);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");

  script_name("ViewVC 'lib/viewvc.py' Cross Site Scripting Vulnerability");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/38650");
  script_xref(name:"URL", value:"http://viewvc.tigris.org/source/browse/viewvc/trunk/CHANGES?rev=HEAD");
  script_xref(name:"URL", value:"http://viewvc.tigris.org/");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("viewvc_detect.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"solution", value:"Vendor updates are available. Please see the references for details.");
  script_tag(name:"summary", value:"ViewVC is prone to a cross-site scripting vulnerability because the
application fails to sufficiently sanitize user-supplied data.

An attacker may leverage this issue to execute arbitrary script code
in the browser of an unsuspecting user in the context of the affected
site and steal cookie-based authentication credentials. Other attacks
are also possible.

Versions prior to ViewVC 1.1.4 and 1.0.10 are vulnerable.");
  exit(0);
}

include("http_func.inc");

include("version_func.inc");

port = get_http_port(default:80);
if(!get_port_state(port))exit(0);

if(!version = get_kb_item(string("www/", port, "/viewvc")))exit(0);
if(!matches = eregmatch(string:version, pattern:"^(.+) under (/.*)$"))exit(0);

vers = matches[1];

if(!isnull(vers) && vers >!< "unknown") {

  if(version_in_range(version: vers, test_version: "1.1", test_version2: "1.1.3 ") ||
     version_in_range(version: vers, test_version: "1.0", test_version2: "1.0.9 ")) {
       security_message(port:port);
        exit(0);
  }

}

exit(0);
