package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class TianShangZhiHunShengJiePanel extends FPanel
   {
      
      public static const UI_TIANSHANGZHIHUN_SET_ZHUANGBEI_CLICK:String = "UI_TIANSHANGZHIHUN_SET_ZHUANGBEI_CLICK";
      
      public static const UI_TIANSHANGZHIHUN_GET_ZHUANGBEI_CLICK:String = "UI_TIANSHANGZHIHUN_GET_ZHUANGBEI_CLICK";
      
      public static const UI_TIANSHANGZHIHUN_HECHENG_CLICK:String = "UI_TIANSHANGZHIHUN_HECHENG_CLICK";
      
      public static const UI_TIANSHENZHIHUN_CLOSE_CLICK:String = "UI_TIANSHENZHIHUN_CLOSE_CLICK";
      
      private var ft:FTextArea;
      
      private var btn_equip:SecondButton;
      
      private var btn_ok:SecondButton;
      
      private var bg9left:F9GridBitmap;
      
      private var img:Bitmap;
      
      private var fc1:FCanvas;
      
      private var item1:ItemFace;
      
      private var item2:ItemFace;
      
      private var item3:ItemFace;
      
      private var goArr:Array;
      
      public function TianShangZhiHunShengJiePanel()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         this.dragRestrict = true;
         width = 350;
         height = 300;
         titleText = LanResManager.getLanCommonTextWords("天殇之魂");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         dispatchEvent(new BaseEvent(UI_TIANSHENZHIHUN_CLOSE_CLICK));
      }
      
      public function close() : void
      {
         this.getItem();
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.goArr = new Array();
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 8;
         this.ft.width = 320;
         this.ft.height = 50;
         this.ft.wordWrap = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用两把相同星级的天殇之魂，可以合成更高一级的天殇之魂，合成后属性激增，威力翻倍。") + "</font>";
         addChild(this.ft);
         this.fc1 = new FCanvas();
         this.fc1.width = 315 + 16;
         this.fc1.height = 150 + 2 + 4;
         this.fc1.x = 10;
         this.fc1.y = 51;
         this.fc1.skin = "box";
         addChild(this.fc1);
         this.bg9left = Tools.get9GridBitmpByName("leijidenglu_bg");
         this.bg9left.x = 12;
         this.bg9left.y = 54;
         this.bg9left.width = 150;
         this.bg9left.height = 150;
         addChild(this.bg9left);
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 208;
         this.ft.width = 320;
         this.ft.height = 60;
         this.ft.wordWrap = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("注意：天殇之魂最高为10星，本合成操作100%成功。两把不同星级的天殇之魂，不可进行合成操作。") + "</font>";
         addChild(this.ft);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.img.x = 45;
         this.img.y = 100;
         addChild(this.img);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.img.x = 85;
         this.img.y = 100;
         addChild(this.img);
         this.btn_equip = new SecondButton();
         this.btn_equip.x = 40 + 10;
         this.btn_equip.y = 150;
         this.btn_equip.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn_equip.label = LanResManager.getLanCommonTextWords("放入装备");
         addChild(this.btn_equip);
         this.ft = new FTextArea();
         this.ft.x = 190;
         this.ft.y = 105;
         this.ft.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功后：") + "</font>";
         addChild(this.ft);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.img.x = 190;
         this.img.y = 135;
         addChild(this.img);
         this.btn_ok = new SecondButton();
         this.btn_ok.x = 265;
         this.btn_ok.y = 130;
         this.btn_ok.label = LanResManager.getLanCommonTextWords("合成");
         addChild(this.btn_ok);
         this.btn_ok.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn_equip:
               if(this.btn_equip.label == LanResManager.getLanCommonTextWords("放入装备"))
               {
                  dispatchEvent(new BaseEvent(UI_TIANSHANGZHIHUN_SET_ZHUANGBEI_CLICK));
               }
               else
               {
                  dispatchEvent(new BaseEvent(UI_TIANSHANGZHIHUN_GET_ZHUANGBEI_CLICK));
               }
               break;
            case this.btn_ok:
               dispatchEvent(new BaseEvent(UI_TIANSHANGZHIHUN_HECHENG_CLICK,"",this.goArr));
         }
      }
      
      public function setItem1(param1:Goods) : void
      {
         if(this.item1 != null && this.item1.parent != null)
         {
            this.item1.parent.removeChild(this.item1);
         }
         this.goArr[0] = param1;
         this.item1 = new ItemFace(param1);
         this.item1.x = 45 + 2;
         this.item1.y = 100 + 2;
         addChild(this.item1);
         this.btn_equip.label = LanResManager.getLanCommonTextWords("取出装备");
      }
      
      public function setItem2(param1:Goods) : void
      {
         if(this.item2 != null && this.item2.parent != null)
         {
            this.item2.parent.removeChild(this.item2);
         }
         this.goArr[1] = param1;
         this.item2 = new ItemFace(param1);
         this.item2.x = 85 + 2;
         this.item2.y = 100 + 2;
         addChild(this.item2);
         this.btn_equip.label = LanResManager.getLanCommonTextWords("取出装备");
      }
      
      public function setItem(param1:Goods) : void
      {
         if(this.item3 != null && this.item3.parent != null)
         {
            this.item3.parent.removeChild(this.item3);
         }
         this.item3 = new ItemFace(param1);
         this.item3.x = 190 + 2;
         this.item3.y = 135 + 2;
         addChild(this.item3);
         this.btn_equip.label = LanResManager.getLanCommonTextWords("取出装备");
      }
      
      public function getItem() : void
      {
         if(this.item1 != null && this.item1.parent != null)
         {
            this.item1.parent.removeChild(this.item1);
         }
         if(this.item2 != null && this.item2.parent != null)
         {
            this.item2.parent.removeChild(this.item2);
         }
         if(this.item3 != null && this.item3.parent != null)
         {
            this.item3.parent.removeChild(this.item3);
         }
         this.goArr = [];
         this.btn_equip.label = LanResManager.getLanCommonTextWords("放入装备");
      }
   }
}

