###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_db2_audit_facility_loc_prev_escl_vuln_lin.nasl 14286 2019-03-18 15:20:15Z ckuersteiner $
#
# IBM DB2 Audit Facility Local Privilege Escalation Vulnerability (Linux)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:ibm:db2";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803756");
  script_version("$Revision: 14286 $");
  script_cve_id("CVE-2013-3475");
  script_bugtraq_id(60255);
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 16:20:15 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2013-09-05 15:09:14 +0530 (Thu, 05 Sep 2013)");

  script_name("IBM DB2 Audit Facility Local Privilege Escalation Vulnerability (Linux)");

  script_tag(name:"summary", value:"This host is running IBM DB2 and is prone to privilege escalation
vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"solution", value:"Apply the appropriate fix");

  script_tag(name:"insight", value:"The flaw is due to a boundary error within the setuid-set db2aud binary, which
can be exploited to cause a stack-based buffer overflow.");

  script_tag(name:"affected", value:"IBM DB2 version 9.1.x,
IBM DB2 version 9.5.x before FP9,
IBM DB2 version 9.7.x before FP7,
IBM DB2 version 9.8.x before FP5 and
IBM DB2 version 10.1.x before FP1 on Linux");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker to gain escalated privileges and
cause a stack-based buffer overflow.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/52663");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/84358");
  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21639355");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("gb_ibm_db2_remote_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("IBM-DB2/installed", "Host/runs_unixoide");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

infos = get_app_version_and_proto(cpe: CPE, port: port, exit_no_version: TRUE);
version = infos["version"];
proto = infos["proto"];

if (version =~ "^09\.01\.") {
  report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
  security_message(port: port, data: report, proto: proto);
  exit(0);
}

if (version =~ "^09\.05\.") {
  if (version_is_less_equal(version: version, test_version: "09.05.9")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: port, data: report, proto: proto);
    exit(0);
  }
}

if (version =~ "^09\.07\.") {
  if (version_is_less_equal(version: version, test_version: "09.07.7")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: port, data: report, proto: proto);
    exit(0);
  }
}

if (version =~ "^09\.08\.") {
  if (version_is_less_equal(version: version, test_version: "09.08.5")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: port, data: report, proto: proto);
    exit(0);
  }
}

if (version =~ "^10\.01\.") {
  if (version_is_less_equal(version: version, test_version: "10.01.1")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
    security_message(port: port, data: report, proto: proto);
    exit(0);
  }
}

exit(99);
