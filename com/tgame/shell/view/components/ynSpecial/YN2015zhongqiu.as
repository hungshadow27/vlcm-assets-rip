package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class YN2015zhongqiu extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var ftScore:FTextArea;
      
      private var btn1:SecondButton;
      
      private var btn2:SecondButton;
      
      private var btn3:SecondButton;
      
      private var btn4:SecondButton;
      
      private var btnRank:SecondButton;
      
      public function YN2015zhongqiu()
      {
         super();
         width = 620;
         height = 585;
         dragAble = true;
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         titleText = LanResManager.getLanCommonTextWords("领取灯谜");
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc3_:ItemFace = null;
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/1song1.swf");
         _loc1_.x = 9;
         _loc1_.y = 0;
         addChild(_loc1_);
         this.ft = new FTextArea();
         this.ft.x = 35;
         this.ft.y = 10;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("【时间】");
         this.ft.width = 120;
         this.ft.height = 22;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 35;
         this.ft.y = 30;
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("提交时间：");
         this.ft.width = 120;
         this.ft.height = 22;
         this.ft = new FTextArea();
         this.ft.x = 35;
         this.ft.y = 30;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("每天从9月18号（0点） 到 9月24号（ 21点）");
         this.ft.width = 300;
         this.ft.height = 22;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 35;
         this.ft.y = 50;
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("领取奖励时间：");
         this.ft.width = 120;
         this.ft.height = 22;
         this.ft = new FTextArea();
         this.ft.x = 125 + 20;
         this.ft.y = 50;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("每天从9月18号（21点30）到 9月24号（ 23点59分）");
         this.ft.width = 300;
         this.ft.height = 22;
         this.ft = new FTextArea();
         this.ft.x = 35;
         this.ft.y = 70;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("【内容】");
         this.ft.width = 120;
         this.ft.height = 22;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 35;
         this.ft.y = 85;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("越南中秋节内容");
         this.ft.width = 400;
         this.ft.wordWrap = true;
         this.ft.height = 40;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 35;
         this.ft.y = 125;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("【中秋领取灯谜】");
         this.ft.width = 120;
         this.ft.height = 22;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 35;
         this.ft.y = 145;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("在活动之间, ") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家充值1元宝，") + "" + LanResManager.getLanCommonTextWords("从这个面板") + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("系统将会送给1 点中秋.") + "</font><br>" + LanResManager.getLanCommonTextWords("用“1点中秋”可以购买灯谜，然后把“灯谜”提交给NPC 秋香.") + "<br>" + LanResManager.getLanCommonTextWords("玩家提交不同数量将会获得不同奖励.") + "<br>" + LanResManager.getLanCommonTextWords("如玩家提交很高数量将会获得特别奖励.");
         this.ft.width = 400;
         this.ft.height = 90;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 80;
         this.ft.y = 230;
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("目前拥有的中秋值：");
         this.ft.width = 300;
         this.ft.height = 22;
         addChild(this.ft);
         this.ftScore = new FTextArea();
         this.ftScore.x = 430 + 50;
         this.ftScore.y = 230;
         this.ftScore.textColor = StaticValue.ORANGE;
         this.ftScore.htmlText = "0";
         this.ftScore.width = 120;
         this.ftScore.height = 22;
         addChild(this.ftScore);
         var _loc2_:Goods = new Goods(709178);
         this.ft = new FTextArea();
         this.ft.x = 55;
         this.ft.y = 265;
         this.ft.textColor = StaticValue.GREEN;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("用100点中秋点兑换") + "       <font color=\'" + StaticValue.YELLOW_HTML + "\'>" + _loc2_.res.name + "*1</font>";
         this.ft.width = 400;
         this.ft.height = 22;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 55;
         this.ft.y = 310;
         this.ft.textColor = StaticValue.GREEN;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("用1000点中秋点兑换") + "      <font color=\'" + StaticValue.YELLOW_HTML + "\'>" + _loc2_.res.name + "*10</font>";
         this.ft.width = 400;
         this.ft.height = 22;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 55;
         this.ft.y = 355;
         this.ft.textColor = StaticValue.GREEN;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("用10000点中秋点兑换") + "      <font color=\'" + StaticValue.YELLOW_HTML + "\'>" + _loc2_.res.name + "*100</font>";
         this.ft.width = 400;
         this.ft.height = 22;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 55;
         this.ft.y = 400;
         this.ft.textColor = StaticValue.GREEN;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("用100000点中秋点兑换") + "      <font color=\'" + StaticValue.YELLOW_HTML + "\'>" + _loc2_.res.name + "*1000</font>";
         this.ft.width = 400;
         this.ft.height = 22;
         addChild(this.ft);
         _loc3_ = new ItemFace(_loc2_);
         _loc3_.x = 437 - 1 - 2;
         _loc3_.y = 257 + 1 - 2;
         addChild(_loc3_);
         _loc3_ = new ItemFace(_loc2_);
         _loc3_.x = 437 - 1 - 2;
         _loc3_.y = 303 - 2;
         addChild(_loc3_);
         _loc3_ = new ItemFace(_loc2_);
         _loc3_.x = 437 - 2;
         _loc3_.y = 349 - 1 - 2;
         addChild(_loc3_);
         _loc3_ = new ItemFace(_loc2_);
         _loc3_.x = 437 - 2;
         _loc3_.y = 395 - 1 - 2;
         addChild(_loc3_);
         this.btn1 = new SecondButton();
         this.btn1.x = 495;
         this.btn1.y = 265;
         this.btn1.label = LanResManager.getLanCommonTextWords("兑换");
         this.btn1.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn1);
         this.btn2 = new SecondButton();
         this.btn2.x = 495;
         this.btn2.y = 310;
         this.btn2.label = LanResManager.getLanCommonTextWords("兑换");
         this.btn2.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn2);
         this.btn3 = new SecondButton();
         this.btn3.x = 495;
         this.btn3.y = 355;
         this.btn3.label = LanResManager.getLanCommonTextWords("兑换");
         this.btn3.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn3);
         this.btn4 = new SecondButton();
         this.btn4.x = 495;
         this.btn4.y = 400;
         this.btn4.label = LanResManager.getLanCommonTextWords("兑换");
         this.btn4.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn4);
         this.ft = new FTextArea();
         this.ft.x = 35;
         this.ft.y = 440;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("【交灯谜】") + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("把灯谜交给NPC秋香") + "</font>";
         this.ft.width = 500;
         this.ft.height = 22;
         this.ft = new FTextArea();
         this.ft.x = 35;
         this.ft.y = 460;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("【备注】");
         this.ft.width = 615;
         this.ft.height = 22;
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 480;
         this.ft.textColor = StaticValue.RED;
         this.ft.htmlText = "          " + LanResManager.getLanCommonTextWords("奖励是在1天内领取，如果过了1天就不能领取了。") + "<br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>          " + LanResManager.getLanCommonTextWords("排名前三名的玩家将领取奖励：") + "</font><br>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("第1名：（绑）红宝石(天级)*1") + "</font>       " + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("第2名：（绑）黄玛瑙(天级) *1") + "</font>       " + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("第3名：（绑）绿翡翠(天级)*1") + "</font> ";
         this.ft.width = 615;
         this.ft.height = 85;
         this.btnRank = new SecondButton();
         this.btnRank.x = 495;
         this.btnRank.y = 450 + 20;
         this.btnRank.label = LanResManager.getLanCommonTextWords("排行榜");
         this.btnRank.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn1:
               PipeManager.sendMsg(PipeConstants.SEND_53095,[43,1]);
               break;
            case this.btn2:
               PipeManager.sendMsg(PipeConstants.SEND_53095,[43,2]);
               break;
            case this.btn3:
               PipeManager.sendMsg(PipeConstants.SEND_53095,[43,3]);
               break;
            case this.btn4:
               PipeManager.sendMsg(PipeConstants.SEND_53095,[43,4]);
               break;
            case this.btnRank:
               PipeManager.sendMsg(PipeConstants.REQUEST_YN_BOOKRANKPANEL);
         }
      }
      
      public function setScore(param1:int) : void
      {
         this.ftScore.htmlText = String(param1);
      }
   }
}

