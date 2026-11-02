package com.tgame.shell.view.components.huodong
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class DaoJuTiQuKaPanel extends FPanel
   {
      
      public static const UI_ROSE_REFRESH_CLICK:String = "UI_MEIGUIHUA_REFRESH_CLICK";
      
      public static const UI_GETCARD_CLICK:String = "UI_GETCARD_CLICK";
      
      private var ft:FTextArea;
      
      private var btnRose:SecondButton;
      
      private var btnKa:SecondButton;
      
      private var btnYB:SecondButton;
      
      private var bit:Bitmap;
      
      private var ft1:FTextArea;
      
      private var ifItem1:ItemFace;
      
      public function DaoJuTiQuKaPanel()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 280;
         height = 240 + 40 + 15;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.ft1 = new FTextArea();
         this.ft1.x = 10;
         this.ft1.y = 10;
         this.ft1.width = 255;
         this.ft1.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所有") + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("VIP玩家") + "</font>" + LanResManager.getLanCommonTextWords("都将可以") + " <font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("免费领取") + "</font> <font color=\'#FF00FF\'>" + LanResManager.getLanCommonTextWords("道具提取卡宝盒") + "X1</font>，" + LanResManager.getLanCommonTextWords("在宝盒里面装有4张提取卡（最多），双击打开之后，将随机出现1-4张不同数量的提取卡") + "</font>";
         this.ft1.wordWrap = true;
         addChild(this.ft1);
         this.bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.bit.x = 120;
         this.bit.y = 78;
         addChild(this.bit);
         this.ft1 = new FTextArea();
         this.ft1.x = 10;
         this.ft1.y = 120;
         this.ft1.width = 260;
         this.ft1.wordWrap = true;
         this.ft1.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("1.玩家可通过点击") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【玫瑰花】") + "</font>" + LanResManager.getLanCommonTextWords("按钮刷新道具卡的数量，最多为4张，每次消耗玫瑰花*1；<br />2.当满意道具提取卡的数量时，点击") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【领取】") + "</font>" + LanResManager.getLanCommonTextWords("按钮则可领取对应数量的道具提取卡；<br />3.玩家也可以通过点击") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【元宝领取】") + "</font>" + LanResManager.getLanCommonTextWords("按钮，花费") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("10元宝") + "</font>" + LanResManager.getLanCommonTextWords("直接领取4张道具提取卡。") + "</font>";
         addChild(this.ft1);
         this.btnRose = new SecondButton();
         this.btnRose.x = 10 + 10;
         this.btnRose.y = 200 + 15 + 10;
         this.btnRose.label = LanResManager.getLanCommonTextWords("玫瑰花");
         addChild(this.btnRose);
         this.btnRose.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btnKa = new SecondButton();
         this.btnKa.x = 85 + 20;
         this.btnKa.y = 200 + 15 + 10;
         this.btnKa.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.btnKa);
         this.btnKa.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btnYB = new SecondButton();
         this.btnYB.x = 170 + 20;
         this.btnYB.y = 200 + 15 + 10;
         this.btnYB.label = LanResManager.getLanCommonTextWords("元宝领取");
         addChild(this.btnYB);
         this.btnYB.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function onClose(param1:FCloseEvent = null) : void
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
            case this.btnRose:
               this.dispatchEvent(new BaseEvent(UI_ROSE_REFRESH_CLICK));
               break;
            case this.btnKa:
               this.dispatchEvent(new BaseEvent(UI_GETCARD_CLICK,"",0));
               break;
            case this.btnYB:
               this.dispatchEvent(new BaseEvent(UI_GETCARD_CLICK,"",1));
         }
      }
      
      public function setGoods(param1:Goods = null) : void
      {
         if(this.ifItem1 != null && this.ifItem1.parent != null)
         {
            this.ifItem1.parent.removeChild(this.ifItem1);
         }
         if(param1 == null)
         {
            return;
         }
         this.ifItem1 = new ItemFace(param1);
         this.ifItem1.x = 120 + 2;
         this.ifItem1.y = 78 + 2;
         addChild(this.ifItem1);
         this.btnRose.enabled = true;
         this.btnKa.enabled = true;
         this.btnYB.enabled = true;
         if(param1.count == 4)
         {
            this.btnRose.enabled = false;
         }
         else if(param1.count == 0)
         {
            this.btnKa.enabled = false;
         }
      }
   }
}

