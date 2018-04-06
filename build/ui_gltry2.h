/********************************************************************************
** Form generated from reading UI file 'gltry2.ui'
**
** Created by: Qt User Interface Compiler version 5.8.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_GLTRY2_H
#define UI_GLTRY2_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QDialog>
#include <QtWidgets/QHeaderView>

QT_BEGIN_NAMESPACE

class Ui_gltry2
{
public:

    void setupUi(QDialog *gltry2)
    {
        if (gltry2->objectName().isEmpty())
            gltry2->setObjectName(QStringLiteral("gltry2"));
        gltry2->resize(400, 300);

        retranslateUi(gltry2);

        QMetaObject::connectSlotsByName(gltry2);
    } // setupUi

    void retranslateUi(QDialog *gltry2)
    {
        gltry2->setWindowTitle(QApplication::translate("gltry2", "Dialog", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class gltry2: public Ui_gltry2 {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_GLTRY2_H
