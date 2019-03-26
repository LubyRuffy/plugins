###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wwh_44152.nasl 13960 2019-03-01 13:18:27Z cfischer $
#
# Wiki Web Help Insecure Cookie Authentication Bypass Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
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
CPE = "cpe:/a:wikiwebhelp:wiki_web_help";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100860");
  script_version("$Revision: 13960 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-01 14:18:27 +0100 (Fri, 01 Mar 2019) $");
  script_tag(name:"creation_date", value:"2010-10-19 12:49:22 +0200 (Tue, 19 Oct 2010)");
  script_bugtraq_id(44152);
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Wiki Web Help Insecure Cookie Authentication Bypass Vulnerability");

  script_xref(name:"URL", value:"https://www.securityfocus.com/bid/44152");
  script_xref(name:"URL", value:"http://sourceforge.net/projects/wwh/");
  script_xref(name:"URL", value:"http://wikiwebhelp.org");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("gb_wwh_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("WWH/installed");

  script_tag(name:"summary", value:"Wiki Web Help is prone to an authentication-bypass vulnerability
  because it fails to adequately verify user-supplied input used for cookie-based authentication.");

  script_tag(name:"impact", value:"Attackers can exploit this vulnerability to gain administrative access
  to the affected application. This may aid in further attacks.");

  script_tag(name:"affected", value:"Wiki Web Help versions 0.3.3 and prior are vulnerable.");

  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure
  of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer
  release, disable respective features, remove the product or replace the product by another one.");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!port = get_app_port(cpe:CPE))exit(0);
if(vers = get_app_version(cpe:CPE, port:port)) {
  if(version_is_less(version:vers, test_version:"0.3.4")) {
    security_message(port:port);
    exit(0);
  }
}

exit(0);