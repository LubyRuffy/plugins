# OpenVAS Vulnerability Test
# $Id: esoft_slk_ssa_2006_335_02.nasl 14202 2019-03-15 09:16:15Z cfischer $
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
  script_oid("1.3.6.1.4.1.25623.1.0.57703");
  script_tag(name:"creation_date", value:"2012-09-11 01:34:21 +0200 (Tue, 11 Sep 2012)");
  script_tag(name:"last_modification", value:"$Date: 2019-03-15 10:16:15 +0100 (Fri, 15 Mar 2019) $");
  script_cve_id("CVE-2006-5815", "CVE-2006-6170", "CVE-2006-6171");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_version("$Revision: 14202 $");
  script_name("Slackware Advisory SSA:2006-335-02 proftpd");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
  script_family("Slackware Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/slackware_linux", "ssh/login/slackpack", re:"ssh/login/release=SLK(8\.1|9\.0|9\.1|10\.0|10\.1|10\.2|11\.0)");

  script_xref(name:"URL", value:"https://secure1.securityspace.com/smysecure/catid.html?in=SSA:2006-335-02");

  script_tag(name:"insight", value:"New proftpd packages are available for Slackware 8.1, 9.0, 9.1, 10.0, 10.1,
10.2, and 11.0 to fix security issues.");

  script_tag(name:"solution", value:"Upgrade to the new package(s).");

  script_tag(name:"summary", value:"The remote host is missing an update as announced
via advisory SSA:2006-335-02.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-slack.inc");

report = "";
res = "";

if((res = isslkpkgvuln(pkg:"proftpd", ver:"1.3.0a-i386-1_slack8.1", rls:"SLK8.1")) != NULL) {
  report += res;
}
if((res = isslkpkgvuln(pkg:"proftpd", ver:"1.3.0a-i386-1_slack9.0", rls:"SLK9.0")) != NULL) {
  report += res;
}
if((res = isslkpkgvuln(pkg:"proftpd", ver:"1.3.0a-i486-1_slack9.1", rls:"SLK9.1")) != NULL) {
  report += res;
}
if((res = isslkpkgvuln(pkg:"proftpd", ver:"1.3.0a-i486-1_slack10.0", rls:"SLK10.0")) != NULL) {
  report += res;
}
if((res = isslkpkgvuln(pkg:"proftpd", ver:"1.3.0a-i486-1_slack10.1", rls:"SLK10.1")) != NULL) {
  report += res;
}
if((res = isslkpkgvuln(pkg:"proftpd", ver:"1.3.0a-i486-1_slack10.2", rls:"SLK10.2")) != NULL) {
  report += res;
}
if((res = isslkpkgvuln(pkg:"proftpd", ver:"1.3.0a-i486-1_slack11.0", rls:"SLK11.0")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}