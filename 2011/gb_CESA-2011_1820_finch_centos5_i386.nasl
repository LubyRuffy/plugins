###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for finch CESA-2011:1820 centos5 i386
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL", value:"http://lists.centos.org/pipermail/centos-announce/2011-December/018325.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881055");
  script_version("$Revision: 14222 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-15 13:50:48 +0100 (Fri, 15 Mar 2019) $");
  script_tag(name:"creation_date", value:"2011-12-16 11:10:17 +0530 (Fri, 16 Dec 2011)");
  script_xref(name:"CESA", value:"2011:1820");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2011-4601", "CVE-2011-4602", "CVE-2011-4603");
  script_name("CentOS Update for finch CESA-2011:1820 centos5 i386");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'finch'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms", re:"ssh/login/release=CentOS5");
  script_tag(name:"affected", value:"finch on CentOS 5");
  script_tag(name:"insight", value:"Pidgin is an instant messaging program which can log in to multiple
  accounts on multiple instant messaging networks simultaneously.

  An input sanitization flaw was found in the way the AOL Open System for
  Communication in Realtime (OSCAR) protocol plug-in in Pidgin, used by the
  AOL ICQ and AIM instant messaging systems, escaped certain UTF-8
  characters. A remote attacker could use this flaw to crash Pidgin via a
  specially-crafted OSCAR message. (CVE-2011-4601)

  An input sanitization flaw was found in the way the Pidgin SILC (Secure
  Internet Live Conferencing) protocol plug-in escaped certain UTF-8
  characters in channel messages. A remote attacker could use this flaw to
  crash Pidgin via a specially-crafted SILC message. (CVE-2011-4603)

  Multiple NULL pointer dereference flaws were found in the Jingle extension
  of the Extensible Messaging and Presence Protocol (XMPP) protocol plug-in
  in Pidgin. A remote attacker could use these flaws to crash Pidgin via a
  specially-crafted Jingle multimedia message. (CVE-2011-4602)

  Red Hat would like to thank the Pidgin project for reporting these issues.
  Upstream acknowledges Evgeny Boger as the original reporter of
  CVE-2011-4601, Diego Bauche Madero from IOActive as the original reporter
  of CVE-2011-4603, and Thijs Alkemade as the original reporter of
  CVE-2011-4602.

  All Pidgin users should upgrade to these updated packages, which contain
  backported patches to resolve these issues. Pidgin must be restarted for
  this update to take effect.");
  script_tag(name:"solution", value:"Please install the updated packages.");
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

  if ((res = isrpmvuln(pkg:"finch", rpm:"finch~2.6.6~5.el5_7.4", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"finch-devel", rpm:"finch-devel~2.6.6~5.el5_7.4", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple", rpm:"libpurple~2.6.6~5.el5_7.4", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-devel", rpm:"libpurple-devel~2.6.6~5.el5_7.4", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-perl", rpm:"libpurple-perl~2.6.6~5.el5_7.4", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-tcl", rpm:"libpurple-tcl~2.6.6~5.el5_7.4", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin", rpm:"pidgin~2.6.6~5.el5_7.4", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin-devel", rpm:"pidgin-devel~2.6.6~5.el5_7.4", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin-perl", rpm:"pidgin-perl~2.6.6~5.el5_7.4", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
