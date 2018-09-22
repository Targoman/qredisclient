PRJDIR = $$PWD/../..//
include($$PRJDIR/qmake/configs.pri)
QT       += core network testlib

TARGET = tests
TEMPLATE = app

CONFIG += debug c++11
CONFIG-=app_bundle   

SRC_DIR = $$PRJDIR/src//

unix:!mac {
  DEFINES += INTEGRATION_TESTS SSH_TESTS QT_NO_DEBUG_OUTPUT  
}

unix:!mac {
    #code coverage
    QMAKE_CXXFLAGS += -g -fprofile-arcs -ftest-coverage -O0
    QMAKE_LFLAGS += -g -fprofile-arcs -ftest-coverage  -O0
    LIBS += -lgcov
}

include(redisclient-tests.pri)
include($$PRJDIR/3rdparty/3rdparty.pri)

UI_DIR = $$DESTDIR/ui
OBJECTS_DIR = $$DESTDIR/obj
MOC_DIR = $$DESTDIR/obj
RCC_DIR = $$DESTDIR/obj

RESOURCES += \
    $$PRJDIR/lua.qrc
