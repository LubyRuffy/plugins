###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for xen CESA-2013:0241 centos5
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_xref(name:"URL", value:"http://lists.centos.org/pipermail/centos-announce/2013-February/019230.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881594");
  script_version("$Revision: 14222 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-15 13:50:48 +0100 (Fri, 15 Mar 2019) $");
  script_tag(name:"creation_date", value:"2013-02-08 10:16:15 +0530 (Fri, 08 Feb 2013)");
  script_cve_id("CVE-2012-4544");
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name:"CESA", value:"2013:0241");
  script_name("CentOS Update for xen CESA-2013:0241 centos5");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'xen'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms", re:"ssh/login/release=CentOS5");
  script_tag(name:"affected", value:"xen on CentOS 5");
  script_tag(name:"solution", value:"Please install the updated packages.");
  script_tag(name:"insight", value:"The xen packages contain administration tools and the xend service for
  managing the kernel-xen kernel for virtualization on Red Hat Enterprise
  Linux.

  A flaw was found in the way libxc, the Xen control library, handled
  excessively large kernel and ramdisk images when starting new guests. A
  privileged guest user in a para-virtualized guest (a DomU) could create a
  crafted kernel or ramdisk image that, when attempting to use it during
  guest start, could result in an out-of-memory condition in the privileged
  domain (the Dom0). (CVE-2012-4544)

  Red Hat would like to thank the Xen project for reporting this issue.

  All users of xen are advised to upgrade to these updated packages, which
  correct this issue. After installing the updated packages, the xend service
  must be restarted for this update to take effect.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release)
  exit(0);

res = "";

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"xen", rpm:"xen~3.0.3~142.el5_9.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-devel", rpm:"xen-devel~3.0.3~142.el5_9.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs", rpm:"xen-libs~3.0.3~142.el5_9.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
