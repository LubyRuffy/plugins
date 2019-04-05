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
  script_oid("1.3.6.1.4.1.25623.1.0.852385");
  script_version("2019-04-03T06:42:23+0000");
  script_cve_id("CVE-2019-3855", "CVE-2019-3856", "CVE-2019-3857", "CVE-2019-3858",
                "CVE-2019-3859", "CVE-2019-3860", "CVE-2019-3861", "CVE-2019-3862",
                "CVE-2019-3863");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"2019-04-03 06:42:23 +0000 (Wed, 03 Apr 2019)");
  script_tag(name:"creation_date", value:"2019-04-03 06:42:23 +0000 (Wed, 03 Apr 2019)");
  script_name("openSUSE Update for libssh2_org openSUSE-SU-2019:1109-1 (libssh2_org)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap15\.0");

  script_xref(name:"openSUSE-SU", value:"2019:1109_1");
  script_xref(name:"URL", value:"http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00003.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'libssh2_org'
  package(s) announced via the openSUSE-SU-2019:1109_1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for libssh2_org fixes the following issues:

  Security issues fixed:

  - CVE-2019-3861: Fixed Out-of-bounds reads with specially crafted SSH
  packets (bsc#1128490).
  - CVE-2019-3862: Fixed Out-of-bounds memory comparison with specially
  crafted message channel request packet (bsc#1128492).
  - CVE-2019-3860: Fixed Out-of-bounds reads with specially crafted SFTP
  packets (bsc#1128481).
  - CVE-2019-3863: Fixed an Integer overflow in user authenicate keyboard
  interactive which could allow out-of-bounds writes with specially
  crafted keyboard responses (bsc#1128493).
  - CVE-2019-3856: Fixed a potential Integer overflow in keyboard
  interactive handling which could allow out-of-bounds write with
  specially crafted payload (bsc#1128472).
  - CVE-2019-3859: Fixed Out-of-bounds reads with specially crafted payloads
  due to unchecked use of _libssh2_packet_require and
  _libssh2_packet_requirev (bsc#1128480).
  - CVE-2019-3855: Fixed a potential Integer overflow in transport read
  which could allow out-of-bounds write with specially crafted payload
  (bsc#1128471).
  - CVE-2019-3858: Fixed a potential zero-byte allocation which could lead
  to an out-of-bounds read with a specially crafted SFTP packet
  (bsc#1128476).
  - CVE-2019-3857: Fixed a potential Integer overflow which could lead to
  zero-byte allocation and out-of-bounds with specially crafted message
  channel request SSH packet (bsc#1128474).

  This update was imported from the SUSE:SLE-15:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 15.0:

  zypper in -t patch openSUSE-2019-1109=1");

  script_tag(name:"affected", value:"'libssh2_org' package(s) on openSUSE Leap 15.0.");

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

if(release == "openSUSELeap15.0") {

  if(!isnull(res = isrpmvuln(pkg:"libssh2-1", rpm:"libssh2-1~1.8.0~lp150.3.3.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libssh2-1-debuginfo", rpm:"libssh2-1-debuginfo~1.8.0~lp150.3.3.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libssh2-devel", rpm:"libssh2-devel~1.8.0~lp150.3.3.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libssh2_org-debugsource", rpm:"libssh2_org-debugsource~1.8.0~lp150.3.3.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libssh2-1-32bit", rpm:"libssh2-1-32bit~1.8.0~lp150.3.3.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libssh2-1-32bit-debuginfo", rpm:"libssh2-1-32bit-debuginfo~1.8.0~lp150.3.3.1", rls:"openSUSELeap15.0"))) {
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
