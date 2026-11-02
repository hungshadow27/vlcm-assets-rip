package com.tgame.shell.view.components.zunrongwanbaoge
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class WanbaogeRongyaoHuiguiPanel extends FPanel
   {
      
      public static const UI_JINRUWANBAOGE_CLICK:String = "UI_JINRUWANBAOGE_CLICK";
      
      public static const UI_WANGBAOGE_JIFENDUIHUAN_CLICK:String = "UI_WANGBAOGE_JIFENDUIHUAN_CLICK";
      
      private var lb:FLabel;
      
      private var tf:TextFormat = new TextFormat();
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var ft4:FTextArea;
      
      private var ft5:FTextArea;
      
      private var ft6:FTextArea;
      
      private var jinruBtn:SecondButton;
      
      private var jinfen:FTextArea;
      
      private var jinfenNum:FTextArea;
      
      private var duiHuanBtn:SecondButton;
      
      public function WanbaogeRongyaoHuiguiPanel()
      {
         var _loc1_:DisplayObject = null;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 543;
         height = 435;
         this.titleText = LanResManager.getLanCommonTextWords("万宝阁荣耀回归");
         this.addEventListener(FCloseEvent.CLOSE,this.onClose);
         _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zunrongwanbaoge/bg.swf");
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         this.tf.size = 15;
         this.lb = new FLabel();
         this.lb.filters = StaticValue.filter;
         this.lb.textColor = StaticValue.ORANGE;
         this.lb.autoSize = TextFieldAutoSize.LEFT;
         this.lb.text = LanResManager.getLanCommonTextWords("万众瞩目，万宝阁荣耀回归");
         this.lb.x = (width - this.lb.width) / 2;
         this.lb.y = 159;
         this.lb.setTextFormat(this.tf);
         addChild(this.lb);
         this.ft1 = new FTextArea();
         this.ft1.x = 10 + 15 + 5;
         this.ft1.y = 183;
         this.ft1.textColor = StaticValue.GREEN;
         this.ft1.filters = StaticValue.filter;
         this.ft1.autoSize = TextFieldAutoSize.LEFT;
         this.ft1.htmlText = LanResManager.getLanCommonTextWords("开放时间：每天11:00-12:00、18:00-19:00、22:00-23:00（玩家可提前10分钟入场）。");
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         this.ft2.x = 10 + 15 + 5;
         this.ft2.y = 183 + 14 + 10;
         this.ft2.textColor = StaticValue.GREEN;
         this.ft2.filters = StaticValue.filter;
         this.ft2.width = 597;
         this.ft2.height = 35;
         this.ft2.multiline = true;
         this.ft2.wordWrap = true;
         this.ft2.htmlText = LanResManager.getLanCommonTextWords("鉴宝规则：");
         addChild(this.ft2);
         this.ft6 = new FTextArea();
         this.ft6.x = 70 + 15 + 5;
         this.ft6.y = 183 + 14 + 10;
         this.ft6.textColor = StaticValue.GREEN;
         this.ft6.filters = StaticValue.filter;
         this.ft6.width = 421;
         this.ft6.height = 35;
         this.ft6.multiline = true;
         this.ft6.wordWrap = true;
         this.ft6.htmlText = LanResManager.getLanCommonTextWords("进入万宝阁后使用通天鉴进行下注，然后等待矿石刷出，击碎矿石，当出现的宝石与所下注的宝石相同时，获得积分。");
         addChild(this.ft6);
         this.ft3 = new FTextArea();
         this.ft3.x = 10 + 15 + 5;
         this.ft3.y = 183 + 14 + 14 + 16 + 20;
         this.ft3.textColor = StaticValue.GREEN;
         this.ft3.filters = StaticValue.filter;
         this.ft3.autoSize = TextFieldAutoSize.LEFT;
         this.ft3.text = LanResManager.getLanCommonTextWords("积分兑换：");
         addChild(this.ft3);
         this.ft4 = new FTextArea();
         this.ft4.x = 15;
         this.ft4.y = 183 + 14 + 14 + 14 + 16 + 30;
         this.ft4.filters = StaticValue.filter;
         this.ft4.autoSize = TextFieldAutoSize.LEFT;
         this.ft4.htmlText = "<font color=\'" + StaticValue.GOLD_HTML + "\'>" + LanResManager.getLanCommonTextWords("超级VIP(月卡)！") + "</font>" + "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanCommonTextWords("七彩传奇套装！") + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("轩辕天剑！") + "</font>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("轩辕地剑！") + "</font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("轩辕人剑！") + "</font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("傲剑碎片！") + "</font>";
         this.ft4.setTextFormat(this.tf);
         addChild(this.ft4);
         this.ft5 = new FTextArea();
         this.ft5.x = 10 + 15 + 5;
         this.ft5.y = 295;
         this.ft5.textColor = StaticValue.WHITE;
         this.ft5.filters = StaticValue.filter;
         this.ft5.width = 480;
         this.ft5.height = 80;
         this.ft5.multiline = true;
         this.ft5.wordWrap = true;
         this.ft5.htmlText = LanResManager.getLanCommonTextWords("注意：进入尊荣万宝阁需要持有万宝券，进入后，所有玩家属性将统一，并禁用所有武功。玩家死亡时将会消耗一枚万宝券并掉落一个战利品，所携带万宝券为0时将被传出万宝阁，活动结束后，拾取战利品最多的玩家将获得额外的万宝积分奖励。每1000个战利品可以在积分兑换面板兑换一个通天鉴。");
         addChild(this.ft5);
         this.duiHuanBtn = new SecondButton();
         this.duiHuanBtn.label = LanResManager.getLanCommonTextWords("万宝积分兑换");
         addChild(this.duiHuanBtn);
         this.duiHuanBtn.x = 80;
         this.duiHuanBtn.y = 435 - this.duiHuanBtn.height - 45;
         this.duiHuanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jinruBtn = new SecondButton();
         this.jinruBtn.label = LanResManager.getLanCommonTextWords("进入万宝阁");
         addChild(this.jinruBtn);
         this.jinruBtn.x = (543 - this.jinruBtn.width) / 2;
         this.jinruBtn.y = 435 - this.jinruBtn.height - 45;
         this.jinruBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jinfen = new FTextArea();
         this.jinfen.x = 543 - this.jinfen.width - 100 + 35;
         this.jinfen.y = 435 - this.jinfen.height + 37;
         this.jinfen.textColor = StaticValue.WHITE;
         this.jinfen.filters = StaticValue.filter;
         this.jinfen.text = LanResManager.getLanCommonTextWords("我的万宝积分:");
         addChild(this.jinfen);
         this.jinfenNum = new FTextArea();
         this.jinfenNum.x = 543 - this.jinfenNum.width - 20 + 35;
         this.jinfenNum.y = 435 - this.jinfenNum.height + 37;
         this.jinfenNum.textColor = StaticValue.WHITE;
         this.jinfenNum.filters = StaticValue.filter;
         this.jinfenNum.text = "999999999";
         addChild(this.jinfenNum);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.jinruBtn:
               this.dispatchEvent(new BaseEvent(UI_JINRUWANBAOGE_CLICK));
               break;
            case this.duiHuanBtn:
               this.dispatchEvent(new BaseEvent(UI_WANGBAOGE_JIFENDUIHUAN_CLICK));
         }
      }
      
      public function setBtn(param1:Boolean) : void
      {
         if(param1)
         {
            this.jinruBtn.label = LanResManager.getLanCommonTextWords("进入万宝阁");
            this.jinruBtn.enabled = true;
         }
         else
         {
            this.jinruBtn.label = LanResManager.getLanCommonTextWords("暂未开放");
            this.jinruBtn.enabled = false;
         }
      }
      
      public function setJifenNum(param1:int) : void
      {
         this.jinfenNum.text = String(param1);
      }
   }
}

