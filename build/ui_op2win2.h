/********************************************************************************
** Form generated from reading UI file 'op2win2.ui'
**
** Created by: Qt User Interface Compiler version 5.8.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_OP2WIN2_H
#define UI_OP2WIN2_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QDialog>
#include <QtWidgets/QFrame>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>

QT_BEGIN_NAMESPACE

class Ui_op2win2
{
public:
    QLabel *label;
    QLabel *label_2;
    QLabel *label_3;
    QFrame *line;
    QFrame *line_2;

    void setupUi(QDialog *op2win2)
    {
        if (op2win2->objectName().isEmpty())
            op2win2->setObjectName(QStringLiteral("op2win2"));
        op2win2->resize(885, 528);
        label = new QLabel(op2win2);
        label->setObjectName(QStringLiteral("label"));
        label->setGeometry(QRect(80, 10, 171, 31));
        label_2 = new QLabel(op2win2);
        label_2->setObjectName(QStringLiteral("label_2"));
        label_2->setGeometry(QRect(80, 490, 161, 21));
        label_3 = new QLabel(op2win2);
        label_3->setObjectName(QStringLiteral("label_3"));
        label_3->setGeometry(QRect(600, 280, 161, 31));
        line = new QFrame(op2win2);
        line->setObjectName(QStringLiteral("line"));
        line->setGeometry(QRect(430, 10, 20, 511));
        line->setFrameShape(QFrame::VLine);
        line->setFrameShadow(QFrame::Sunken);
        line_2 = new QFrame(op2win2);
        line_2->setObjectName(QStringLiteral("line_2"));
        line_2->setGeometry(QRect(20, 260, 411, 16));
        line_2->setFrameShape(QFrame::HLine);
        line_2->setFrameShadow(QFrame::Sunken);

        retranslateUi(op2win2);

        QMetaObject::connectSlotsByName(op2win2);
    } // setupUi

    void retranslateUi(QDialog *op2win2)
    {
        op2win2->setWindowTitle(QApplication::translate("op2win2", "Dialog", Q_NULLPTR));
        label->setText(QApplication::translate("op2win2", "TOP VIEW", Q_NULLPTR));
        label_2->setText(QApplication::translate("op2win2", "FRONT VIEW", Q_NULLPTR));
        label_3->setText(QApplication::translate("op2win2", "SIDE VIEW", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class op2win2: public Ui_op2win2 {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_OP2WIN2_H
