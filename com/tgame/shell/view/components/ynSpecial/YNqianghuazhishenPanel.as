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
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class YNqianghuazhishenPanel extends FPanel
   {
      
      private var bg:DisplayObject;
      
      private var ft:FTextArea;
      
      private var spr:Sprite;
      
      private var btn1:SecondButton;
      
      private var btn2:SecondButton;
      
      private var btn3:SecondButton;
      
      public function YNqianghuazhishenPanel()
      {
         super();
         width = 425;
         height = 400;
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("强化之神");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
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
         var _loc2_:Goods = null;
         var _loc3_:ItemFace = null;
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/qianghuazhishen/bg.swf");
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         this.ft = new FTextArea();
         this.ft.x = 15;
         this.ft.y = 15;
         this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("[时间]") + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("2016年01月22号（0点）- 2016年01月22号（23点59分）(强化之神）") + "</font>";
         this.ft.width = 360;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 15;
         this.ft.y = 55;
         this.ft.textColor = StaticValue.PURPLE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("参加获得奖励");
         this.ft.width = 200;
         addChild(this.ft);
         _loc2_ = new Goods(721637);
         _loc3_ = new ItemFace(_loc2_,65,65);
         _loc3_.x = 28 - 1 - 1;
         _loc3_.y = 96 - 1;
         addChild(_loc3_);
         this.ft = new FTextArea();
         this.ft.x = 135;
         this.ft.y = 95;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("充值888元宝");
         this.ft.textColor = StaticValue.GREEN;
         this.ft.width = 200;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 135;
         this.ft.y = 140;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("获得（绑）破天刃强化符 * 8");
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.width = 200;
         addChild(this.ft);
         this.btn1 = new SecondButton();
         this.btn1.x = 350;
         this.btn1.y = 140;
         this.btn1.label = LanResManager.getLanCommonTextWords("领取");
         this.btn1.name = "1";
         this.btn1.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn1);
         _loc2_ = new Goods(721637);
         _loc3_ = new ItemFace(_loc2_,65,65);
         _loc3_.x = 28 - 1 - 1;
         _loc3_.y = 188 - 1 - 1;
         addChild(_loc3_);
         this.ft = new FTextArea();
         this.ft.x = 135;
         this.ft.y = 185;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("充值8888元宝");
         this.ft.textColor = StaticValue.GREEN;
         this.ft.width = 200;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 135;
         this.ft.y = 230;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("获得（绑）破天刃强化符 * 88") + "+" + LanResManager.getLanCommonTextWords("完美宝石") + "*1";
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.width = 200;
         addChild(this.ft);
         this.btn2 = new SecondButton();
         this.btn2.x = 350;
         this.btn2.y = 230;
         this.btn2.label = LanResManager.getLanCommonTextWords("领取");
         this.btn2.name = "2";
         this.btn2.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn2);
         _loc2_ = new Goods(721637);
         _loc3_ = new ItemFace(_loc2_,65,65);
         _loc3_.x = 28 - 1 - 1;
         _loc3_.y = 282 - 3 - 1;
         addChild(_loc3_);
         this.ft = new FTextArea();
         this.ft.x = 135;
         this.ft.y = 280;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("充值88888元宝");
         this.ft.textColor = StaticValue.GREEN;
         this.ft.width = 200;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 135;
         this.ft.y = 325;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("获得（绑）破天刃强化符 * 888") + "+" + LanResManager.getLanCommonTextWords("完美宝石") + "*10";
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.width = 200;
         addChild(this.ft);
         this.btn3 = new SecondButton();
         this.btn3.x = 350;
         this.btn3.y = 325;
         this.btn3.label = LanResManager.getLanCommonTextWords("领取");
         this.btn3.name = "3";
         this.btn3.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn3);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[52,param1.target.name]);
      }
   }
}

