##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_openfire_secbypass_900401.nasl 14240 2019-03-17 15:50:45Z cfischer $
# Description: Openfire 'AuthCheck' Filter Security Bypass Vulnerability
#
# Authors:
# Sujit Ghosal <sghosal@secpod.com>
#
# Copyright:
# Copyright (C) 2008 SecPod, http://www.secpod.com
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
##############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900401");
  script_version("$Revision: 14240 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-17 16:50:45 +0100 (Sun, 17 Mar 2019) $");
  script_tag(name:"creation_date", value:"2008-12-02 11:52:55 +0100 (Tue, 02 Dec 2008)");
  script_cve_id("CVE-2008-6508");
  script_bugtraq_id(32189);
  script_copyright("Copyright (C) 2008 SecPod");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_family("Web application abuses");
  script_name("Openfire 'AuthCheck Filter' Security Bypass Vulnerability");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports(9090);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"http://secunia.com/advisories/32478/");
  script_xref(name:"URL", value:"http://www.igniterealtime.org/downloads/index.jsp");
  script_xref(name:"URL", value:"http://www.andreas-kurtz.de/advisories/AKADV2008-001-v1.0.txt");

  script_tag(name:"impact", value:"Successful exploitation will cause execution of arbitrary code.");

  script_tag(name:"affected", value:"Ignite Realtime Openfire version prior to 3.6.1.");

  script_tag(name:"insight", value:"This vulnerability is due to error in the 'AuthCheck' filter while
  imposing access restrictions via a specially crafted URL using 'setup/setup-' and followed by the
  directory traversal sequences. These can be exploited to cause underlying database, access or modify data.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"solution", value:"Upgrade to 3.6.1 or later.");

  script_tag(name:"summary", value:"The host is running Openfire and is prone to security bypass vulnerability.");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = 9090;
response = http_get_cache(item:"/login.jsp", port:port);
if(!response)
  exit(0);

if("Openfire Admin Console" >< response)
{
  pattern = "Version: ([0-2]\..*|3\.[0-5](\..*)?|3\.6(\.0)?)($|[^.0-9])";
  if(egrep(pattern:pattern, string:response)){
    security_message(port);
  }
}