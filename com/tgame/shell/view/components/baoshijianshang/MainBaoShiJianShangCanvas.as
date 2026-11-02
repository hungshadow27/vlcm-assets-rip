package com.tgame.shell.view.components.baoshijianshang
{
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   
   public class MainBaoShiJianShangCanvas extends Sprite
   {
      
      private var lb:FLabel;
      
      private var timerTxt:FTextArea;
      
      private var baoShiBigIco:DisplayObject;
      
      private var tf:TextFormat = new TextFormat();
      
      private var timer:Timer = new Timer(1000);
      
      private var timerNum:int;
      
      public function MainBaoShiJianShangCanvas()
      {
         super();
         this.tf.size = 15;
         this.tf.bold = true;
         this.lb = new FLabel();
         this.lb.filters = StaticValue.filter;
         this.lb.textColor = StaticValue.YELLOW;
         this.lb.text = LanResManager.getLanCommonTextWords("下一轮开始时间：");
         this.lb.setTextFormat(this.tf);
         addChild(this.lb);
         this.lb = new FLabel();
         this.lb.y = 30;
         this.lb.filters = StaticValue.filter;
         this.lb.textColor = StaticValue.YELLOW;
         this.lb.text = LanResManager.getLanCommonTextWords("上一轮鉴宝结果：");
         this.lb.setTextFormat(this.tf);
         addChild(this.lb);
         this.timerTxt = new FTextArea();
         this.timerTxt.x = 185;
         this.timerTxt.y = 0;
         this.timerTxt.filters = StaticValue.filter;
         this.timerTxt.textColor = StaticValue.YELLOW;
         this.timerTxt.text = LanResManager.getLanCommonTextWords("分秒");
         this.timerTxt.setTextFormat(this.tf);
         addChild(this.timerTxt);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
      }
      
      public function showBaoShiIco(param1:int) : void
      {
         var _loc2_:Goods = null;
         var _loc3_:String = null;
         if(param1 == 0)
         {
            if(Boolean(this.baoShiBigIco) && Boolean(this.baoShiBigIco.parent))
            {
               this.baoShiBigIco.parent.removeChild(this.baoShiBigIco);
            }
         }
         else if(param1 != 0)
         {
            _loc2_ = new Goods(param1);
            _loc3_ = _loc2_.getBigICOPath();
            this.baoShiBigIco = FLoader.startLoad(_loc3_,30,30);
            this.baoShiBigIco.x = 202;
            this.baoShiBigIco.y = 27;
            addChild(this.baoShiBigIco);
         }
      }
      
      public function setTimer(param1:int) : void
      {
         this.timerNum = param1;
         this.timerTxt.text = Math.floor(this.timerNum / 1000 / 60) % 60 + LanResManager.getLanCommonTextWords("分") + Math.floor(this.timerNum / 1000 % 60) + LanResManager.getLanCommonTextWords("秒");
         this.timerTxt.setTextFormat(this.tf);
         if(this.timerNum >= 1000)
         {
            this.timer.reset();
            this.timer.start();
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this.timerNum -= 1000;
         if(this.timerNum <= 0)
         {
            this.timerNum = 0;
            this.timer.stop();
         }
         this.timerTxt.text = Math.floor(this.timerNum / 1000 / 60) % 60 + LanResManager.getLanCommonTextWords("分") + Math.floor(this.timerNum / 1000 % 60) + LanResManager.getLanCommonTextWords("秒");
         this.timerTxt.setTextFormat(this.tf);
      }
   }
}

