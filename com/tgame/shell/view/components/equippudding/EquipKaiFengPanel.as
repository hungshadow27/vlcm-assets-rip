package com.tgame.shell.view.components.equippudding
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.TCursorManager;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class EquipKaiFengPanel extends FPanel
   {
      
      public static const UI_SHISHIKAIFENG_CLICK:String = "UI_SHISHIKAIFENG_CLICK";
      
      public static const UI_ITEM_DRAG_ENTER:String = "UI_ITEM_DRAG_ENTER";
      
      private var fta:FTextArea;
      
      private var btn_OK:SecondButton;
      
      private var item1:ItemFace;
      
      private var item2:ItemFace;
      
      private var yanhuaMc:MovieClip;
      
      private var bitmap:Bitmap;
      
      private var bitmap1:Bitmap;
      
      private var ftDesc1:FTextArea;
      
      private var ftDesc2:FTextArea;
      
      private var ftEquip:FTextArea;
      
      private var ftCailiao:FTextArea;
      
      private var ftShuxing:FTextArea;
      
      private var ftDesc:FTextArea;
      
      private var menuContainer1:FCanvas;
      
      private var menuContainer2:FCanvas;
      
      private var item2Container:Sprite;
      
      public function EquipKaiFengPanel()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 270;
         height = 320;
         titleText = LanResManager.getLanCommonTextWords("史诗开封");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function init() : void
      {
         this.menuContainer1 = new FCanvas();
         this.menuContainer1.skin = "box_transparence";
         addChild(this.menuContainer1);
         this.menuContainer1.width = 250;
         this.menuContainer1.height = 90;
         this.menuContainer1.x = 10;
         this.menuContainer1.y = 0;
         this.menuContainer2 = new FCanvas();
         this.menuContainer2.skin = "backGroud";
         addChild(this.menuContainer2);
         this.menuContainer2.width = 250;
         this.menuContainer2.height = 65;
         this.menuContainer2.x = 10;
         this.menuContainer2.y = 89;
         this.ftEquip = new FTextArea();
         with(this.ftEquip)
         {
            x = 30 + 2;
            y = 18;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("当前装备") + "：";
         }
         addChild(this.ftEquip);
         this.bitmap = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.bitmap);
         this.bitmap.x = 40;
         this.bitmap.y = 40;
         this.ftCailiao = new FTextArea();
         with(this.ftCailiao)
         {
            x = 145;
            y = 28 - 5 - 5;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("开封材料") + "：";
         }
         addChild(this.ftCailiao);
         this.bitmap1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.bitmap1.x = 187;
         this.bitmap1.y = 40;
         addChild(this.bitmap1);
         this.item2Container = new Sprite();
         addChild(this.item2Container);
         with(this.item2Container.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,39,50);
            endFill();
         }
         this.item2Container.x = 189;
         this.item2Container.y = 42 - 10;
         this.ftShuxing = new FTextArea();
         this.ftShuxing.x = 20;
         this.ftShuxing.y = 100;
         this.ftShuxing.width = 220;
         this.ftShuxing.height = 50;
         this.ftShuxing.htmlText = "";
         this.ftShuxing.wordWrap = true;
         addChild(this.ftShuxing);
         this.ftDesc = new FTextArea();
         this.ftDesc.x = 20;
         this.ftDesc.y = 165;
         this.ftDesc.width = 220;
         this.ftDesc.height = 70;
         this.ftDesc.wordWrap = true;
         addChild(this.ftDesc);
         this.btn_OK = new SecondButton();
         this.btn_OK.x = 115;
         this.btn_OK.y = 255;
         addChild(this.btn_OK);
         this.btn_OK.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target.label)
         {
            case LanResManager.getLanCommonTextWords("开封"):
               this.dispatchEvent(new BaseEvent(UI_SHISHIKAIFENG_CLICK,"",1));
               break;
            case LanResManager.getLanCommonTextWords("打造"):
               if(this.item2Container.numChildren > 0)
               {
                  this.dispatchEvent(new BaseEvent(UI_SHISHIKAIFENG_CLICK,"",2));
               }
               else
               {
                  TCursorManager.currentItemFace = null;
               }
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         while(this.item2Container.numChildren > 0)
         {
            this.item2Container.removeChildAt(0);
         }
         this.dispatchEvent(new BaseEvent(UI_ITEM_DRAG_ENTER));
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setGoods(param1:Goods = null, param2:Goods = null, param3:int = 1, param4:int = 0, param5:int = 1) : void
      {
         var _loc6_:String = null;
         if(this.item1 != null && this.item1.parent != null)
         {
            this.item1.parent.removeChild(this.item1);
         }
         while(this.item2Container.numChildren > 0)
         {
            this.item2Container.removeChildAt(0);
         }
         if(this.item2Container.hasEventListener(MouseEvent.MOUSE_UP))
         {
            this.item2Container.removeEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false);
         }
         this.btn_OK.enabled = true;
         this.item1 = new ItemFace(param1);
         this.item1.x = 42;
         this.item1.y = 42;
         this.item1.setShowCount(false);
         addChild(this.item1);
         this.item2 = new ItemFace(param2);
         this.item2.y = 10;
         this.item2Container.addChild(this.item2);
         if(param2.count < param3)
         {
            this.item2.filters = Tools.blackWhiteFilter;
         }
         this.ftEquip.y = 18;
         this.bitmap.y = 40;
         this.bitmap1.y = 40;
         this.ftCailiao.x = 145;
         this.ftCailiao.y = 28 - 5 - 5;
         this.menuContainer1.height = 90;
         this.menuContainer2.y = 89;
         this.ftShuxing.y = 100;
         this.ftShuxing.height = 50;
         this.ftDesc.y = 165;
         this.menuContainer2.height = 65;
         titleText = LanResManager.getLanCommonTextWords("史诗开封");
         this.ftCailiao.htmlText = LanResManager.getLanCommonTextWords("开封材料") + "：";
         this.btn_OK.label = LanResManager.getLanCommonTextWords("开封");
         if(param2.id == 9657)
         {
            _loc6_ = "";
            if(param5 == 1)
            {
               _loc6_ = LanResManager.getLanCommonTextWords("攻击");
            }
            else if(param5 == 2)
            {
               LanResManager.getLanCommonTextWords("防御");
            }
            this.ftShuxing.htmlText = "<textformat leading=\'10\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("开封后增加属性") + "：<br>" + _loc6_ + "+" + param4 + "</font>" + "</textformat>";
            this.ftDesc.htmlText = "<textformat leading=\'10\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("上古神兵都将可以进行开封，开封后进阶为史诗神兵，从而施放神兵内强大的能量。") + "</font>" + "</textformat>";
         }
         else
         {
            this.ftShuxing.htmlText = "<textformat leading=\'10\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'></font>" + "</textformat>";
            this.ftDesc.htmlText = "";
         }
      }
      
      public function setGoods1(param1:Goods = null, param2:Goods = null, param3:int = 1, param4:String = "", param5:String = "") : void
      {
         if(this.item1 != null && this.item1.parent != null)
         {
            this.item1.parent.removeChild(this.item1);
         }
         while(this.item2Container.numChildren > 0)
         {
            this.item2Container.removeChildAt(0);
         }
         if(!this.item2Container.hasEventListener(MouseEvent.MOUSE_UP))
         {
            this.item2Container.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         }
         this.btn_OK.enabled = true;
         this.item1 = new ItemFace(param1);
         this.item1.x = 42;
         this.item1.y = 42 - 10;
         this.item1.setShowCount(false);
         addChild(this.item1);
         if(param2 != null)
         {
            this.item2 = new ItemFace(param2);
            this.item2Container.addChild(this.item2);
            if(param2.count < param3)
            {
               this.item2.filters = Tools.blackWhiteFilter;
            }
         }
         this.ftEquip.y = 18 - 10;
         this.bitmap.y = 40 - 10;
         this.bitmap1.y = 40 - 10;
         this.ftCailiao.y = 28 - 5 - 5 - 10;
         this.ftShuxing.y = 100 - 10 - 8;
         this.menuContainer1.height = 90 - 20 + 6;
         this.menuContainer2.y = 89 - 15;
         this.ftCailiao.x = 185 - 3 + 10;
         this.ftShuxing.height = 120;
         this.ftDesc.y = 165 + 25;
         this.menuContainer2.height = 65 + 30 + 5 + 15;
         titleText = LanResManager.getLanCommonTextWords("装备打造");
         this.ftShuxing.width = 220;
         this.ftDesc.width = 220;
         this.ftCailiao.htmlText = LanResManager.getLanCommonTextWords("材料：");
         this.btn_OK.label = LanResManager.getLanCommonTextWords("打造");
         this.ftShuxing.htmlText = param4;
         this.ftDesc.htmlText = param5;
      }
   }
}

