package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.shell.view.components.attribute.TAVenationCanvas;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class TAVenationPanel extends FPanel
   {
      
      public static const UI_TA_GETVENATION:String = "UI_TA_GETVENATION";
      
      public static const UI_TA_VENATION_EVENT_CLICK:String = "UI_TA_VENATION_EVENT_CLICK";
      
      public static const UI_TA_VENATION_GET_POINT_ATTRIBUTE:String = "UI_TA_VENATION_GET_POINT_ATTRIBUTE";
      
      private var tabBar:FTabBar;
      
      private var venationContainer:TAVenationCanvas;
      
      public function TAVenationPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 425;
         height = 436;
         this.titleText = LanResManager.getLanCommonTextWords("人物属性");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.venationContainer = new TAVenationCanvas();
         this.venationContainer.$parent = this;
         addChild(this.venationContainer);
         this.venationContainer.x = 10;
         this.venationContainer.y = 22;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.venationContainer.bgImg);
         _loc1_.push(this.venationContainer.bgImg1);
         this.DynamicManageImages = _loc1_;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("TA的经脉"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("TA的经脉"):
               dispatchEvent(new Event(UI_TA_GETVENATION));
         }
      }
      
      public function showVenation(param1:Array, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false) : void
      {
         this.venationContainer.visible = true;
         this.venationContainer.setIsZhenLong(param5);
         this.venationContainer.showAll(param1,param2,param3);
      }
      
      public function show_1(param1:int, param2:Boolean, param3:String) : void
      {
         this.venationContainer.showYangWei(param1,param2,param3);
      }
      
      public function show_2(param1:int, param2:Boolean, param3:String) : void
      {
         this.venationContainer.showYinWei(param1,param2,param3);
      }
      
      public function show_3(param1:int, param2:Boolean, param3:String) : void
      {
         this.venationContainer.showYangQiao(param1,param2,param3);
      }
      
      public function show_4(param1:int, param2:Boolean, param3:String) : void
      {
         this.venationContainer.showYinQiao(param1,param2,param3);
      }
      
      public function show_5(param1:int, param2:Boolean, param3:String) : void
      {
         this.venationContainer.showDai(param1,param2,param3);
      }
      
      public function show_6(param1:int, param2:Boolean, param3:String) : void
      {
         this.venationContainer.showCong(param1,param2,param3);
      }
      
      public function show_7(param1:int, param2:Boolean, param3:String) : void
      {
         this.venationContainer.showRen(param1,param2,param3);
      }
      
      public function show_8(param1:int, param2:Boolean, param3:String) : void
      {
         this.venationContainer.showDu(param1,param2,param3);
      }
      
      public function setVenationAddValue(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         this.venationContainer.setAddValue(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setVenationExpAddValue(param1:int, param2:Number) : void
      {
         this.venationContainer.setExpAddValue(param1,param2);
      }
      
      public function setVenationPointAttribute(param1:String, param2:String, param3:int) : void
      {
         this.venationContainer.setPointAttribute(param1,param2,param3);
      }
   }
}

