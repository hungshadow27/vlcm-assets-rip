package com.tgame.shell.view.components.equippudding
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.TCursorManager;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class EquipCopyPanel extends FPanel
   {
      
      public static const UI_FANGRUZHUANGBEICLICK:String = "UI_FANGRUZHUANGBEICLICK";
      
      public static const UI_FUZHIZHUANGBEICLICK:String = "UI_FUZHIZHUANGBEICLICK";
      
      private var btn_Input:SecondButton;
      
      private var jianTouBmp:Bitmap;
      
      private var fta:FTextArea;
      
      private var btn_OK:SecondButton;
      
      private var item1:ItemFace;
      
      private var item2:ItemFace;
      
      private var item3:ItemFace;
      
      private var yanhuaMc:MovieClip;
      
      private var bitmap:Bitmap;
      
      private var ftDesc1:FTextArea;
      
      private var ftDesc2:FTextArea;
      
      public function EquipCopyPanel()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 270;
         height = 320;
         titleText = LanResManager.getLanCommonTextWords("装备复制");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function init() : void
      {
         var menuContainer1:FCanvas = null;
         var menuContainer2:FCanvas = null;
         menuContainer1 = new FCanvas();
         menuContainer1.skin = "box_transparence";
         addChild(menuContainer1);
         menuContainer1.width = 250;
         menuContainer1.height = 90;
         menuContainer1.x = 10;
         menuContainer1.y = 0;
         menuContainer2 = new FCanvas();
         menuContainer2.skin = "backGroud";
         addChild(menuContainer2);
         menuContainer2.width = 250;
         menuContainer2.height = 65;
         menuContainer2.x = 10;
         menuContainer2.y = 89;
         this.btn_Input = new SecondButton();
         this.btn_Input.x = 25;
         this.btn_Input.y = 25 - 5 - 5;
         this.btn_Input.label = LanResManager.getLanCommonTextWords("放入装备");
         this.btn_Input.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn_Input);
         this.bitmap = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.bitmap);
         this.bitmap.x = 40;
         this.bitmap.y = 40;
         this.jianTouBmp = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.4");
         this.jianTouBmp.rotation = -90;
         this.jianTouBmp.x = 95;
         this.jianTouBmp.y = 77 - 5 - 5;
         addChild(this.jianTouBmp);
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 185;
            y = 28 - 5 - 5;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("复制后") + "：";
         }
         addChild(this.fta);
         this.bitmap = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.bitmap.x = 187;
         this.bitmap.y = 40;
         addChild(this.bitmap);
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 30 + 2;
            y = 160;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("复制材料") + "：";
         }
         addChild(this.fta);
         this.bitmap = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.bitmap.x = 40;
         this.bitmap.y = 180;
         addChild(this.bitmap);
         this.ftDesc1 = new FTextArea();
         this.ftDesc1.x = 20;
         this.ftDesc1.y = 90;
         this.ftDesc1.width = 220;
         this.ftDesc1.height = 50 + 20;
         this.ftDesc1.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家可以使用神印石选择复制身上件装备中的任意一件，成功之后，获得该装备的全部属性加成。") + "<br></font>" + "</textformat>";
         this.ftDesc1.wordWrap = true;
         addChild(this.ftDesc1);
         this.ftDesc2 = new FTextArea();
         this.ftDesc2.x = 95;
         this.ftDesc2.y = 95 - 5 + 65 - 5;
         this.ftDesc2.width = 155 + 3;
         this.ftDesc2.height = 145;
         this.ftDesc2.htmlText = "<textformat leading=\'0\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("装备复制目标范围仅限于可佩戴于主手武器、骑战武器、衣服、护手、护腰、靴子、头饰、项链、戒指、手镯、腰坠、披风的十二个部位装备。") + "</font>" + "</textformat>";
         this.ftDesc2.wordWrap = true;
         addChild(this.ftDesc2);
         this.btn_OK = new SecondButton();
         this.btn_OK.x = 115;
         this.btn_OK.y = 255;
         this.btn_OK.label = LanResManager.getLanCommonTextWords("复制");
         addChild(this.btn_OK);
         this.btn_OK.addEventListener(MouseEvent.CLICK,this.onClick);
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
               this.dispatchEvent(new BaseEvent(UI_FUZHIZHUANGBEICLICK));
         }
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
      
      public function setGoods(param1:Goods = null, param2:Goods = null) : void
      {
         if(this.item1 != null && this.item1.parent != null)
         {
            this.item1.parent.removeChild(this.item1);
         }
         if(this.item2 != null && this.item2.parent != null)
         {
            this.item2.parent.removeChild(this.item2);
         }
         if(param1 == null)
         {
            this.btn_Input.label = LanResManager.getLanCommonTextWords("放入装备");
            this.btn_OK.enabled = false;
            return;
         }
         this.btn_OK.enabled = true;
         this.item1 = new ItemFace(param1);
         this.item1.x = 42;
         this.item1.y = 42;
         addChild(this.item1);
         this.item2 = new ItemFace(param2);
         this.item2.x = 189;
         this.item2.y = 42;
         addChild(this.item2);
         this.btn_Input.label = LanResManager.getLanCommonTextWords("取出装备");
      }
      
      public function setNeedGoods(param1:Goods) : void
      {
         if(this.item3 != null && this.item3.parent != null)
         {
            this.item3.parent.removeChild(this.item3);
         }
         if(param1 != null)
         {
            this.item3 = new ItemFace(param1);
            this.item3.x = 42;
            this.item3.y = 182;
            addChild(this.item3);
         }
      }
      
      public function setGoods1(param1:Goods) : void
      {
         if(this.item1 != null && this.item1.parent != null)
         {
            this.item1.parent.removeChild(this.item1);
         }
         if(param1 == null)
         {
            this.btn_Input.label = LanResManager.getLanCommonTextWords("放入装备");
            this.btn_OK.enabled = false;
            return;
         }
         this.btn_OK.enabled = true;
         this.item1 = new ItemFace(param1);
         this.item1.x = 42;
         this.item1.y = 42;
         addChild(this.item1);
         this.btn_Input.label = LanResManager.getLanCommonTextWords("取出装备");
      }
      
      public function setGoods2(param1:Goods) : void
      {
         if(this.item2 != null && this.item2.parent != null)
         {
            this.item2.parent.removeChild(this.item2);
         }
         if(param1 != null)
         {
            this.item2 = new ItemFace(param1);
            this.item2.x = 189;
            this.item2.y = 42;
            addChild(this.item2);
            this.btn_OK.enabled = false;
         }
      }
      
      public function bofangYanhua() : void
      {
         if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            yanhuaMc = _loc2_.content as MovieClip;
            yanhuaMc.x = (270 - yanhuaMc.width) / 2;
            yanhuaMc.y = (320 - yanhuaMc.height) / 2;
            addChild(yanhuaMc);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/chenggongTxt.swf");
      }
      
      private function resumMouseStatus() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = null;
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
            GameInstance.uiInstance.backpack.functionBtnEnalbe = true;
         }
      }
      
      public function setTextByType(param1:int = 0) : void
      {
         if(param1 == 0)
         {
            this.ftDesc2.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("装备复制目标范围仅限于可佩戴于主手武器、骑战武器、衣服、护手、护腰、靴子、头饰、项链、戒指、手镯、腰坠、披风的十二个部位装备。") + "</font>" + "</textformat>";
            this.ftDesc1.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家可以使用神印石选择复制身上件装备中的任意一件，成功之后，获得该装备的全部属性加成。") + "<br></font>" + "</textformat>";
         }
         else if(param1 == 1)
         {
            this.ftDesc2.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("装备复制目标范围仅限于可佩戴于主手武器、骑战武器、衣服、护手、护腰、靴子、头饰、项链、戒指、手镯、腰坠、披风的十二个部位装备。") + "</font>" + "</textformat>";
            this.ftDesc1.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家可以使用永久神印石选择复制身上件装备中的任意一件，成功之后，获得该装备的全部属性加成。") + "<br></font>" + "</textformat>";
         }
         else if(param1 == 2)
         {
            this.ftDesc1.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家可以选择复制戮战天涯勋章、鬼迷心窍勋章、炙手可热勋章中的任意一件，成功之后获得该勋章的全部属性加成。") + "<br></font>" + "</textformat>";
            this.ftDesc2.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("装备复制目标范围仅限于戮战天涯勋章、鬼迷心窍勋章、炙手可热勋章。") + "</font>" + "</textformat>";
         }
      }
   }
}

