# OpenVAS Vulnerability Test
# $Id: deb_2263_2.nasl 14275 2019-03-18 14:39:45Z cfischer $
# Description: Auto-generated from advisory DSA 2263-2 (movabletype-opensource)
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
  script_oid("1.3.6.1.4.1.25623.1.0.70694");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_version("$Revision: 14275 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 15:39:45 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2012-02-11 03:22:33 -0500 (Sat, 11 Feb 2012)");
  script_name("Debian Security Advisory DSA 2263-2 (movabletype-opensource)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB(5|6)");
  script_xref(name:"URL", value:"https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202263-2");
  script_tag(name:"insight", value:"Advisory DSA 2363-1 did not include a package for the Debian 5.0 'Lenny'
suite at that time. This update adds that package. The original advisory
text follows.

It was discovered that Movable Type, a weblog publishing system,
contains several security vulnerabilities:

A remote attacker could execute arbitrary code in a logged-in users'
web browser.

A remote attacker could read or modify the contents in the system
under certain circumstances.

For the oldstable distribution (lenny), these problems have been fixed in
version 4.2.3-1+lenny3.

For the stable distribution (squeeze), these problems have been fixed in
version 4.3.5+dfsg-2+squeeze2.

For the testing distribution (wheezy) and for the unstable
distribution (sid), these problems have been fixed in version
4.3.6.1+dfsg-1.");

  script_tag(name:"solution", value:"We recommend that you upgrade your movabletype-opensource packages.");
  script_tag(name:"summary", value:"The remote host is missing an update to movabletype-opensource
announced via advisory DSA 2263-2.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"movabletype-opensource", ver:"4.2.3-1+lenny3", rls:"DEB5")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"movabletype-plugin-core", ver:"4.2.3-1+lenny3", rls:"DEB5")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"movabletype-opensource", ver:"4.3.5+dfsg-2+squeeze2", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"movabletype-plugin-core", ver:"4.3.5+dfsg-2+squeeze2", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"movabletype-plugin-zemanta", ver:"4.3.5+dfsg-2+squeeze2", rls:"DEB6")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}