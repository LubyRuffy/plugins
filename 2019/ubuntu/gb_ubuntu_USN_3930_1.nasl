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
  script_oid("1.3.6.1.4.1.25623.1.0.843952");
  script_version("2019-04-03T06:39:35+0000");
  script_cve_id("CVE-2018-19824", "CVE-2019-3459", "CVE-2019-3460", "CVE-2019-6974",
                "CVE-2019-7221", "CVE-2019-7222", "CVE-2019-7308", "CVE-2019-8912",
                "CVE-2019-8956", "CVE-2019-8980", "CVE-2019-9003", "CVE-2019-9162",
                "CVE-2019-9213");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"2019-04-03 06:39:35 +0000 (Wed, 03 Apr 2019)");
  script_tag(name:"creation_date", value:"2019-04-03 06:39:35 +0000 (Wed, 03 Apr 2019)");
  script_name("Ubuntu Update for linux USN-3930-1");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU18\.10");

  script_xref(name:"USN", value:"3930-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-3930-1/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'linux'
  package(s) announced via the USN-3930-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Mathias Payer and Hui Peng discovered
a use-after-free vulnerability in the Advanced Linux Sound Architecture
(ALSA) subsystem. A physically proximate attacker could use this to cause
a denial of service (system crash). (CVE-2018-19824)

Shlomi Oberman, Yuli Shapiro, and Ran Menscher discovered an information
leak in the Bluetooth implementation of the Linux kernel. An attacker
within Bluetooth range could use this to expose sensitive information
(kernel memory). (CVE-2019-3459, CVE-2019-3460)

Jann Horn discovered that the KVM implementation in the Linux kernel
contained a use-after-free vulnerability. An attacker in a guest VM with
access to /dev/kvm could use this to cause a denial of service (guest VM
crash). (CVE-2019-6974)

Jim Mattson and Felix Wilhelm discovered a use-after-free vulnerability in
the KVM subsystem of the Linux kernel, when using nested virtual machines.
A local attacker in a guest VM could use this to cause a denial of service
(system crash) or possibly execute arbitrary code in the host system.
(CVE-2019-7221)

Felix Wilhelm discovered that an information leak vulnerability existed in
the KVM subsystem of the Linux kernel, when nested virtualization is used.
A local attacker could use this to expose sensitive information (host
system memory to a guest VM). (CVE-2019-7222)

Jann Horn discovered that the eBPF implementation in the Linux kernel was
insufficiently hardened against Spectre V1 attacks. A local attacker could
use this to expose sensitive information. (CVE-2019-7308)

It was discovered that a use-after-free vulnerability existed in the user-
space API for crypto (af_alg) implementation in the Linux kernel. A local
attacker could use this to cause a denial of service (system crash) or
possibly execute arbitrary code. (CVE-2019-8912)

Jakub Jirasek discovered a use-after-free vulnerability in the SCTP
implementation in the Linux kernel. A local attacker could use this to
cause a denial of service (system crash) or possibly execute arbitrary
code. (CVE-2019-8956)

It was discovered that the Linux kernel did not properly deallocate memory
when handling certain errors while reading files. A local attacker could
use this to cause a denial of service (excessive memory consumption).
(CVE-2019-8980)

It was discovered that a use-after-free vulnerability existed in the IPMI
implementation in the Linux kernel. A local attacker with access to the
IPMI character device files could use this to cause a denial of service
(system crash). (CVE-2019-9003)

Jann Horn discovered that the SNMP NAT implementation in the Linux kernel
performed insufficient ASN.1 length checks. An atta ...

  Description truncated. Please see the references for more information.");

  script_tag(name:"affected", value:"'linux' package(s) on Ubuntu 18.10.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();
if(!release)
  exit(0);

res = "";
report = "";

if(release == "UBUNTU18.10") {

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.18.0-1008-gcp", ver:"4.18.0-1008.9", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.18.0-1009-kvm", ver:"4.18.0-1009.9", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.18.0-1011-raspi2", ver:"4.18.0-1011.13", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.18.0-1012-aws", ver:"4.18.0-1012.14", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.18.0-1014-azure", ver:"4.18.0-1014.14", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.18.0-17-generic", ver:"4.18.0-17.18", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.18.0-17-generic-lpae", ver:"4.18.0-17.18", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.18.0-17-lowlatency", ver:"4.18.0-17.18", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.18.0-17-snapdragon", ver:"4.18.0-17.18", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-aws", ver:"4.18.0.1012.12", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-azure", ver:"4.18.0.1014.15", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-gcp", ver:"4.18.0.1008.8", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-generic", ver:"4.18.0.17.18", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-generic-lpae", ver:"4.18.0.17.18", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-gke", ver:"4.18.0.1008.8", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-kvm", ver:"4.18.0.1009.9", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-lowlatency", ver:"4.18.0.17.18", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-raspi2", ver:"4.18.0.1011.8", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-snapdragon", ver:"4.18.0.17.18", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"linux-image-virtual", ver:"4.18.0.17.18", rls:"UBUNTU18.10"))) {
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
