###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_mahara_xss_vuln.nasl 14330 2019-03-19 13:59:11Z asteins $
#
# Mahara Cross-Site Scripting Vulnerability
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.900382");
  script_version("$Revision: 14330 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-19 14:59:11 +0100 (Tue, 19 Mar 2019) $");
  script_tag(name:"creation_date", value:"2009-06-26 07:55:21 +0200 (Fri, 26 Jun 2009)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_cve_id("CVE-2009-2170");
  script_name("Mahara Cross-Site Scripting Vulnerability");
  script_xref(name:"URL", value:"http://mahara.org/interaction/forum/topic.php?id=752");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Web application abuses");
  script_dependencies("secpod_mahara_detect.nasl");
  script_require_ports("Services/www", 80);
  script_tag(name:"impact", value:"Successful exploitation will allow attacker to cause a Cross-Site Scripting
  attack.");
  script_tag(name:"affected", value:"Mahara version 1.0 before 1.0.12 and 1.1 before 1.1.5.");
  script_tag(name:"insight", value:"An unknown attack vector can be exploited by injecting arbitrary web script
    or HTML code into the affected application.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"solution", value:"Upgrade to Mahara version 1.1.5 or 1.0.12 or later.");
  script_tag(name:"summary", value:"This host is running Mahara and is prone to a Cross-Site Scripting
  Vulnerability.");
  exit(0);
}


include("http_func.inc");
include("version_func.inc");

maharaPort = get_http_port(default:80);
if(!maharaPort){
  exit(0);
}

maharaVer = get_kb_item("www/"+ maharaPort + "/Mahara");
if(!maharaVer){
  exit(0);
}

ver = eregmatch(pattern:"^(.+) under (/.*)$", string:maharaVer);
if(ver[1] != NULL)
{
  if(version_in_range(version:ver[1], test_version:"1.0", test_version2:"1.0.11")||
     version_in_range(version:ver[1], test_version:"1.1", test_version2:"1.1.4")){
    security_message(port:maharaPort, data:"The target host was found to be vulnerable.");
    exit(0);
  }
}

exit(99);
