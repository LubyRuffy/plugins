# Copyright (C) 2019 Greenbone Networks GmbH
#
# SPDX-License-Identifier: GPL-2.0-or-later
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

CPE = "cpe:/a:collabtive:collabtive";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.113341");
  script_version("2019-04-03T09:59:09+0000");
  script_tag(name:"last_modification", value:"2019-04-03 09:59:09 +0000 (Wed, 03 Apr 2019)");
  script_tag(name:"creation_date", value:"2019-02-21 12:54:51 +0200 (Thu, 21 Feb 2019)");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");
  script_cve_id("CVE-2019-8935");
  script_name("Collabtive <= 3.1 XSS Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_collabtive_detect.nasl");
  script_mandatory_keys("collabtive/detected");

  script_xref(name:"URL", value:"https://people.canonical.com/~ubuntu-security/cve/2019/CVE-2019-8935.html");

  script_tag(name:"summary", value:"Collabtive is prone to a Cross-Site Scripting (XSS) Vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The vulnerability exists via the manageuser.php?action=profile id parameter.");

  script_tag(name:"impact", value:"Successful exploitation would allow an authenticated attacker to inject
  arbitrary JavaScript and HTML into the site.");

  script_tag(name:"affected", value:"Collabtive through version 3.1.");

  script_tag(name:"solution", value:"No known solution is available as of 03rd April, 2019.
  Information regarding this issue will be updated once solution details are available.");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"NoneAvailable");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe: CPE ) )
  exit( 0 );

if( ! infos = get_app_version_and_location( cpe: CPE, port: port, exit_no_version: TRUE ) )
  exit( 0 );

version = infos["version"];
if( version_is_less_equal( version: version, test_version: "3.1" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "None Available", install_path: infos["location"] );
  security_message( port: port, data: report );
  exit( 0 );
}

exit( 99 );
