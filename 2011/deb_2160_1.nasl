# OpenVAS Vulnerability Test
# $Id: deb_2160_1.nasl 14275 2019-03-18 14:39:45Z cfischer $
# Description: Auto-generated from advisory DSA 2160-1 (tomcat6)
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
  script_oid("1.3.6.1.4.1.25623.1.0.68994");
  script_version("$Revision: 14275 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 15:39:45 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2011-03-07 16:04:02 +0100 (Mon, 07 Mar 2011)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2010-3718", "CVE-2011-0013", "CVE-2011-0534");
  script_name("Debian Security Advisory DSA 2160-1 (tomcat6)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB6");
  script_xref(name:"URL", value:"https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202160-1");
  script_tag(name:"insight", value:"Several vulnerabilities were discovered in the Tomcat Servlet and JSP
engine:

CVE-2010-3718

It was discovered that the SecurityManager insufficiently
restricted the working directory.

CVE-2011-0013

It was discovered that the HTML manager interface is affected
by cross-site scripting.

CVE-2011-0534

It was discovered that NIO connector performs insufficient
validation of the HTTP headers, which could lead to denial
of service.

The oldstable distribution (lenny) is not affected by these issues.

For the stable distribution (squeeze), this problem has been fixed in
version 6.0.28-9+squeeze1.

For the unstable distribution (sid), this problem has been fixed in
version 6.0.28-10.");

  script_tag(name:"solution", value:"We recommend that you upgrade your tomcat6 packages.");
  script_tag(name:"summary", value:"The remote host is missing an update to tomcat6
announced via advisory DSA 2160-1.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"5-java", ver:"6.0.28-9+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"5-java-doc", ver:"6.0.28-9+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libtomcat6-java", ver:"6.0.28-9+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"tomcat6", ver:"6.0.28-9+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"tomcat6-admin", ver:"6.0.28-9+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"tomcat6-common", ver:"6.0.28-9+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"tomcat6-docs", ver:"6.0.28-9+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"tomcat6-examples", ver:"6.0.28-9+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"tomcat6-user", ver:"6.0.28-9+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}