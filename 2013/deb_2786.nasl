# OpenVAS Vulnerability Test
# $Id: deb_2786.nasl 14276 2019-03-18 14:43:56Z cfischer $
# Auto-generated from advisory DSA 2786-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
#

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.892786");
  script_version("$Revision: 14276 $");
  script_cve_id("CVE-2013-0900", "CVE-2013-2924");
  script_name("Debian Security Advisory DSA 2786-1 (icu - several vulnerabilities)");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 15:43:56 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2013-10-27 00:00:00 +0200 (Sun, 27 Oct 2013)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_xref(name:"URL", value:"http://www.debian.org/security/2013/dsa-2786.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB(6|7)");
  script_tag(name:"affected", value:"icu on Debian Linux");
  script_tag(name:"solution", value:"For the oldstable distribution (squeeze), these problems have been fixed
in version 4.4.1-8+squeeze2.

For the stable distribution (wheezy), which is only affected by
CVE-2013-2924
, this problem has been fixed in version 4.8.1.1-12+deb7u1.

For the testing distribution (jessie), which is only affected by
CVE-2013-2924
, this problem will be fixed soon.

For the unstable distribution (sid), which is only affected by
CVE-2013-2924
, this problem has been fixed in version 4.8.1.1-13+nmu1.

We recommend that you upgrade your icu packages.");
  script_tag(name:"summary", value:"The Google Chrome Security Team discovered two issues (a race condition
and a use-after-free issue) in the International Components for Unicode
(ICU) library.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"icu-doc", ver:"4.4.1-8+squeeze2", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"lib32icu-dev", ver:"4.4.1-8+squeeze2", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"lib32icu44", ver:"4.4.1-8+squeeze2", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libicu-dev", ver:"4.4.1-8+squeeze2", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libicu44", ver:"4.4.1-8+squeeze2", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libicu44-dbg", ver:"4.4.1-8+squeeze2", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"icu-doc", ver:"4.8.1.1-12+deb7u1", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libicu-dev", ver:"4.8.1.1-12+deb7u1", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libicu48", ver:"4.8.1.1-12+deb7u1", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libicu48-dbg", ver:"4.8.1.1-12+deb7u1", rls:"DEB7")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}