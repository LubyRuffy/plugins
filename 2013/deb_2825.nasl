# OpenVAS Vulnerability Test
# $Id: deb_2825.nasl 14276 2019-03-18 14:43:56Z cfischer $
# Auto-generated from advisory DSA 2825-1 using nvtgen 1.0
# Script version: 1.1
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
  script_oid("1.3.6.1.4.1.25623.1.0.702825");
  script_version("$Revision: 14276 $");
  script_cve_id("CVE-2013-7113", "CVE-2013-7114");
  script_name("Debian Security Advisory DSA 2825-1 (wireshark - several vulnerabilities)");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 15:43:56 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2013-12-20 00:00:00 +0100 (Fri, 20 Dec 2013)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");

  script_xref(name:"URL", value:"http://www.debian.org/security/2013/dsa-2825.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7");
  script_tag(name:"affected", value:"wireshark on Debian Linux");
  script_tag(name:"solution", value:"For the stable distribution (wheezy), these problems have been fixed in
version 1.8.2-5wheezy9.

For the unstable distribution (sid), these problems have been fixed in
version 1.10.4-1.

We recommend that you upgrade your wireshark packages.");
  script_tag(name:"summary", value:"Laurent Butti and Garming Sam discovered multiple vulnerabilities in the
dissectors for NTLMSSPv2 and BSSGP, which could lead to denial of service
or the execution of arbitrary code.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"libwireshark-data", ver:"1.8.2-5wheezy9", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libwireshark-dev", ver:"1.8.2-5wheezy9", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libwireshark2", ver:"1.8.2-5wheezy9", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libwiretap-dev", ver:"1.8.2-5wheezy9", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libwiretap2", ver:"1.8.2-5wheezy9", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libwsutil-dev", ver:"1.8.2-5wheezy9", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libwsutil2", ver:"1.8.2-5wheezy9", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"tshark", ver:"1.8.2-5wheezy9", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"wireshark", ver:"1.8.2-5wheezy9", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"wireshark-common", ver:"1.8.2-5wheezy9", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"wireshark-dbg", ver:"1.8.2-5wheezy9", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"wireshark-dev", ver:"1.8.2-5wheezy9", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"wireshark-doc", ver:"1.8.2-5wheezy9", rls:"DEB7")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}