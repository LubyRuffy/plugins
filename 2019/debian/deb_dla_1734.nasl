# Copyright (C) 2019 Greenbone Networks GmbH
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (C) the respective author(s)
#
# SPDX-License-Identifier: GPL-2.0-or-later
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.891734");
  script_version("2019-04-03T11:45:59+0000");
  script_cve_id("CVE-2018-5800", "CVE-2018-5801", "CVE-2018-5802", "CVE-2018-5808", "CVE-2018-5817", "CVE-2018-5818", "CVE-2018-5819");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"2019-04-03 11:45:59 +0000 (Wed, 03 Apr 2019)");
  script_tag(name:"creation_date", value:"2019-04-02 20:00:00 +0000 (Tue, 02 Apr 2019)");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1734-1] libraw security update)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2019/03/msg00036.html");
  script_xref(name:"URL", value:"https://security-tracker.debian.org/tracker/DLA-1734-1");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'libraw'
  package(s) announced via the DSA-1734-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Secunia Research has discovered multiple vulnerabilities in libraw, a
raw image decoder library, which can be exploited to cause a Denial of
Service.

The issues contain divisions by zero, out-of-bounds read memory access,
heap-based buffer overflows and NULL pointer dereferences.");

  script_tag(name:"affected", value:"'libraw' package(s) on Debian Linux.");

  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
0.16.0-9+deb8u4.

We recommend that you upgrade your libraw packages.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if(!isnull(res = isdpkgvuln(pkg:"libraw-bin", ver:"0.16.0-9+deb8u4", rls:"DEB8"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"libraw-dev", ver:"0.16.0-9+deb8u4", rls:"DEB8"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"libraw-doc", ver:"0.16.0-9+deb8u4", rls:"DEB8"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"libraw10", ver:"0.16.0-9+deb8u4", rls:"DEB8"))) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}

exit(0);