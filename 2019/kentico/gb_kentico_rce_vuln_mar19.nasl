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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.113366");
  script_version("2019-04-03T09:02:33+0000");
  script_tag(name:"last_modification", value:"2019-04-03 09:02:33 +0000 (Wed, 03 Apr 2019)");
  script_tag(name:"creation_date", value:"2019-04-03 10:44:31 +0000 (Wed, 03 Apr 2019)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_tag(name:"solution_type", value:"VendorFix");

  script_cve_id("CVE-2019-10068");

  script_name("Kentico <= 12.0.14 Remote Code Execution Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_kentico_cms_detect.nasl");
  script_mandatory_keys("kentico_cms/detected");

  script_tag(name:"summary", value:"Kentico CMS is prone to a remote code execution (RCE) vulnerability.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Due to a failure to validate security headers,
  it's possible for a specially crafted request to the staging service to bypass initial authentication
  and proceed to deserialize user-controlled .NET object input. This deserialization
  then leads to unauthenticated remote code execution on the server
  where the Kentico instance is hosted.

  This vulnerability only exists if the Staging Service authentication is not set to X.509.");
  script_tag(name:"impact", value:"Successful exploitation would allow an attacker to execute arbitary code on the target system.");
  script_tag(name:"affected", value:"Kentico through version 12.0.14.");
  script_tag(name:"solution", value:"Update to version 12.0.15.");

  script_xref(name:"URL", value:"https://devnet.kentico.com/download/hotfixes#securityBugs-v12");

  exit(0);
}

CPE = "cpe:/a:kentico:cms";

include( "host_details.inc" );
include( "version_func.inc" );

if( ! port = get_app_port( cpe: CPE ) ) exit( 0 );
if( ! version = get_app_version( cpe: CPE, port: port ) ) exit( 0 );

if( version_is_less( version: version, test_version: "12.0.15" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "12.0.15" );
  security_message( data: report, port: port );
  exit( 0 );
}

exit( 99 );
