# OpenVAS Vulnerability Test
# $Id: deb_2559_1.nasl 14275 2019-03-18 14:39:45Z cfischer $
# Description: Auto-generated from advisory DSA 2559-1 (libexif)
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
  script_oid("1.3.6.1.4.1.25623.1.0.72499");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2012-2812", "CVE-2012-2813", "CVE-2012-2814", "CVE-2012-2836", "CVE-2012-2837", "CVE-2012-2840", "CVE-2012-2841");
  script_version("$Revision: 14275 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 15:39:45 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2012-10-22 08:42:32 -0400 (Mon, 22 Oct 2012)");
  script_name("Debian Security Advisory DSA 2559-1 (libexif)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB(6|7)");
  script_xref(name:"URL", value:"https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202559-1");
  script_tag(name:"insight", value:"Several vulnerabilities were found in libexif, a library used to parse EXIF
meta-data on camera files.

CVE-2012-2812: A heap-based out-of-bounds array read in the
exif_entry_get_value function allows remote attackers to cause a denial of
service or possibly obtain potentially sensitive information from process
memory via an image with crafted EXIF tags.

CVE-2012-2813: A heap-based out-of-bounds array read in the
exif_convert_utf16_to_utf8 function allows remote attackers to cause a denial
of service or possibly obtain potentially sensitive information from process
memory via an image with crafted EXIF tags.

CVE-2012-2814: A buffer overflow in the exif_entry_format_value function
allows remote attackers to cause a denial of service or possibly execute
arbitrary code via an image with crafted EXIF tags.

CVE-2012-2836: A heap-based out-of-bounds array read in the
exif_data_load_data function allows remote attackers to cause a denial of
service or possibly obtain potentially sensitive information from process
memory via an image with crafted EXIF tags.

CVE-2012-2837: A divide-by-zero error in the mnote_olympus_entry_get_value
function while formatting EXIF maker note tags allows remote attackers to
cause a denial of service via an image with crafted EXIF tags.

CVE-2012-2840: An off-by-one error in the exif_convert_utf16_to_utf8 function
allows remote attackers to cause a denial of service or possibly execute
arbitrary code via an image with crafted EXIF tags.

CVE-2012-2841: An integer underflow in the exif_entry_get_value function can
cause a heap overflow and potentially arbitrary code execution while
formatting an EXIF tag, if the function is called with a buffer size
parameter equal to zero or one.

For the stable distribution (squeeze), these problems have been fixed in
version 0.6.19-1+squeeze1.

For the testing distribution (wheezy), these problems have been fixed in
version 0.6.20-3.

For the unstable distribution (sid), these problems have been fixed in
version 0.6.20-3.");

  script_tag(name:"solution", value:"We recommend that you upgrade your libexif packages.");
  script_tag(name:"summary", value:"The remote host is missing an update to libexif
announced via advisory DSA 2559-1.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"libexif-dev", ver:"0.6.19-1+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libexif12", ver:"0.6.19-1+squeeze1", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libexif-dev", ver:"0.6.20-3", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libexif12", ver:"0.6.20-3", rls:"DEB7")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}