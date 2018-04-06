#-------------------------------------------------
#
# Project created by QtCreator 2018-03-31T10:42:54
#
#-------------------------------------------------

QT       += core gui opengl
LIBS += -lopengl32 -glu32

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = runtry
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


SOURCES += main.cpp\
        mainwindow.cpp \
    func2.cpp \
    secondwin.cpp \
    op2win.cpp \
    op2win2.cpp \
    gltry1.cpp \
    gltry2.cpp

HEADERS  += mainwindow.h \
    header1.h \
    secondwin.h \
    op2win.h \
    op2win2.h \
    gltry1.h \
    gltry2.h

FORMS    += mainwindow.ui \
    secondwin.ui \
    op2win.ui \
    op2win2.ui \
    gltry1.ui \
    gltry2.ui
