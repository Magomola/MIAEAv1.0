//--Collecting data accross the last year

#include <Trade\Trade.mqh>
#include <Trade\AccountInfo.mqh>
#define magic_number = 256122;
CTrade msafwa;
CAccountInfo a_info;
CPositionInfo p_info;



void OnTick(){
//
bool waue = false;








int nne = 4;//--previous candle
   datetime t4 = iTime(Symbol(),Period(),nne);//--The opening time of the candle
   double o4 = iOpen(Symbol(),Period(),nne);//--The open price of the very current candle
   double c4 = iClose(Symbol(),Period(),nne);//--The current price of the symbol until
   double h4 = iHigh(Symbol(),Period(),nne);//--The highest price of the current candle
   double l4 = iLow(Symbol(),Period(),nne);//--Lowest price of the current candle
   double crt4 = h4-l4;


int tatu3 = 3;//--previous candle
   datetime t3 = iTime(Symbol(),Period(),tatu3);//--The opening time of the candle
   double o3 = iOpen(Symbol(),Period(),tatu3);//--The open price of the very current candle
   double c3 = iClose(Symbol(),Period(),tatu3);//--The current price of the symbol until
   double h3 = iHigh(Symbol(),Period(),tatu3);//--The highest price of the current candle
   double l3 = iLow(Symbol(),Period(),tatu3);//--Lowest price of the current candle
   double crt3 = h3-l3;



int mbili = 2;//--previous candle
   datetime t1 = iTime(Symbol(),Period(),mbili);//--The opening time of the candle
   double o1 = iOpen(Symbol(),Period(),mbili);//--The open price of the very current candle
   double c1 = iClose(Symbol(),Period(),mbili);//--The current price of the symbol until
   double h1 = iHigh(Symbol(),Period(),mbili);//--The highest price of the current candle
   double l1 = iLow(Symbol(),Period(),mbili);//--Lowest price of the current candle
   double candle1= h1-l1;//The candle before doji



int zero = 1;//--previous candle
   datetime tt = iTime(Symbol(),Period(),zero);//--The opening time of the candle
   double oo = iOpen(Symbol(),Period(),zero);//--The open price of the very current candle
   double cc = iClose(Symbol(),Period(),zero);//--The current price of the symbol until
   double hh = iHigh(Symbol(),Period(),zero);//--The highest price of the current candle
   double ll = iLow(Symbol(),Period(),zero);//--Lowest price of the current candle
//---//--- 
   double bei = iClose(Symbol(),PERIOD_CURRENT,0);
   double juju = iHigh(Symbol(),PERIOD_CURRENT,0);
  // --bullish doji
   double kichwaB = hh-cc;
   double mkiaB = ll-oo;
   double mwiliB = cc-oo;
   double dojiB = hh-ll;
   
   
  //--bearish doji
  double kichwaS = cc-ll;
  double mkiaS = hh-oo;
  double mwiliS = oo-cc;
  double dojiS = hh-ll;
  
  //monitoring the useful doji parameters
 //  Comment("cc ",cc);
//   Comment("\nkichwa ",kichwa);

//Declaration of our useful metric   
int uzito;
int wepesi;

uzito=0;
wepesi =0;
//--In order to buy
//--3&2 CANDLES must be bearish
 if((c3<o3)&&(c1<o1)){
  uzito=uzito+1;
 }
 
//--CANDLE4 must be above candle1
 if(l4>hh){
  uzito=uzito+1;
 }  
 
//--CANDLE1 must not touch the 50% of CANDLE2
//Declaring 50% of candle2
 double eq = (candle1/2)+l1;
 if(hh<eq){
  uzito=uzito+1;
 }
 
 //Finally, candle1 must be bullish
 if(cc>oo)
   {
    uzito=uzito+1;
   }
 
 //Entering a trade
 
//--In order to sell
//--3&2 CANDLES must be bullish
 if((c3>o3)&&(c1>o1)){
  wepesi = wepesi +1;
 }
 
//--CANDLE4 must be below candle1
 if(h4<ll){
  wepesi = wepesi +1;
 }  
 
//--CANDLE1 must not touch the 50% of CANDLE2
//Declaring 50% of candle2
// double eq = (candle1/2)+l1;
 if(ll>eq){
  wepesi = wepesi +1;
 }
 
 //Finally, candle1 must be bullish
 if(cc<oo)
   {
    wepesi = wepesi +1;
   }
 
 //Entering a trade
 
 
 //--position management GOING LONG
 double ingioB = oo;
 double tp1 = eq;//must reach the 50%
 double tp2 = h1;//CRT's high
 double tp3 = l4;//filling the fvg
 double tp4 = h3;//balancing the imbalance
 double sl  = ll;
 
 //--position management GOING LONG
 double ingioS = oo;
 double tp2S = l1;// CRT's low
 double tp3S = h4;//filling the fvg
 double tp4s = l3;//balancing the imbalance
 double sls = hh;
 
 
//   

//
//MqlTradeRequest req;
//  {
//   ENUM_TRADE_REQUEST_ACTIONS    action = TRADE_ACTION_DEAL ;           // Trade operation type 
//   ulong                         magic = 256122 ;            // Expert Advisor ID (magic number) 
//   ulong                         order;            // Order ticket 
//   string                        symbol=Symbol();           // Trade symbol 
//   double                        volume = 0.5;           // Requested volume for a deal in lots 
//   double                        price = entry;            // Price 
//   double                        stoplimit;        // StopLimit level of the order 
//   double                        sl=hasara;               // Stop Loss level of the order 
//   double                        tp=tp1;               // Take Profit level of the order 
//   ulong                         deviation=15;        // Maximal possible deviation from the requested price 
//   ENUM_ORDER_TYPE               type = ORDER_TYPE_BUY;             // Order type 
//   ENUM_ORDER_TYPE_FILLING       type_filling = ORDER_FILLING_FOK;     // Order execution type 
//   ENUM_ORDER_TYPE_TIME          type_time;        // Order expiration type 
//   datetime                      expiration;       // Order expiration time (for the orders of ORDER_TIME_SPECIFIED type) 
//   string                        comment;          // Order comment 
//   ulong                         position;         // Position ticket 
//   ulong                         position_by;      // The ticket of an opposite position 
//   
//   
//  };
// Comment("",uzito);  
// 
//MqlTradeResult res;
//{
//uint     retcode;          // Operation return code 
//   ulong    deal;             // Deal ticket, if it is performed 
//   ulong    order;            // Order ticket, if it is placed 
//   double   volume;           // Deal volume, confirmed by broker 
//   double   price;            // Deal price, confirmed by broker 
//   double   bid;              // Current Bid price 
//   double   ask;              // Current Ask price 
//   string   comment;          // Broker comment to operation (by default it is filled by description of trade server return code) 
//   uint     request_id;       // Request ID set by the terminal during the dispatch  
//   int      retcode_external; // Return code of an external trading system 
//
//
//};
//ulong cv = msafwa.RequestDeviation();
////Comment("",cv);
//   ulong dev_points;
   bool waite = false;
   //bool waite = msafwa.Buy(0.5,Symbol(),ingioB,sl,tp1);
  //bool bm = PositionSelect(Symbol());
  //Comment("",msafwa.CheckResultEquity());
   if(uzito==4)
      {
       
      
      msafwa.Buy(0.005,Symbol(),ingioB,sl,tp4);
      double res_price = msafwa.ResultPrice();
      ulong res_tiketi = msafwa.ResultOrder();
      
      p_info.Select(Symbol());
      double fltp= p_info.Profit();
      if(fltp==13)
        {
         msafwa.PositionClose(Symbol(),-1);
        }



//      if(bei==(eq-1))
//        {
//         msafwa.PositionModify(Symbol(),res_price,tp2);
//        }
//      if(bei==(tp2-3))
//        {
//         msafwa.PositionModify(Symbol(),eq,tp3);
//        }
//      if(bei==(tp3-5))
//        {
//         msafwa.PositionModify(Symbol(),tp2,tp4);
//        }
//      if(bei==(tp4-4))
//        {
//         msafwa.PositionModify(Symbol(),ll,(bei+300));
//        }
//      
      }    
//
//   Comment("",);  
//   
  if(wepesi==4)
    {
         msafwa.Sell(0.005,Symbol(),ingioS,sls,tp4s);
      double res_price = msafwa.ResultPrice();
      ulong res_tiketi = msafwa.ResultOrder();
//      if(bei==(eq+1))
//        {
//         msafwa.PositionModify(Symbol(),res_price,tp2S);
//        }
//      if(bei==(tp2S+3))
//        {
//         msafwa.PositionModify(Symbol(),eq,tp3S);
//        }
//      if(bei==(tp3S+5))
//        {
//         msafwa.PositionModify(Symbol(),tp2S,tp4s);
//        }
//      if(bei==(tp4s+4))
//        {
//         msafwa.PositionModify(Symbol(),hh,(bei+300));
//        }
//      
    
    
    
    
     }
//  
//  int orders_total = OrdersTotal();
//  Comment("",orders_total);
//  
   }//--end of programm
   
  