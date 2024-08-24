#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "miaeainv@gmail.com"
#property version   "1.00"

#include <Trade\Trade.mqh>
#include <Controls\Button.mqh>
#include <Charts\Chart.mqh>


input double lot; 

CTrade c_trade;
CButton btnbuy;
CButton btnsell;
CButton btnclose;
CButton tfh;
CButton tfl;
CChart c_chart;



#define BUTTON_BUY "btn buy"
#define BUTTON_CLOSE "btn close"
#define BUTTON_SELL "btn sell"
#define BUTTON_TFH "btn TF up"
#define BUTTON_TFL "btn TF down"




int OnInit()
  {
  bool btns = btnsell.Create(0,BUTTON_BUY,0,50,50,200,80);   
   bool btnb = btnbuy.Create(0,BUTTON_SELL,0,50,80,200,110);
    bool btnc = btnclose.Create(0,BUTTON_CLOSE,0,50,110,200,140);
  if((btnb&&btns&&btnc)==false)
    {
     Print("buttons were NOT successful created!");
    }
    else
      {
       Print("Buttons were successful created!");
      }
   btntf();
   
  
   btnbuy.ColorBackground(clrBlue);
   btnsell.ColorBackground(clrDarkGreen);
   btnclose.ColorBackground(clrGray);
  
  
  
   return(INIT_SUCCEEDED);
  }
void OnDeinit(const int reason)
  {
   //c_button.Destroy(reason);
  
  }
void OnTick()
  {
   if(tfh.Pressed())
     {
      if(Period()==PERIOD_H1)
        {
         c_chart.SetSymbolPeriod(NULL,PERIOD_M15);
        }
      
      
     }
  
  
  
  
  
  
  
  
  
  }//end of onTick()
  
  
bool btntf()
{
  bool kweli;
  bool btn1 = tfl.Create(0,BUTTON_TFL,0,250,50,265,80);
  bool btn2 = tfh.Create(0,BUTTON_TFH,0,265,50,280,80);
  
  kweli = btn1&&btn2;
  
  bool clr1 = tfh.ColorBackground(clrDarkRed);
  bool clr2 = tfl.ColorBackground(clrYellow);
  
  kweli = kweli && (clr1&&clr2);
  
  if(!kweli)
    {
     Print("TF buttons were not created!");
    }
  else
    {
     Print("TF buttons were successful created!");
    }



return kweli;
}