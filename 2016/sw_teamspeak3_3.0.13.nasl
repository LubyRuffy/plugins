###############################################################################
# OpenVAS Vulnerability Test
# $Id: sw_teamspeak3_3.0.13.nasl 11903 2018-10-15 10:26:16Z asteins $
#
# TeamSpeak 3 Server <= 3.0.13 Multiple Vulnerabilities
#
# Authors:
# Christian Fischer <info@schutzwerk.com>
#
# Copyright:
# Copyright (c) 2016 SCHUTZWERK GmbH
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

CPE = "cpe:/a:teamspeak:teamspeak3";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.111113");
  script_version("$Revision: 11903 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-15 12:26:16 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-08-15 15:00:00 +0200 (Mon, 15 Aug 2016)");
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_name("TeamSpeak 3 Server <= 3.0.13 Multiple Vulnerabilities");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 SCHUTZWERK GmbH");
  script_family("General");
  script_dependencies("gb_teamspeak_detect.nasl");
  script_require_ports("Services/teamspeak-serverquery", 10011);
  script_mandatory_keys("teamspeak3_server/installed");

  script_xref(name:"URL", value:"http://teamspeak.com/downloads");
  script_xref(name:"URL", value:"http://seclists.org/fulldisclosure/2016/Aug/61");
  script_xref(name:"URL", value:"http://forum.teamspeak.com/threads/126318-TeamSpeak-3-Server-3-0-13-2-released?p=434139#post434139");

  script_tag(name:"summary", value:"This host is running a TeamSpeak 3 server and is prone to
  multiple vulnerabilities which leads to:

  - Remote code execution

  - Information disclosure

  - Denial-of-Service
  on the affected system.");
  script_tag(name:"impact", value:"Exploiting this vulnerability may allow an attacker execute
  arbitrary code on the TeamSpeak 3 server or cause a Denial-of-Service of the affected service.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"affected", value:"TeamSpeak 3 server version up to 3.0.13");
  script_tag(name:"solution", value:"Update your TeamSpeak 3 server to version 3.0.13.1 or higher.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! ver = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:ver, test_version:"3.0", test_version2:"3.0.13" ) ) {
  report = report_fixed_ver( installed_version:ver, fixed_version:"3.0.13.1" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
