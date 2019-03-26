###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for httpd CESA-2014:0920 centos6
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.881968");
  script_version("$Revision: 14222 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-15 13:50:48 +0100 (Fri, 15 Mar 2019) $");
  script_tag(name:"creation_date", value:"2014-07-28 16:31:47 +0530 (Mon, 28 Jul 2014)");
  script_cve_id("CVE-2014-0118", "CVE-2014-0226", "CVE-2014-0231");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_name("CentOS Update for httpd CESA-2014:0920 centos6");

  script_tag(name:"affected", value:"httpd on CentOS 6");
  script_tag(name:"insight", value:"The httpd packages provide the Apache HTTP Server, a powerful,
efficient, and extensible web server.

A race condition flaw, leading to heap-based buffer overflows, was found in
the mod_status httpd module. A remote attacker able to access a status page
served by mod_status on a server using a threaded Multi-Processing Module
(MPM) could send a specially crafted request that would cause the httpd
child process to crash or, possibly, allow the attacker to execute
arbitrary code with the privileges of the 'apache' user. (CVE-2014-0226)

A denial of service flaw was found in the way httpd's mod_deflate module
handled request body decompression (configured via the 'DEFLATE' input
filter). A remote attacker able to send a request whose body would be
decompressed could use this flaw to consume an excessive amount of system
memory and CPU on the target system. (CVE-2014-0118)

A denial of service flaw was found in the way httpd's mod_cgid module
executed CGI scripts that did not read data from the standard input.
A remote attacker could submit a specially crafted request that would cause
the httpd child process to hang indefinitely. (CVE-2014-0231)

All httpd users are advised to upgrade to these updated packages, which
contain backported patches to correct these issues. After installing the
updated packages, the httpd daemon will be restarted automatically.");
  script_tag(name:"solution", value:"Please install the updated packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"CESA", value:"2014:0920");
  script_xref(name:"URL", value:"http://lists.centos.org/pipermail/centos-announce/2014-July/020441.html");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'httpd'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms", re:"ssh/login/release=CentOS6");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release)
  exit(0);

res = "";

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"httpd", rpm:"httpd~2.2.15~31.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"httpd-devel", rpm:"httpd-devel~2.2.15~31.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"httpd-manual", rpm:"httpd-manual~2.2.15~31.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"httpd-tools", rpm:"httpd-tools~2.2.15~31.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mod_ssl", rpm:"mod_ssl~2.2.15~31.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
