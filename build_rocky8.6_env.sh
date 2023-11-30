dnf makecache
dnf install -y epel-release
dnf install -y libicu-devel pam-devel readline-devel libxml2-devel libxslt-devel openldap openldap-devel openldap-clients libuuid-devel xerces-c-devel bison flex gettext tcl-devel python3-devel perl-Test-Simple perl-DBD-Pg perl-ExtUtils-Embed perl-ExtUtils-MakeMaker zlib-devel krb5-devel krb5-workstation krb5-server lcov psmisc libaio-devel fuse-devel cmake wget perl-Pod-Html xz gcc-c++ globus-gssapi-gsi globus-gssapi-gsi-devel

# install zlog
cd /opt
wget https://github.com/HardySimpson/zlog/archive/refs/tags/1.2.16.tar.gz
tar xf 1.2.16.tar.gz
cd zlog-1.2.16/
make -j16 && make install

# install pfsd
cd /opt
wget https://github.com/ApsaraDB/PolarDB-FileSystem/archive/refs/tags/pfsd4pg-release-1.2.42-20220419.tar.gz
tar xf pfsd4pg-release-1.2.42-20220419.tar.gz
cd PolarDB-FileSystem-pfsd4pg-release-1.2.42-20220419/
./autobuild.sh
./install.sh

# install openssl
cd /opt
wget https://github.com/openssl/openssl/releases/download/OpenSSL_1_1_1w/openssl-1.1.1w.tar.gz
tar xf openssl-1.1.1w.tar.gz
cd openssl-1.1.1w/
./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl
make -j16 && make install

# install llvm11
cd /opt
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/llvm-project-11.0.0.tar.xz
tar xf llvm-project-11.0.0.tar.xz
cd llvm-project-11.0.0/
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_RTTI=ON -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi" -G "Unix Makefiles" ../llvm
make -j16 && make install

# install PolarDB for PostgreSQL
cd /opt
wget https://github.com/ApsaraDB/PolarDB-for-PostgreSQL/archive/refs/tags/v11.9.20.0.tar.gz
tar xf v11.9.20.0.tar.gz
cd PolarDB-for-PostgreSQL-11.9.20.0/
mkdir /tmp/polardb_build
./polardb_build.sh --basedir=/tmp/polardb_build --with-pfsd --withpx --noinit
