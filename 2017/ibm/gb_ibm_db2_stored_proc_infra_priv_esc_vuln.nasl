###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_db2_stored_proc_infra_priv_esc_vuln.nasl 14286 2019-03-18 15:20:15Z ckuersteiner $
#
# IBM DB2 Stored Procedure Infrastructure Privilege Escalation Vulnerability
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:ibm:db2";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812242");
  script_version("$Revision: 14286 $");
  script_cve_id("CVE-2013-6744");
  script_bugtraq_id(67616);
  script_tag(name:"cvss_base", value:"8.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 16:20:15 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2017-12-12 18:25:48 +0530 (Tue, 12 Dec 2017)");

  script_name("IBM DB2 Stored Procedure Infrastructure Privilege Escalation Vulnerability");

  script_tag(name:"summary", value:"This host is running IBM DB2 and is
  prone to privilege escalation vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an improper privilege
  handling in Stored Procedure infrastructure.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  authenticated user to obtain elevated privilege on Windows.");

  script_tag(name:"affected", value:"9.5, 9.7 before FP9a, 10.1 before FP3a,
  and 10.5 before FP3a");

  script_tag(name:"solution", value:"Apply the appropriate fix from reference link");

  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg22007183");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("gb_ibm_db2_remote_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("IBM-DB2/installed", "Host/runs_windows");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

infos = get_app_version_and_proto(cpe: CPE, port: port, exit_no_version: TRUE);
version = infos["version"];
proto = infos["proto"];

if (version =~ "^10\.05\.") {
  if (version_is_less_equal(version: version, test_version: "10.05.3")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "10.05.3a");
    security_message(port: port, data: report, proto: proto);
    exit(0);
  }
}

if (version =~ "^10\.01\.") {
  if (version_is_less_equal(version: version, test_version: "10.01.3")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "10.01.3a");
    security_message(port: port, data: report, proto: proto);
    exit(0);
  }
}

if (version =~ "^09\.07\.") {
  if (version_is_less_equal(version: version, test_version: "09.07.9")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "09.07.9a");
    security_message(port: port, data: report, proto: proto);
    exit(0);
  }
}

if (version =~ "^09\.05\.") {
  report = report_fixed_ver(installed_version: version, fixed_version: "Apply patch");
  security_message(port: port, data: report, proto: proto);
  exit(0);
}

exit(99);
