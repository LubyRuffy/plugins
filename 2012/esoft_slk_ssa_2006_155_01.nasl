# OpenVAS Vulnerability Test
# $Id: esoft_slk_ssa_2006_155_01.nasl 14202 2019-03-15 09:16:15Z cfischer $
# Description: Auto-generated from the corresponding slackware advisory
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# or at your option, GNU General Public License version 3,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.56861");
  script_tag(name:"creation_date", value:"2012-09-11 01:34:21 +0200 (Tue, 11 Sep 2012)");
  script_tag(name:"last_modification", value:"$Date: 2019-03-15 10:16:15 +0100 (Fri, 15 Mar 2019) $");
  script_cve_id("CVE-2006-1516", "CVE-2006-1517", "CVE-2006-2753");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_version("$Revision: 14202 $");
  script_name("Slackware Advisory SSA:2006-155-01 mysql");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
  script_family("Slackware Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/slackware_linux", "ssh/login/slackpack", re:"ssh/login/release=SLK(9\.1|10\.0|10\.1|10\.2)");

  script_xref(name:"URL", value:"https://secure1.securityspace.com/smysecure/catid.html?in=SSA:2006-155-01");
  script_xref(name:"URL", value:"http://lists.mysql.com/announce/364");
  script_xref(name:"URL", value:"http://lists.mysql.com/announce/365");

  script_tag(name:"insight", value:"New mysql packages are available for Slackware 9.1, 10.0, 10.1,
10.2 and -current to fix security issues.

The MySQL packages shipped with Slackware 9.1, 10.0, and 10.1
may possibly leak sensitive information found in uninitialized
memory to authenticated users.  This is fixed in the new packages,
and was already patched in Slackware 10.2 and -current.
Since the vulnerabilities require a valid login and/or access to the
database server, the risk is moderate.  Slackware does not provide
network access to a MySQL database by default.

The MySQL packages in Slackware 10.2 and -current have been
upgraded to MySQL 4.1.20 (Slackware 10.2) and MySQL 5.0.22
(Slackware -current) to fix an SQL injection vulnerability.");

  script_tag(name:"solution", value:"Upgrade to the new package(s).");

  script_tag(name:"summary", value:"The remote host is missing an update as announced
via advisory SSA:2006-155-01.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-slack.inc");

report = "";
res = "";

if((res = isslkpkgvuln(pkg:"mysql", ver:"4.0.27-i486-1_slack9.1", rls:"SLK9.1")) != NULL) {
  report += res;
}
if((res = isslkpkgvuln(pkg:"mysql", ver:"4.0.27-i486-1_slack10.0", rls:"SLK10.0")) != NULL) {
  report += res;
}
if((res = isslkpkgvuln(pkg:"mysql", ver:"4.0.27-i486-1_slack10.1", rls:"SLK10.1")) != NULL) {
  report += res;
}
if((res = isslkpkgvuln(pkg:"mysql", ver:"4.1.20-i486-1_slack10.2", rls:"SLK10.2")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}