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
  script_oid("1.3.6.1.4.1.25623.1.0.852312");
  script_version("2019-04-02T06:16:35+0000");
  script_cve_id("CVE-2018-12546", "CVE-2018-12550", "CVE-2018-12551");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"2019-04-02 06:16:35 +0000 (Tue, 02 Apr 2019)");
  script_tag(name:"creation_date", value:"2019-02-23 04:07:40 +0100 (Sat, 23 Feb 2019)");
  script_name("SuSE Update for mosquitto openSUSE-SU-2019:0233-1 (mosquitto)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap15\.0");

  script_xref(name:"openSUSE-SU", value:"2019:0233_1");
  script_xref(name:"URL", value:"http://lists.opensuse.org/opensuse-security-announce/2019-02/msg00054.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'mosquitto'
  package(s) announced via the openSUSE-SU-2019:0233_1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for mosquitto fixes the following issues:

  Security issues fixed:

  - CVE-2018-12546: Fixed an issue with revoked access to topics
  (bsc#1125019).

  - CVE-2018-12551: Fixed an issue which allowed malformed data in the
  password file to be treated as valid (bsc#1125020).

  - CVE-2018-12550: Fixed an an issue which treats an empty ACL file
  wrongly (bsc#1125021).


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 15.0:

  zypper in -t patch openSUSE-2019-233=1");

  script_tag(name:"affected", value:"mosquitto on openSUSE Leap 15.0.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "openSUSELeap15.0")
{

  if ((res = isrpmvuln(pkg:"libmosquitto1", rpm:"libmosquitto1~1.4.15~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmosquitto1-debuginfo", rpm:"libmosquitto1-debuginfo~1.4.15~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmosquittopp1", rpm:"libmosquittopp1~1.4.15~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmosquittopp1-debuginfo", rpm:"libmosquittopp1-debuginfo~1.4.15~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mosquitto", rpm:"mosquitto~1.4.15~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mosquitto-clients", rpm:"mosquitto-clients~1.4.15~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mosquitto-clients-debuginfo", rpm:"mosquitto-clients-debuginfo~1.4.15~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mosquitto-debuginfo", rpm:"mosquitto-debuginfo~1.4.15~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mosquitto-debugsource", rpm:"mosquitto-debugsource~1.4.15~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mosquitto-devel", rpm:"mosquitto-devel~1.4.15~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
