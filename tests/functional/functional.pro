PRJDIR = $$PWD/../../
include($$PRJDIR/qmake/configs.pri)
include(../qmake/configs.pri)
QT       += core network

TARGET = qredis-runner
TEMPLATE = app

CONFIG += debug console
CONFIG-=app_bundle

DEFINES += QT_NO_DEBUG_OUTPUT

SOURCES += main.cpp

LIBS+= -lqredisclient

win32-msvc* {
    win32-msvc2015 {
        message("msvc2015 detected")
        WIN_DEPS_VERSION = v140
    } else {
        error("Your msvc version is not suppoted. qredisclient requires msvc2015")
    }

    LIBSSH_LIB_PATH = $$PWD/libssh2/build/src/release

    defined(OPENSSL_STATIC) {
      OPENSSL_LIB_PATH = C:\OpenSSL-Win32\lib\VC\static
    } else {
      OPENSSL_LIB_PATH = C:\OpenSSL-Win32\lib\VC
    }

    LIBS += -L$$LIBSSH_LIB_PATH -L$$OPENSSL_LIB_PATH -llibssh2 -llibeay32MD -lgdi32 -lws2_32 -lkernel32 -luser32 -lshell32 -luuid -lole32 -ladvapi32
} else {

   exists( $$PWD/libssh2/bin/src/libssh2.a ) {
      LIBS += $$PWD/libssh2/bin/src/libssh2.a
   } else {
      LIBS += -lssh2
   }

   LIBS += -lz -lssl -lcrypto

   unix:mac {
      INCLUDEPATH += /usr/local/opt/openssl/include
      LIBS += -L/usr/local/opt/openssl/lib
   } else {
      INCLUDEPATH += /usr/local/include/
   }
}
