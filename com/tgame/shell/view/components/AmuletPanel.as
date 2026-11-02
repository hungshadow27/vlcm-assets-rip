package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.HelpManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.amulet.AmuletMakeCanvas;
   import com.tgame.shell.view.components.amulet.ResetGestCanvas;
   import com.tgame.shell.view.components.amulet.SheliziMakeCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class AmuletPanel extends FPanel
   {
      
      public static const UI_AMULET_PANEL_MAKE_SHOW:String = "UI_AMULET_PANEL_MAKE_SHOW";
      
      public static const UI_AMULET_PANEL_SHELIZI_SHOW:String = "UI_AMULET_PANEL_SHELIZI_SHOW";
      
      public static const UI_AMULET_PANEL_RESETGEST_SHOW:String = "UI_AMULET_PANEL_RESETGEST_SHOW";
      
      public static const UI_AMULET_PANEL_MAKE_PUT_STONE:String = "UI_AMULET_PANEL_MAKE_PUT_STONE";
      
      public static const UI_AMULET_PANEL_MAKE_GET_STONE:String = "UI_AMULET_PANEL_MAKE_GET_STONE";
      
      public static const UI_AMULET_PANEL_MAKE_START:String = "UI_AMULET_PANEL_MAKE_START";
      
      public static const UI_SHELIZI_PANEL_MAKE_PUT_STONE:String = "UI_SHELIZI_PANEL_MAKE_PUT_STONE";
      
      public static const UI_SHELIZI_PANEL_MAKE_GET_STONE:String = "UI_SHELIZI_PANEL_MAKE_GET_STONE";
      
      public static const UI_SHELIZI_PANEL_MAKE_START:String = "UI_SHELIZI_PANEL_MAKE_START";
      
      public static const UI_RESERGEST_PANEL_MAKE_PUT_STONE:String = "UI_RESERGEST_PANEL_MAKE_PUT_STONE";
      
      public static const UI_RESERGEST_PANEL_MAKE_GET_STONE:String = "UI_RESERGEST_PANEL_MAKE_GET_STONE";
      
      public static const UI_RESERGEST_PANEL_MAKE_START:String = "UI_RESERGEST_PANEL_MAKE_START";
      
      public static const UI_RESERGEST_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT:String = "UI_RESERGEST_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT";
      
      public var tabBar:FTabBar;
      
      public var amuletmakeCanvas:AmuletMakeCanvas;
      
      public var shelizimakeCanvas:SheliziMakeCanvas;
      
      public var resetgestCanvas:ResetGestCanvas;
      
      public function AmuletPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 327;
         height = 398;
         this.titleText = LanResManager.getLanCommonTextWords("舍利子炼制");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.amuletmakeCanvas = new AmuletMakeCanvas();
         this.amuletmakeCanvas.visible = false;
         this.amuletmakeCanvas.$parent = this;
         addChild(this.amuletmakeCanvas);
         this.amuletmakeCanvas.x = 10;
         this.amuletmakeCanvas.y = 22;
         this.shelizimakeCanvas = new SheliziMakeCanvas();
         this.shelizimakeCanvas.visible = false;
         this.shelizimakeCanvas.$parent = this;
         addChild(this.shelizimakeCanvas);
         this.shelizimakeCanvas.x = 10;
         this.shelizimakeCanvas.y = 22;
         this.resetgestCanvas = new ResetGestCanvas();
         this.resetgestCanvas.visible = false;
         this.resetgestCanvas.$parent = this;
         addChild(this.resetgestCanvas);
         this.resetgestCanvas.x = 10;
         this.resetgestCanvas.y = 22;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.amuletmakeCanvas.bg);
         _loc1_.push(this.shelizimakeCanvas.bg);
         _loc1_.push(this.resetgestCanvas.bg);
         DynamicManageImages = _loc1_;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("护身符进阶合成"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("舍利子进阶合成"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("重置武功类型"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("护身符进阶合成"):
               this.showAmuletMakeCanvas();
               dispatchEvent(new BaseEvent(UI_AMULET_PANEL_MAKE_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("舍利子进阶合成"):
               this.showSheliziMakeCanvas();
               dispatchEvent(new BaseEvent(UI_AMULET_PANEL_SHELIZI_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("重置武功类型"):
               this.showResetGestCanvas();
               dispatchEvent(new BaseEvent(UI_AMULET_PANEL_RESETGEST_SHOW));
         }
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_HUSHENFU_HECHENG);
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_SELIZI_HECHENG);
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_KUNGFU_RESET);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_HUSHENFU_HECHENG);
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_SELIZI_HECHENG);
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_KUNGFU_RESET);
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function showAmuletMakeCanvas() : void
      {
         this.amuletmakeCanvas.visible = true;
         this.amuletmakeCanvas.reset();
         this.shelizimakeCanvas.visible = false;
         this.resetgestCanvas.visible = false;
         this.titleText = LanResManager.getLanCommonTextWords("舍利子炼制");
      }
      
      public function showSheliziMakeCanvas() : void
      {
         this.amuletmakeCanvas.visible = false;
         this.shelizimakeCanvas.visible = true;
         this.shelizimakeCanvas.reset();
         this.resetgestCanvas.visible = false;
         this.titleText = LanResManager.getLanCommonTextWords("舍利子镶嵌与取出");
         this.shelizimakeCanvas.updateData();
      }
      
      public function showResetGestCanvas() : void
      {
         this.amuletmakeCanvas.visible = false;
         this.shelizimakeCanvas.visible = false;
         this.resetgestCanvas.visible = true;
         this.titleText = LanResManager.getLanCommonTextWords("舍利子镶嵌与取出");
         this.resetgestCanvas.reset();
      }
      
      public function setHushenfu(param1:Goods = null, param2:Goods = null) : void
      {
         this.amuletmakeCanvas.setHushenfu(param1,param2);
      }
      
      public function setHushenfuData(param1:int, param2:Boolean, param3:int, param4:Boolean, param5:int) : void
      {
         this.amuletmakeCanvas.setData(param1,param2,param3,param4,param5);
      }
      
      public function setHushenfuLingzhu(param1:int = 0, param2:Goods = null) : void
      {
         this.amuletmakeCanvas.setLingzhu(param1,param2);
      }
      
      public function setShelizi(param1:Goods = null, param2:Goods = null) : void
      {
         this.shelizimakeCanvas.setShelizi(param1,param2);
      }
      
      public function setSheliziData(param1:int, param2:Boolean, param3:int, param4:Boolean, param5:int) : void
      {
         this.shelizimakeCanvas.setData(param1,param2,param3,param4,param5);
      }
      
      public function setSheliziLingzhu(param1:int = 0, param2:Goods = null) : void
      {
         this.shelizimakeCanvas.setLingzhu(param1,param2);
      }
      
      public function setResetgestMaterial(param1:Goods = null, param2:Goods = null) : void
      {
         this.resetgestCanvas.setMaterial(param1,param2);
      }
      
      public function setResetgestData(param1:int, param2:Boolean, param3:int, param4:Boolean, param5:int) : void
      {
         this.resetgestCanvas.setData(param1,param2,param3,param4,param5);
      }
      
      public function setResetgestShelizi(param1:Goods = null) : void
      {
         this.resetgestCanvas.setShelizi(param1);
      }
   }
}

