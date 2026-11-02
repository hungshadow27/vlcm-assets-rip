package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.shell.view.components.map.MapPortalPanel;
   import com.tgame.shell.view.components.map.SmallMapCanvas;
   import com.tgame.shell.view.components.map.WorldMapCanvas;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class PopMapPanel extends FPanel
   {
      
      public static const MENU_NPC_CLICK:String = "MENU_NPC_CLICK";
      
      public static const TASK_NPC_CLICK:String = "TASK_NPC_CLICK";
      
      public static const BUSINESS_NPC_CLICK:String = "GOTO_POINT_NPC_CLICK";
      
      public static const GOTO_POINT_CLICK:String = "GOTO_POINT_CLICK";
      
      public static const MONSTER_POINT_CLICK:String = "MONSTER_POINT_CLICK";
      
      public static const UI_MAP_WORLDMAP_MAP_NAME_BTN_CLICK:String = "UI_MAP_WORLDMAP_MAP_NAME_BTN_CLICK";
      
      public static const UI_MAP_WORLDMAP_PORTAL_OK:String = "UI_MAP_WORLDMAP_PORTAL_OK";
      
      public static const UI_MAP_WORLDMAP_WALK_OK:String = "UI_MAP_WORLDMAP_WALK_OK";
      
      private var tabBar:FTabBar;
      
      private var smallMapContainer:SmallMapCanvas;
      
      private var worldMpaContainer:WorldMapCanvas;
      
      public function PopMapPanel()
      {
         super();
         dragAble = true;
         this.skin = "sceondPanel";
         this.showCloseButton = true;
         width = 646;
         height = 463;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.smallMapContainer = new SmallMapCanvas();
         this.smallMapContainer.$parent = this;
         addChild(this.smallMapContainer);
         this.smallMapContainer.x = 6;
         this.smallMapContainer.y = 22;
         this.worldMpaContainer = new WorldMapCanvas();
         this.worldMpaContainer.$parent = this;
         addChild(this.worldMpaContainer);
         this.worldMpaContainer.x = 6;
         this.worldMpaContainer.y = 22;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanTextWords(this,"当前地图"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanTextWords(this,"世界地图"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 6;
         this.tabBar.y = 2;
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanTextWords(this,"当前地图"):
               this.smallMapContainer.visible = true;
               this.worldMpaContainer.visible = false;
               break;
            case LanResManager.getLanTextWords(this,"世界地图"):
               this.smallMapContainer.visible = false;
               this.worldMpaContainer.visible = true;
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setMapName(param1:String) : void
      {
         this.smallMapContainer.mapName.htmlText = LanResManager.getLanTextWords(this,"当前地图") + param1;
      }
      
      public function setMap(param1:BitmapData) : void
      {
         this.smallMapContainer.setMap(param1);
      }
      
      public function setNpcList(param1:XML) : void
      {
         this.smallMapContainer.dataProvider = param1;
      }
      
      public function setCharXY(param1:Point) : void
      {
         this.smallMapContainer.setCharXY(param1);
      }
      
      public function setCharDirection(param1:Number) : void
      {
         this.smallMapContainer.setCharDirection(param1);
      }
      
      public function setOtherPlayer(param1:Array) : void
      {
         this.smallMapContainer.setOtherPlayer(param1);
      }
      
      public function setTeamMebmer(param1:Array) : void
      {
         this.smallMapContainer.setTeamMebmer(param1);
      }
      
      public function setMonster(param1:Array) : void
      {
         this.smallMapContainer.setMonster(param1);
      }
      
      public function setNPC(param1:Array) : void
      {
         this.smallMapContainer.setNPC(param1);
      }
      
      public function setBusinessNPC(param1:Array) : void
      {
         this.smallMapContainer.setBusinessNPC(param1);
      }
      
      public function setTaskNPC(param1:Array) : void
      {
         this.smallMapContainer.setTaskNPC(param1);
      }
      
      public function setFunctionNPC(param1:Array) : void
      {
         this.smallMapContainer.setFunctionNPC(param1);
      }
      
      public function setPortal(param1:Array) : void
      {
         this.smallMapContainer.setPortal(param1);
      }
      
      public function setTaskNPCState(param1:Array, param2:Array, param3:Array) : void
      {
         this.smallMapContainer.setTaskState(param1,param2,param3);
      }
      
      public function setCharOnWorldMap(param1:String) : void
      {
         this.worldMpaContainer.setChar(param1);
      }
      
      public function showMapPortalPanel(param1:int, param2:String, param3:String, param4:String, param5:String, param6:String, param7:String, param8:String, param9:int) : void
      {
         var _loc10_:MapPortalPanel = new MapPortalPanel();
         _loc10_.$parent = this;
         _loc10_.setMapInfo(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         POPWindowManager.showWindow(_loc10_);
      }
      
      public function drawPath(param1:Array) : void
      {
         this.smallMapContainer.drawPath(param1);
      }
      
      public function addBangQi(param1:Point, param2:int, param3:Array, param4:Boolean) : void
      {
         this.smallMapContainer.addBangQi(param1,param2,param3,param4);
      }
      
      public function removeBangQi(param1:int) : void
      {
         this.smallMapContainer.removeBangQi(param1);
      }
      
      public function removeAllBangQi() : void
      {
         this.smallMapContainer.removeAllBangQi();
      }
      
      public function setWuQi(param1:Object = null) : void
      {
         this.smallMapContainer.setWuQi(param1);
      }
      
      public function setXiuQiu(param1:Object = null) : void
      {
         this.smallMapContainer.setXiuQiu(param1);
      }
      
      public function setRenShenTianDi(param1:Array) : void
      {
         this.smallMapContainer.setRenShenTianDi(param1);
      }
      
      public function setRenShenTianDi3v3(param1:Array) : void
      {
         this.smallMapContainer.setRenShenTianDi3v3(param1);
      }
      
      public function setBiaoChe(param1:Object = null) : void
      {
         this.smallMapContainer.setBiaoChe(param1);
      }
   }
}

