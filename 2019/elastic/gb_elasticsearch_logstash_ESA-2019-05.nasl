# Copyright (C) 2019 Greenbone Networks GmbH
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (C) of the respective author(s)
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

CPE = "cpe:/a:elasticsearch:logstash";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.142176");
  script_version("2019-03-27T22:08:25+0000");
  script_tag(name:"last_modification", value:"2019-03-27 22:08:25 +0000 (Wed, 27 Mar 2019)");
  script_tag(name:"creation_date", value:"2019-03-27 21:39:17 +0000 (Wed, 27 Mar 2019)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_cve_id("CVE-2019-7612");

  # The Logstash version might differ from the Elasticsearch version detected
  # by gb_elastsearch_detect.nasl
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Elasticsearch Logstash Information Disclosure Vulnerability (ESA-2019-05)");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_elastsearch_detect.nasl");
  script_mandatory_keys("logstash/installed");

  script_tag(name:"summary", value:"A sensitive data disclosure flaw was found in the way Logstash logs malformed
  URLs.");

  script_tag(name:"impact", value:"If a malformed URL is specified as part of the Logstash configuration, the
  credentials for the URL could be inadvertently logged as part of the error message.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"Logstash versions before 6.6.1 and 5.6.15.");

  script_tag(name:"solution", value:"Update to version 5.6.15, 6.6.1 or later.");

  script_xref(name:"URL", value:"https://discuss.elastic.co/t/elastic-stack-6-6-1-and-5-6-15-security-update/169077");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (isnull(port = get_app_port(cpe: CPE)))
  exit(0);

if (!infos = get_app_version_and_location(cpe: CPE, port: port, exit_no_version: TRUE))
  exit(0);

version = infos['version'];
path = infos['location'];

if (version_is_less(version: version, test_version: "5.6.15")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "5.6.15", install_path: path);
  security_message(port: port, data: report);
  exit(0);
}

if (version =~ "^6\.") {
  if (version_is_less(version: version, test_version: "6.6.1")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "6.6.1", install_path: path);
    security_message(port: port, data: report);
    exit(0);
  }
}

exit(99);