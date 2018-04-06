/********************************************************************************
** Form generated from reading UI file 'gltry1.ui'
**
** Created by: Qt User Interface Compiler version 5.8.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_GLTRY1_H
#define UI_GLTRY1_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QDialog>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>

QT_BEGIN_NAMESPACE

class Ui_gltry1
{
public:
    QLabel *label;

    void setupUi(QDialog *gltry1)
    {
        if (gltry1->objectName().isEmpty())
            gltry1->setObjectName(QStringLiteral("gltry1"));
        gltry1->resize(853, 423);
        label = new QLabel(gltry1);
        label->setObjectName(QStringLiteral("label"));
        label->setGeometry(QRect(340, 30, 181, 21));

        retranslateUi(gltry1);

        QMetaObject::connectSlotsByName(gltry1);
    } // setupUi

    void retranslateUi(QDialog *gltry1)
    {
        gltry1->setWindowTitle(QApplication::translate("gltry1", "Dialog", Q_NULLPTR));
        label->setText(QApplication::translate("gltry1", "ISOMETRIC VIEW 3D", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class gltry1: public Ui_gltry1 {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_GLTRY1_H
