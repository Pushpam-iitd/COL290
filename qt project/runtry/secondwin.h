#ifndef SECONDWIN_H
#define SECONDWIN_H
#include "header1.h"
#include <QDialog>

extern int opmode;
extern   screen3Dfigure output3D;
extern int con;

extern input2D leinput1,leinput2,leinput3 ;

//extern int topnum,frontnum,sidenum;
namespace Ui {
class secondwin;
}

class secondwin : public QDialog
{
    Q_OBJECT

public:
    explicit secondwin(QWidget *parent = 0);
    ~secondwin();

private slots:
    void on_pushButton_clicked();

    void on_pushButton_2_clicked();

    void on_pushButton_3_clicked();

    void on_pushButton_4_clicked();

    void on_pushButton_5_clicked();

    void on_pushButton_6_clicked();

    void on_pushButton_7_clicked();

    void on_pushButton_8_clicked();

    //void on_lineEdit_returnPressed();

    //void on_lineEdit_2_returnPressed();

    //void on_lineEdit_3_returnPressed();

    void on_pushButton_11_clicked();

    void on_pushButton_9_clicked();

    void on_pushButton_10_clicked();

private:
    Ui::secondwin *ui;
};

#endif // SECONDWIN_H
