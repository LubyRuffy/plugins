# Copyright (C) 2019 Greenbone Networks GmbH
#
# SPDX-License-Identifier: GPL-2.0-or-later
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.112556");
  script_version("2019-04-01T10:58:39+0000");
  script_tag(name:"last_modification", value:"2019-04-01 10:58:39 +0000 (Mon, 01 Apr 2019)");
  script_tag(name:"creation_date", value:"2019-04-01 12:15:00 +0100 (Mon, 01 Apr 2019)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");

  script_cve_id("CVE-2019-9908");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("WordPress Font Organizer Plugin <= 2.1.1 XSS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");

  script_tag(name:"summary", value:"The Wordpress plugin Font Organizer is prone to a cross-site scripting (XSS) vulnerability.");
  script_tag(name:"impact", value:"Successful exploitation would allow an attacker to inject malicious content into an affected site.");
  script_tag(name:"affected", value:"WordPress Font Organizer plugin through version 2.1.1.");
  script_tag(name:"solution", value:"No known solution is available as of April 1st, 2019. Information regarding this issue will be updated
  once solution details are available.");

  script_xref(name:"URL", value:"https://lists.openwall.net/full-disclosure/2019/02/05/8");
  script_xref(name:"URL", value:"https://wordpress.org/plugins/font-organizer/#developers");

  exit(0);
}

CPE = "cpe:/a:wordpress:wordpress";

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");

if(!port = get_app_port(cpe: CPE))
  exit(0);

if(!dir = get_app_location(cpe: CPE, port: port))
  exit(0);

if(dir == "/")
  dir = "";

url = dir + "/wp-content/plugins/font-organizer/readme.txt";
res = http_get_cache(port: port, item: url);

if("=== Font Organizer ===" >< res && "Changelog" >< res) {

  vers = eregmatch( pattern: "Stable tag: ([0-9.]+)", string: res);

  if(vers[1] && version_is_less_equal(version: vers[1], test_version: "2.1.1")) {
    report = report_fixed_ver(installed_version: vers[1], fixed_version: "None", file_checked: url);
    security_message(port: port, data: report);
    exit(0);
  }
}

exit(99);
