package com.tgame.shell.view.components.huodong
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.TCursorManager;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class SiShengShouKeWenPanel extends FPanel
   {
      
      public static const UI_DAZAOZHUANGBEICLICK:String = "UI_DAZAOZHUANGBEICLICK";
      
      public static const UI_REMOVEZHUANGBEICLICK:String = "UI_REMOVEZHUANGBEICLICK";
      
      public static const UI_FANGRUZHUANGBEICLICK:String = "UI_FANGRUZHUANGBEICLICK";
      
      private var btn_Input:SecondButton;
      
      private var bitLeft1:Bitmap;
      
      private var bitRight1:Bitmap;
      
      private var jtBit:Bitmap;
      
      private var bit:Bitmap;
      
      private var bit1:Bitmap;
      
      private var bit2:Bitmap;
      
      private var bit3:Bitmap;
      
      private var bit4:Bitmap;
      
      private var ft:FTextArea;
      
      private var ftDesc:FTextArea;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var ft4:FTextArea;
      
      private var btn_OK:SecondButton;
      
      private var btn_Remove:SecondButton;
      
      private var ftTips:FTextArea;
      
      private var ifItem1:ItemFace;
      
      private var ifItem2:ItemFace;
      
      private var yanhuaMc:MovieClip;
      
      private var arrays:Array;
      
      private var type:int;
      
      private var move:MovieClip;
      
      private var skillContainer:Sprite;
      
      private var curr:ItemFace;
      
      private var currShow:Goods;
      
      private var currShowItem:ItemFace;
      
      private var select:MovieClip;
      
      private var selectId:int;
      
      public function SiShengShouKeWenPanel()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 360;
         height = 300;
         titleText = LanResManager.getLanCommonTextWords("四圣兽刻纹");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function init() : void
      {
         this.jtBit = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.4");
         this.jtBit.rotation = -90;
         this.jtBit.x = 140 + 5 - 5 - 5;
         this.jtBit.y = 55 + 15;
         this.bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.bit.x = 230;
         this.bit.y = 75 - 30;
         this.ftDesc = new FTextArea();
         this.ftDesc.x = 15;
         this.ftDesc.y = 15;
         this.ftDesc.width = 325;
         this.ftDesc.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家选择四圣兽刻纹中的其中一种和") + "</font><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("级或以上的装备(包括级以及级)") + "</font><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("进行打造后，都将可以获得具有套装效果的装备(原装备属性不变)。") + "</font><font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("集齐相同几件具有套装效果的装备都可以获得不同的加成属性。") + "</font>";
         this.ftDesc.wordWrap = true;
         addChild(this.ftDesc);
         this.skillContainer = new Sprite();
         addChild(this.skillContainer);
         this.bit1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.skillContainer.addChild(this.bit1);
         this.bit1.x = 45;
         this.bit1.y = 180 - 30 + 10 + 2;
         this.ft = new FTextArea();
         this.ft.x = 50;
         this.ft.y = 180 + 45 - 30 + 10 - 5;
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("青龙1");
         addChild(this.ft);
         this.bit2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.skillContainer.addChild(this.bit2);
         this.bit2.x = 45 + 75;
         this.bit2.y = 180 - 30 + 10 + 2;
         this.ft = new FTextArea();
         this.ft.x = 55 + 70;
         this.ft.y = 180 + 45 - 30 + 10 - 5;
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("白虎1");
         addChild(this.ft);
         this.bit3 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.skillContainer.addChild(this.bit3);
         this.bit3.x = 45 + 75 + 75;
         this.bit3.y = 180 - 30 + 10 + 2;
         this.ft = new FTextArea();
         this.ft.x = 55 + 75 + 70;
         this.ft.y = 180 + 45 - 30 + 10 - 5;
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("朱雀1");
         addChild(this.ft);
         this.bit4 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.skillContainer.addChild(this.bit4);
         this.bit4.x = 45 + 75 + 75 + 75;
         this.bit4.y = 180 - 30 + 10 + 2;
         this.ft = new FTextArea();
         this.ft.x = 55 + 75 + 75 + 70;
         this.ft.y = 180 + 45 - 30 + 10 - 5;
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("玄武1");
         addChild(this.ft);
         this.btn_OK = new SecondButton();
         this.btn_OK.x = this.btn_OK.x = width / 2 - this.btn_OK.width / 2 - 10;
         this.btn_OK.y = 252 - 30;
         this.btn_OK.label = LanResManager.getLanCommonTextWords("打造");
         addChild(this.btn_OK);
         this.btn_OK.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn_Remove = new SecondButton();
         this.btn_Remove.x = width * 3 / 4 - this.btn_Remove.width;
         this.btn_Remove.y = 252 - 30;
         this.btn_Remove.label = LanResManager.getLanCommonTextWords("移除");
         this.btn_Remove.visible = false;
         addChild(this.btn_Remove);
         this.btn_Remove.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ftTips = new FTextArea();
         this.ftTips.x = 15;
         this.ftTips.y = 245;
         this.ftTips.width = 325;
         this.ftTips.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("装备移除后将原有的刻纹去除，重新获得打造刻纹的机会。") + "</font>";
         this.ftTips.wordWrap = true;
         this.ftTips.visible = false;
         addChild(this.ftTips);
         this.btn_Input = new SecondButton();
         this.btn_Input.x = width / 2 - this.btn_Input.width / 2 - 15;
         this.btn_Input.y = 15 + 75;
         this.btn_Input.label = LanResManager.getLanCommonTextWords("放入装备");
         this.btn_Input.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn_Input);
         this.bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.bit);
         this.bit.x = width / 2 - this.bit.width / 2 - 2;
         this.bit.y = 75 - 30 + 75 - 5;
         this.bit.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn_Input:
               if(this.btn_Input.label == LanResManager.getLanCommonTextWords("放入装备"))
               {
                  this.btn_OK.enabled = false;
                  this.dispatchEvent(new BaseEvent(UI_FANGRUZHUANGBEICLICK,"",1));
               }
               else
               {
                  this.btn_OK.enabled = true;
                  this.dispatchEvent(new BaseEvent(UI_FANGRUZHUANGBEICLICK,"",2));
               }
               break;
            case this.btn_OK:
               this.dispatchEvent(new BaseEvent(UI_DAZAOZHUANGBEICLICK,"",this.selectId));
               break;
            case this.btn_Remove:
               this.dispatchEvent(new BaseEvent(UI_REMOVEZHUANGBEICLICK,"",this.selectId));
         }
      }
      
      private function onClicks(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = param1.target as ItemFace;
         this.selectId = int(_loc2_.name) + 1;
         if(this.select != null && this.select.parent != null)
         {
            this.select.parent.removeChild(this.select);
         }
         this.select = StaticValue.getMCByClassName("ui.skill.default") as MovieClip;
         addChild(this.select);
         this.select.x = 45 + 75 * int(_loc2_.name) + 2;
         this.select.y = 180 + 2 - 30;
         this.select.mouseEnabled = false;
         this.select.mouseChildren = false;
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
            this.setGoods();
            this.resumMouseStatus();
         }
      }
      
      public function showRemoveBtn() : void
      {
         if(OtherConst.yichu_kewen == 1)
         {
            height = 320;
            this.btn_OK.x = width / 4;
            this.btn_Remove.visible = true;
            this.ftTips.visible = true;
         }
         else
         {
            height = 300;
            this.btn_OK.x = this.btn_OK.x = width / 2 - this.btn_OK.width / 2 - 10;
            this.btn_Remove.visible = false;
            this.ftTips.visible = false;
         }
      }
      
      public function setGoods(param1:Goods = null, param2:Goods = null) : void
      {
         if(this.ifItem1 != null && this.ifItem1.parent != null)
         {
            this.ifItem1.parent.removeChild(this.ifItem1);
         }
         if(param1 == null)
         {
            this.btn_Input.label = LanResManager.getLanCommonTextWords("放入装备");
            if(this.ifItem1 != null && this.ifItem1.parent != null)
            {
               this.ifItem1.parent.removeChild(this.ifItem1);
            }
            this.btn_OK.enabled = false;
            this.btn_Remove.enabled = false;
            return;
         }
         this.btn_OK.enabled = true;
         this.btn_Remove.enabled = true;
         this.ifItem1 = new ItemFace(param1);
         this.ifItem1.x = width / 2 - this.bit.width / 2 - 2 + 2;
         this.ifItem1.y = 75 - 30 + 75 - 5 + 2;
         addChild(this.ifItem1);
         this.btn_Input.label = LanResManager.getLanCommonTextWords("取出装备");
      }
      
      public function setGoodArr(param1:Array) : void
      {
         var _loc3_:ItemFace = null;
         while(this.skillContainer.numChildren > 0)
         {
            this.skillContainer.removeChildAt(0);
         }
         this.arrays = param1;
         var _loc2_:* = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new ItemFace(param1[_loc2_] as Goods);
            _loc3_.x = 45 + 75 * _loc2_ + 2;
            _loc3_.y = 180 + 2 - 30;
            _loc3_.name = String(_loc2_);
            this.skillContainer.addChild(_loc3_);
            _loc3_.addEventListener(MouseEvent.CLICK,this.onClicks);
            _loc2_++;
         }
         this.selectId = 1;
         if(this.select != null && this.select.parent != null)
         {
            this.select.parent.removeChild(this.select);
         }
         this.select = StaticValue.getMCByClassName("ui.skill.default") as MovieClip;
         addChild(this.select);
         this.select.x = 45 + 2;
         this.select.y = 180 + 2 - 30;
         this.select.mouseEnabled = false;
         this.select.mouseChildren = false;
      }
      
      public function bofangDuguYanhua(param1:int) : void
      {
         var type:int = param1;
         if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
         if(type == 1)
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               yanhuaMc = _loc2_.content as MovieClip;
               yanhuaMc.x = 300 - yanhuaMc.width / 2;
               yanhuaMc.y = 100 - yanhuaMc.height / 2;
               addChild(yanhuaMc);
            },null,false,GameConfig.fileBaseFolder + "res/data/mc/chenggongTxt.swf");
         }
         else if(type == 2)
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               yanhuaMc = _loc2_.content as MovieClip;
               yanhuaMc.x = 300 - yanhuaMc.width / 2;
               yanhuaMc.y = 100 - yanhuaMc.height / 2;
               addChild(yanhuaMc);
            },null,false,GameConfig.fileBaseFolder + "res/data/mc/chenggongTxt.swf");
         }
      }
      
      private function resumMouseStatus() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = null;
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
         }
      }
   }
}

