# OpenVAS Vulnerability Test
# $Id: deb_2161_1.nasl 14275 2019-03-18 14:39:45Z cfischer $
# Description: Auto-generated from advisory DSA 2161-1 (openjdk-6)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.68995");
  script_version("$Revision: 14275 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 15:39:45 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2011-03-07 16:04:02 +0100 (Mon, 07 Mar 2011)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2010-4476");
  script_name("Debian Security Advisory DSA 2161-1 (openjdk-6)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB(5|6)");
  script_xref(name:"URL", value:"https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202161-1");
  script_tag(name:"insight", value:"It was discovered that the floating point parser in OpenJDK, an
implementation of the Java platform, can enter an infinite loop when
processing certain input strings.  Such input strings represent valid
numbers and can be contained in data supplied by an attacker over the
network, leading to a denial-of-service attack.

For the oldstable distribution (lenny), this problem will be fixed in
version 6b18-1.8.3-2~lenny1.  For technical reasons, this update will
be released separately.

For the stable distribution (squeeze), this problem has been fixed in
version 6b18-1.8.3-2+squeeze1.

For the testing distribution (wheezy) and the unstable distribution
(sid), this problem will be fixed soon.");

  script_tag(name:"solution", value:"We recommend that you upgrade your openjdk-6 packages.");
  script_tag(name:"summary", value:"The remote host is missing an update to openjdk-6
announced via advisory DSA 2161-1.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"openjdk-6-dbg", ver:"6b18-1.8.3-2~lenny1", rls:"DEB5")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-demo", ver:"6b18-1.8.3-2~lenny1", rls:"DEB5")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-doc", ver:"6b18-1.8.3-2~lenny1", rls:"DEB5")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jdk", ver:"6b18-1.8.3-2~lenny1", rls:"DEB5")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b18-1.8.3-2~lenny1", rls:"DEB5")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre-headless", ver:"6b18-1.8.3-2~lenny1", rls:"DEB5")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre-lib", ver:"6b18-1.8.3-2~lenny1", rls:"DEB5")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-source", ver:"6b18-1.8.3-2~lenny1", rls:"DEB5")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"icedtea-6-jre-cacao", ver:"6b18-1.8.3-2+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"icedtea6-plugin", ver:"6b18-1.8.3-2+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-dbg", ver:"6b18-1.8.3-2+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-demo", ver:"6b18-1.8.3-2+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-doc", ver:"6b18-1.8.3-2+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jdk", ver:"6b18-1.8.3-2+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b18-1.8.3-2+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre-headless", ver:"6b18-1.8.3-2+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre-lib", ver:"6b18-1.8.3-2+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre-zero", ver:"6b18-1.8.3-2+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-source", ver:"6b18-1.8.3-2+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}