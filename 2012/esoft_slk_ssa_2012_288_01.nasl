# OpenVAS Vulnerability Test
# $Id: esoft_slk_ssa_2012_288_01.nasl 14202 2019-03-15 09:16:15Z cfischer $
# Description: Auto-generated from advisory SSA:2012-288-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.72524");
  script_version("$Revision: 14202 $");
  script_tag(name:"cvss_base", value:"4.4");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-03-15 10:16:15 +0100 (Fri, 15 Mar 2019) $");
  script_tag(name:"creation_date", value:"2012-10-22 08:48:47 -0400 (Mon, 22 Oct 2012)");
  script_name("Slackware Advisory SSA:2012-288-01 seamonkey");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
  script_family("Slackware Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/slackware_linux", "ssh/login/slackpack", re:"ssh/login/release=SLK(13\.37|14\.0)");

  script_xref(name:"URL", value:"https://secure1.securityspace.com/smysecure/catid.html?in=SSA:2012-288-01");

  script_tag(name:"insight", value:"New seamonkey packages are available for Slackware 13.37, 14.0, and -current to
fix security issues.");

  script_tag(name:"solution", value:"Upgrade to the new package(s).");

  script_tag(name:"summary", value:"The remote host is missing an update as announced
via advisory SSA:2012-288-01.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-slack.inc");

report = "";
res = "";

if((res = isslkpkgvuln(pkg:"seamonkey", ver:"2.13.1-i486-1_slack13.37", rls:"SLK13.37")) != NULL) {
  report += res;
}
if((res = isslkpkgvuln(pkg:"seamonkey-solibs", ver:"2.13.1-i486-1_slack13.37", rls:"SLK13.37")) != NULL) {
  report += res;
}
if((res = isslkpkgvuln(pkg:"seamonkey", ver:"2.13.1-i486-1", rls:"SLK14.0")) != NULL) {
  report += res;
}
if((res = isslkpkgvuln(pkg:"seamonkey-solibs", ver:"2.13.1-i486-1", rls:"SLK14.0")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}