# Copyright:
# Copyright (C) 2019 Greenbone Networks GmbH
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.112509");
  script_version("2019-04-03T09:59:09+0000");

  script_cve_id("CVE-2019-1000001");

  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"2019-04-03 09:59:09 +0000 (Wed, 03 Apr 2019)");
  script_tag(name:"creation_date", value:"2019-02-06 14:11:00 +0100 (Wed, 06 Feb 2019)");

  script_name("TeamPass <= 2.1.27 Information Disclosure Vulnerability");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_teampass_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("teampass/installed");

  script_tag(name:"summary", value:"TeamPass contains a storing passwords in a recoverable format vulnerability
  in shared password vaults that can result in all shared passwords being recoverable via the server side.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"impact", value:"Successful exploitation will allow an attacker that bypassed authentication
  to have access to all shared passwords a registered user has access to.");
  script_tag(name:"affected", value:"TeamPass through version 2.1.27.");
  script_tag(name:"solution", value:"No known solution is available as of 03rd April, 2019.
  Information regarding this issue will be updated once solution details are available.");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"NoneAvailable");

  script_xref(name:"URL", value:"https://github.com/nilsteampassnet/TeamPass/issues/2495");

  exit(0);
}

CPE = 'cpe:/a:teampass:teampass';

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less( version:vers, test_version:"2.1.27" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"NoneAvailable" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
