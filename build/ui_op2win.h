/********************************************************************************
** Form generated from reading UI file 'op2win.ui'
**
** Created by: Qt User Interface Compiler version 5.8.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_OP2WIN_H
#define UI_OP2WIN_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QDialog>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QPushButton>

QT_BEGIN_NAMESPACE

class Ui_op2win
{
public:
    QPushButton *pushButton;
    QPushButton *pushButton_2;
    QPushButton *pushButton_3;

    void setupUi(QDialog *op2win)
    {
        if (op2win->objectName().isEmpty())
            op2win->setObjectName(QStringLiteral("op2win"));
        op2win->resize(601, 421);
        pushButton = new QPushButton(op2win);
        pushButton->setObjectName(QStringLiteral("pushButton"));
        pushButton->setGeometry(QRect(40, 230, 93, 28));
        pushButton_2 = new QPushButton(op2win);
        pushButton_2->setObjectName(QStringLiteral("pushButton_2"));
        pushButton_2->setGeometry(QRect(380, 230, 93, 28));
        pushButton_3 = new QPushButton(op2win);
        pushButton_3->setObjectName(QStringLiteral("pushButton_3"));
        pushButton_3->setGeometry(QRect(162, 317, 211, 51));

        retranslateUi(op2win);

        QMetaObject::connectSlotsByName(op2win);
    } // setupUi

    void retranslateUi(QDialog *op2win)
    {
        op2win->setWindowTitle(QApplication::translate("op2win", "Dialog", Q_NULLPTR));
        pushButton->setText(QApplication::translate("op2win", "3Dvertex", Q_NULLPTR));
        pushButton_2->setText(QApplication::translate("op2win", "3Dedges", Q_NULLPTR));
        pushButton_3->setText(QApplication::translate("op2win", "CONVERT NOW!", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class op2win: public Ui_op2win {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_OP2WIN_H
