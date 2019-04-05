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
  script_oid("1.3.6.1.4.1.25623.1.0.852354");
  script_version("2019-04-03T06:41:08+0000");
  script_cve_id("CVE-2019-3838");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"2019-04-03 06:41:08 +0000 (Wed, 03 Apr 2019)");
  script_tag(name:"creation_date", value:"2019-04-03 06:41:08 +0000 (Wed, 03 Apr 2019)");
  script_name("openSUSE Update for ghostscript openSUSE-SU-2019:1119-1 (ghostscript)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap42\.3");

  script_xref(name:"openSUSE-SU", value:"2019:1119_1");
  script_xref(name:"URL", value:"http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00011.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'ghostscript'
  package(s) announced via the openSUSE-SU-2019:1119_1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for ghostscript fixes the following issue:

  Security issue fixed:

  - CVE-2019-3838: Fixed a vulnerability which made forceput operator in
  DefineResource to be still accessible which could allow access to file
  system outside of the constraints of -dSAFER (bsc#1129186).

  This update was imported from the SUSE:SLE-12:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 42.3:

  zypper in -t patch openSUSE-2019-1119=1");

  script_tag(name:"affected", value:"'ghostscript' package(s) on openSUSE Leap 42.3.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release)
  exit(0);

res = "";
report = "";

if(release == "openSUSELeap42.3") {

  if(!isnull(res = isrpmvuln(pkg:"ghostscript", rpm:"ghostscript~9.26a~14.18.1", rls:"openSUSELeap42.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"ghostscript-debuginfo", rpm:"ghostscript-debuginfo~9.26a~14.18.1", rls:"openSUSELeap42.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"ghostscript-debugsource", rpm:"ghostscript-debugsource~9.26a~14.18.1", rls:"openSUSELeap42.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"ghostscript-devel", rpm:"ghostscript-devel~9.26a~14.18.1", rls:"openSUSELeap42.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"ghostscript-mini", rpm:"ghostscript-mini~9.26a~14.18.1", rls:"openSUSELeap42.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"ghostscript-mini-debuginfo", rpm:"ghostscript-mini-debuginfo~9.26a~14.18.1", rls:"openSUSELeap42.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"ghostscript-mini-debugsource", rpm:"ghostscript-mini-debugsource~9.26a~14.18.1", rls:"openSUSELeap42.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"ghostscript-mini-devel", rpm:"ghostscript-mini-devel~9.26a~14.18.1", rls:"openSUSELeap42.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"ghostscript-x11", rpm:"ghostscript-x11~9.26a~14.18.1", rls:"openSUSELeap42.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"ghostscript-x11-debuginfo", rpm:"ghostscript-x11-debuginfo~9.26a~14.18.1", rls:"openSUSELeap42.3"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if (__pkg_match) {
    exit(99);
  }
  exit(0);
}

exit(0);
