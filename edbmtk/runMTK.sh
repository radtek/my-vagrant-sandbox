# ----------------------------------------------------------------------------
# --
# -- Copyright (c) 2004-2017 - EnterpriseDB Corporation.  All Rights Reserved.
# --
# ----------------------------------------------------------------------------

export base="/usr/edb/migrationtoolkit"

. /etc/sysconfig/edb/migrationtoolkit/edb-migrationtoolkit-51.config
. $base/bin/runJavaApplication.sh

runJREApplication  \
 -Djava.security.egd=file:///dev/urandom \
 -Dprop=$base/etc/toolkit.properties \
 -jar $base/bin/edb-migrationtoolkit.jar \
  "$@"
