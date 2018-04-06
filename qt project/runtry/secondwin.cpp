#include "secondwin.h"
#include "ui_secondwin.h"
#include "header1.h"
#include <QFileDialog.h>
#include <opm1win2.h>
#include <iostream>
#include <cmath>
#include "openglwidget.h"
#include <QApplication>
#include <QPixmap>
//#include "gltry1.h"
#include "gltry2.h"
//hey

//hey
int topnum,frontnum,sidenum;
screen3Dfigure output3D;

input2D leinput1,leinput2,leinput3 ;

int rxi,ryi,rzi;

secondwin::secondwin(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::secondwin)
{
    ui->setupUi(this);

    QPixmap pix("C:/Users/Pushpam Anand/Desktop/qtpic.jpg");
    ui->label_pico->setPixmap(pix);


}

secondwin::~secondwin()
{
    delete ui;
}


void secondwin::on_pushButton_clicked()
{
    QString filename = QFileDialog::getOpenFileName(
                      this, tr("Open File"), "C://","Text File(*.txt);;All files(*.*);;"
                      );
    std::string l = filename.toLocal8Bit().constData();


//TOPVERTX
    topnum=leinput1.take2DInputVertices(&l);

        std::cout<<"piio "<<leinput1.arr2d[0].getx() << std::endl;
    //topnum=leinput1.checknuma(&l);

}

void secondwin::on_pushButton_2_clicked()
{
    QString filename = QFileDialog::getOpenFileName(
                      this, tr("Open File"), "C://","Text File(*.txt);;All files(*.*);;"
                      );
    std::string l = filename.toLocal8Bit().constData();


//topedge
    std::cout<<"b44 "<<leinput1.arr2d[0].getx() << std::endl;

    leinput1.takeInputEdges(&l);
    std::cout<<"aft444 "<<leinput1.arr2d[0].getx() << std::endl;

    std::cout<<"leinput "<<leinput1.arr2dedge[0][0] <<std::endl;
}

void secondwin::on_pushButton_3_clicked()
{
    QString filename = QFileDialog::getOpenFileName(
                      this, tr("Open File"), "C://","Text File(*.txt);;All files(*.*);;"
                      );
    std::string l = filename.toLocal8Bit().constData();


//FRONTVERTX
    frontnum=leinput2.take2DInputVertices(&l);
    //frontnum=leinput2.checknuma(&l);

}

void secondwin::on_pushButton_4_clicked()
{


        std::cout<<"yau "<<leinput1.arr2d[0].getx() << std::endl;


    QString filename = QFileDialog::getOpenFileName(
                      this, tr("Open File"), "C://","Text File(*.txt);;All files(*.*);;"
                      );
    std::string l = filename.toLocal8Bit().constData();
    std::cout<<"topver2222"<<std::endl;


//FRONTEDGE
    leinput2.takeInputEdges(&l);

//PRINT 3D VERTICES BY OPENGL HERE


}

//void secondwin::on_pushButton_5_clicked()
//{
//    opm1win2 opm1win22;
//    opm1win22.setModal(true);
//    opm1win22.exec();
//}

void secondwin::on_pushButton_5_clicked()
{
//    QApplication a();
//    OpenWidget ow;
//    ow.setTitle("3D isometric view");
//    ow.resize(640,640);
//    ow.show();
//    a.exec();

//    int main(int argc, char *argv[])
//    {
//        QApplication a(argc, argv);
//        MainWindow w;
//        w.setTitle("mera window");
//        w.resize(640,480);

//        w.show();

//        return a.exec();
//    }




        gltry1 push1;
        push1.setModal(true);
        push1.exec();

}

void secondwin::on_pushButton_6_clicked()
{

   // int rx =QInputDialog::getInt(this,"ye","wo");




    screen2Dfigure topinp , frontinp ,sideinp;



    memcpy(topinp.p2, leinput1.arr2d , sizeof(leinput1.arr2d));
        memcpy(topinp.adjacency_matrix2d,leinput1.arr2dedge , sizeof(leinput1.arr2dedge));

        std::cout<<"pau "<<topinp.p2[0].getx() << std::endl;


    //screen3Dfigure output3D;
    //memcpy(sc3d.p3, inp33.arr3d , sizeof(inp33.arr3d));
        memcpy(frontinp.p2, leinput2.arr2d , sizeof(leinput2.arr2d));
            memcpy(frontinp.adjacency_matrix2d,leinput2.arr2dedge , sizeof(leinput2.arr2dedge));
            std::cout<<"topver4444"<<std::endl;

//side vaali cheeze
            topinp.numa = topnum;
            sideinp.numa = sidenum;
            frontinp.numa = frontnum;

 //sIdEEDGE

      memcpy(sideinp.p2, leinput3.arr2d , sizeof(leinput3.arr2d));
      memcpy(sideinp.adjacency_matrix2d , leinput3.arr2dedge , sizeof(leinput3.arr2dedge));

                std::cout<<"numtopppa "<<topnum <<std::endl;
      std::cout<< "topinpnuma- "<<frontinp.numa<<std::endl;
      std::cout<<"topver.p2[0].getx- "<< topinp.p2[0].getx()<<std::endl;


            output3D= de3dfrom2d(topinp,frontinp,sideinp);


            //ROTATE in X
            float rxr = rxi*3.14159/180;
            float ryr = ryi*3.14159/180;
            float rzr = rzi*3.14159/180;

            std::cout<<"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ " <<rxi<< std::endl;
            std::cout<<"######################################################### " <<rxr<< std::endl;

            for(int i=0;i<sizeof(output3D.p3);i++){
            point3d temp;
            //temp.x = arr[i].x;
            temp.y = cos(rxr)*(output3D.p3[i].y)-(output3D.p3[i].z)*sin(rxr);
            temp.z = cos(rxr)*(output3D.p3[i].z)+(output3D.p3[i].y)*sin(rxr);
            output3D.p3[i].sety(temp.y);
            output3D.p3[i].setz(temp.z);
            }

            //ROTATE IN Y

            for(int i=0;i<sizeof(output3D.p3);i++){
            point3d temp;
            //temp.x = arr[i].x;
            temp.x = cos(ryr)*(output3D.p3[i].x)+(output3D.p3[i].z)*sin(ryr);
            temp.z = cos(ryr)*(output3D.p3[i].z)-(output3D.p3[i].x)*sin(ryr);
            output3D.p3[i].setx(temp.x);
            output3D.p3[i].setz(temp.z);


            }



            //ROTATE IN Z

            for(int i=0;i<sizeof(output3D.p3);i++){
            point3d temp;
            //temp.x = arr[i].x;
            temp.x = cos(rzr)*(output3D.p3[i].x)-(output3D.p3[i].y)*sin(rzr);
            temp.y = cos(rzr)*(output3D.p3[i].y)+(output3D.p3[i].x)*sin(rzr);
            output3D.p3[i].setx(temp.x);
            output3D.p3[i].sety(temp.y);


            }




            for(int kl=0;kl<8;kl++){
        std::cout<< output3D.p3[kl].getx()<<" "<<output3D.p3[kl].gety()<<" "<<output3D.p3[kl].getz()<<std::endl;
    }

                    std::cout<< "adj matr"<<std::endl;
            for(int kl=0;kl<8;kl++){
                for(int jk=0;jk<8;jk++){
              std::cout<< output3D.adjacency_matrix[kl][jk]<<" "<<std::endl;
                }
                    std::cout<<" "<<std::endl;
    }

}

void secondwin::on_pushButton_7_clicked()//take input side vertex
{
    QString filename = QFileDialog::getOpenFileName(
                      this, tr("Open File"), "C://","Text File(*.txt);;All files(*.*);;"
                      );
    std::string l = filename.toLocal8Bit().constData();


//sidevertex
    sidenum=leinput3.take2DInputVertices(&l);
        //sidenum=leinput3.checknuma(&l);
}

void secondwin::on_pushButton_8_clicked()
{
    QString filename = QFileDialog::getOpenFileName(
                      this, tr("Open File"), "C://","Text File(*.txt);;All files(*.*);;"
                      );
    std::string l = filename.toLocal8Bit().constData();


//sideedges
    leinput3.takeInputEdges(&l);
              std::cout<<"leinput3 "<<leinput3.arr2dedge[1][1] <<std::endl;
}

//void secondwin::on_lineEdit_returnPressed()
//{
//    QString rx = ui->lineEdit->text();
//    rxi = rx.toInt();


//}

//void secondwin::on_lineEdit_2_returnPressed()
//{
//    QString ry = ui->lineEdit_2->text();
//    ryi = ry.toInt();
//}

//void secondwin::on_lineEdit_3_returnPressed()
//{

//    QString rz = ui->lineEdit_3->text();
//    rzi = rz.toInt();
//}






void secondwin::on_pushButton_11_clicked()
{
     rxi =QInputDialog::getInt(this,"ye","wo");

     std::cout<<";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"<<rxi;;

}

void secondwin::on_pushButton_9_clicked()
{
     ryi =QInputDialog::getInt(this,"ye","wo");
}

void secondwin::on_pushButton_10_clicked()
{
    rzi =QInputDialog::getInt(this,"ye","wo");
}
