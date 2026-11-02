package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.stone.StoneHelpCanvas;
   import com.tgame.shell.view.components.stone.StoneInnateCanvas;
   import com.tgame.shell.view.components.stone.StoneMakeCanvas;
   import com.tgame.shell.view.components.stone.StoneTimeMakeCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class StonePanel extends FPanel
   {
      
      public static const UI_STONE_PANEL_MAKE_SHOW:String = "UI_STONE_PANEL_MAKE_SHOW";
      
      public static const UI_STONE_PANEL_INLAY_SHOW:String = "UI_STONE_PANEL_INLAY_SHOW";
      
      public static const UI_STONE_PANEL_ABRUPTION_SHOW:String = "UI_STONE_PANEL_ABRUPTION_SHOW";
      
      public static const UI_STONE_PANEL_MAKE_PUT_STONE:String = "UI_STONE_PANEL_MAKE_PUT_STONE";
      
      public static const UI_STONE_PANEL_MAKE_USE_BIND_STONE:String = "UI_STONE_PANEL_MAKE_USE_BIND_STONE";
      
      public static const UI_STONE_PANEL_MAKE_GET_STONE:String = "UI_STONE_PANEL_MAKE_GET_STONE";
      
      public static const UI_STONE_PANEL_MAKE_START:String = "UI_STONE_PANEL_MAKE_START";
      
      public static const UI_STONE_PANEL_INLAY_PUT_EQUIP:String = "UI_STONE_PANEL_INLAY_PUT_EQUIP";
      
      public static const UI_STONE_PANEL_INLAY_GET_EQUIP:String = "UI_STONE_PANEL_INLAY_GET_EQUIP";
      
      public static const UI_STONE_PANEL_INLAY_PUT_STONE:String = "UI_STONE_PANEL_INLAY_PUT_STONE";
      
      public static const UI_STONE_PANEL_INLAY_GET_STONE:String = "UI_STONE_PANEL_INLAY_GET_STONE";
      
      public static const UI_STONE_PANEL_INLAY_LUCK_STONE_COUNT:String = "UI_STONE_PANEL_INLAY_LUCK_STONE_COUNT";
      
      public static const UI_STONE_PANEL_INLAY_START:String = "UI_STONE_PANEL_INLAY_START";
      
      public static const UI_STONE_PANEL_ABRUPTION_PUT_EQUIP:String = "UI_STONE_PANEL_ABRUPTION_PUT_EQUIP";
      
      public static const UI_STONE_PANEL_ABRUPTION_GET_EQUIP:String = "UI_STONE_PANEL_ABRUPTION_GET_EQUIP";
      
      public static const UI_STONE_PANEL_ABRUPTION_YUZHAO_ISUSE:String = "UI_STONE_PANEL_ABRUPTION_YUZHAO_ISUSE";
      
      public static const UI_STONE_PANEL_ABRUPTION_LUCK_STONE_COUNT:String = "UI_STONE_PANEL_ABRUPTION_LUCK_STONE_COUNT";
      
      public static const UI_STONE_PANEL_ABRUPTION_START:String = "UI_STONE_PANEL_ABRUPTION_START";
      
      public static const UI_STONE_PANEL_EXCHANGE_SHOW:String = "UI_STONE_PANEL_EXCHANGE_SHOW";
      
      public static const UI_STONE_PANEL_EXCHANGE_OK:String = "UI_STONE_PANEL_EXCHANGE_OK";
      
      public static const UI_STONE_PANEL_TIME_MAKE_SHOW:String = "UI_STONE_PANEL_TIME_MAKE_SHOW";
      
      public static const UI_STONE_PANEL_TIME_MAKE_MAKE_STONE_PUT:String = "UI_STONE_PANEL_TIME_MAKE_MAKE_STONE_PUT";
      
      public static const UI_STONE_PANEL_TIME_MAKE_MAKE_STONE_GET:String = "UI_STONE_PANEL_TIME_MAKE_MAKE_STONE_GET";
      
      public static const UI_STONE_PANEL_TIME_MAKE_MAKE_START:String = "UI_STONE_PANEL_TIME_MAKE_MAKE_START";
      
      public static const UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_PUT:String = "UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_PUT";
      
      public static const UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_GET:String = "UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_GET";
      
      public static const UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_START:String = "UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_START";
      
      public var tabBar:FTabBar;
      
      public var makeCanvas:StoneMakeCanvas;
      
      private var helpCanvas:StoneHelpCanvas;
      
      private var stoneInnate:StoneInnateCanvas;
      
      private var stoneTimeMake:StoneTimeMakeCanvas;
      
      public function StonePanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 327;
         height = 398;
         this.titleText = LanResManager.getLanCommonTextWords("宝石工艺");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.makeCanvas = new StoneMakeCanvas();
         this.makeCanvas.visible = false;
         this.makeCanvas.$parent = this;
         addChild(this.makeCanvas);
         this.makeCanvas.x = 10;
         this.makeCanvas.y = 22;
         this.helpCanvas = new StoneHelpCanvas();
         this.helpCanvas.visible = false;
         addChild(this.helpCanvas);
         this.helpCanvas.x = 10;
         this.helpCanvas.y = 22;
         this.stoneInnate = new StoneInnateCanvas();
         addChild(this.stoneInnate);
         this.stoneInnate.visible = false;
         this.stoneInnate.$parent = this;
         this.stoneInnate.x = 10;
         this.stoneInnate.y = 22;
         this.stoneTimeMake = new StoneTimeMakeCanvas();
         addChild(this.stoneTimeMake);
         this.stoneTimeMake.visible = false;
         this.stoneTimeMake.$parent = this;
         this.stoneTimeMake.x = 10;
         this.stoneTimeMake.y = 22;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.makeCanvas.bg);
         _loc1_.push(this.stoneTimeMake.bg);
         DynamicManageImages = _loc1_;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("宝石合成"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("宝石镶嵌与摘除"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("宝石合成"):
               dispatchEvent(new BaseEvent(UI_STONE_PANEL_MAKE_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("限时兑换"):
               dispatchEvent(new BaseEvent(UI_STONE_PANEL_EXCHANGE_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("限时加工"):
               dispatchEvent(new BaseEvent(UI_STONE_PANEL_TIME_MAKE_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("宝石镶嵌与摘除"):
               this.showHelp();
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function showMackCanvas() : void
      {
         this.makeCanvas.visible = true;
         this.makeCanvas.reset();
         this.helpCanvas.visible = false;
         this.stoneInnate.visible = false;
         this.stoneTimeMake.visible = false;
      }
      
      public function setBingStone(param1:Goods = null, param2:String = "", param3:Boolean = true) : void
      {
         this.makeCanvas.setBingStone(param1,param2,param3);
      }
      
      public function showHelp() : void
      {
         this.helpCanvas.visible = true;
         this.makeCanvas.visible = false;
         this.stoneInnate.visible = false;
         this.stoneTimeMake.visible = false;
      }
      
      public function showExchange() : void
      {
         this.helpCanvas.visible = false;
         this.makeCanvas.visible = false;
         this.stoneInnate.visible = true;
         this.stoneTimeMake.visible = false;
      }
      
      public function setExchangeStone(param1:Array) : void
      {
         this.stoneInnate.setStone(param1);
      }
      
      public function isShowExchangeLabel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.tabBar.getButtonByLabel(LanResManager.getLanCommonTextWords("限时兑换")) != null)
            {
               return;
            }
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("限时兑换"),this.onTabClick);
         }
         else
         {
            this.tabBar.subButtonByLabel(LanResManager.getLanCommonTextWords("限时兑换"));
         }
      }
      
      public function showTimeMake() : void
      {
         this.helpCanvas.visible = false;
         this.makeCanvas.visible = false;
         this.stoneInnate.visible = false;
         this.stoneTimeMake.visible = true;
      }
      
      public function setMakeStone(param1:Goods) : void
      {
         this.stoneTimeMake.setMakeStone(param1);
      }
      
      public function setChangeStone(param1:Goods) : void
      {
         this.stoneTimeMake.setChangeStone(param1);
      }
      
      public function setChangeMaterial(param1:Goods, param2:Boolean) : void
      {
         this.stoneTimeMake.setChangeMaterial(param1,param2);
      }
      
      public function setChangeStones(param1:Array) : void
      {
         this.stoneTimeMake.setChangeStones(param1);
      }
      
      public function isShowTimeMakeLabel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.tabBar.getButtonByLabel(LanResManager.getLanCommonTextWords("限时加工")) != null)
            {
               return;
            }
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("限时加工"),this.onTabClick);
         }
         else
         {
            this.tabBar.subButtonByLabel(LanResManager.getLanCommonTextWords("限时加工"));
         }
      }
   }
}

