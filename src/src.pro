QT       += core network
QT       -= gui

TEMPLATE = lib
CONFIG += staticlib
TARGET = qredisclient

PRJDIR    = ..
include($$PRJDIR/qmake/configs.pri)

DEPENDPATH += $$PRJDIR/3rdparty

SOURCES  += $$PRJDIR/3rdparty/hiredis/read.c \
            $$PRJDIR/3rdparty/hiredis/sds.c
SUBMODULE_HEADERS  += $$PRJDIR/3rdparty/hiredis/read.h \
                      $$PRJDIR/3rdparty/hiredis/sds.h \
                      $$PRJDIR/3rdparty/hiredis/sds.h \
                      $$PRJDIR/3rdparty/hiredis/sds.h \

include($$PRJDIR/3rdparty/qsshclient/qsshclient.pri)

DIST_HEADERS += \
    QRedisClient/*.h \
    QRedisClient/transporters/*.h \
    QRedisClient/utils/*.h \

SOURCES += \
    QRedisClient/*.cpp \
    QRedisClient/transporters/*.cpp \
    QRedisClient/utils/*.cpp \

RESOURCES += \
    $$PRJDIR/lua.qrc

HEADERS += $$DIST_HEADERS \
        $$PRIVATE_HEADERS \
        $$SUBMODULE_HEADERS

include($$PRJDIR/qmake/install.pri)
