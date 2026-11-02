package com.tgame.shell.view.components.ride
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.ride.resetSkill.RideSkillListPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.*;
   import flash.geom.Rectangle;
   
   public class YueGuangBaoHePanel extends FPanel
   {
      
      public static const UI_RIDE_CHONGXINNIEPAN:String = "UI_RIDE_CHONGXINNIEPAN";
      
      public static const UI_RIDE_MOUNT_SETLECT:String = "UI_RIDE_MOUNT_SETLECT";
      
      private var _avatar:Bitmap;
      
      private var _mask:Shape;
      
      private var skillContainer:Sprite;
      
      private var title:FLabel;
      
      public var rideList:FList;
      
      private var scroll:FVScorllBar;
      
      private var rideName:FLabel;
      
      private var level:FLabel;
      
      private var okBtn:SecondButton;
      
      private var listPanel:RideSkillListPanel;
      
      private var bmp:Bitmap;
      
      private var bg9:F9GridBitmap;
      
      public function YueGuangBaoHePanel()
      {
         var container:Sprite;
         var box:FCanvas = null;
         var fb:FLabel = null;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 423 + 150;
         height = 433 - 200 + 30;
         titleText = LanResManager.getLanCommonTextWords("月光宝盒");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         box = new FCanvas();
         addChild(box);
         box.skin = "box_transparence";
         box.width = 165;
         box.height = 120;
         box.x = 12;
         box.y = 45;
         this.bg9 = Tools.get9GridBitmpByName("ride9_bg");
         this.bg9.width = 388;
         this.bg9.height = 180;
         this.bg9.x = 174;
         this.bg9.y = 2;
         addChild(this.bg9);
         container = new Sprite();
         addChild(container);
         container.x = 10;
         container.y = 22;
         fb = new FLabel();
         with(fb)
         {
            x = 15;
            y = 5;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("请选择您要重新涅槃的坐骑");
         }
         addChild(fb);
         this._avatar = new Bitmap();
         container.addChild(this._avatar);
         this._avatar.mask = this._mask;
         this.title = new FLabel();
         this.title.textColor = 16777215;
         this.title.selectable = false;
         container.addChild(this.title);
         this.title.x = 15;
         this.title.y = 3;
         this.rideList = new FList();
         this.rideList.skin = "list";
         this.rideList.itemRenderer = new RideListRender();
         this.rideList.listWidth = 142;
         container.addChild(this.rideList);
         this.rideList.x = 5;
         this.rideList.y = 28;
         this.rideList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.scroll = new FVScorllBar(this.rideList,112);
         container.addChild(this.scroll);
         this.scroll.x = 148;
         this.scroll.y = 28;
         fb = new FLabel();
         with(fb)
         {
            x = 20;
            y = 4;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         fb.text = LanResManager.getLanTextWords(this,0);
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 198;
            y = 152;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("名称");
         }
         addChild(fb);
         this.rideName = new FLabel();
         with(this.rideName)
         {
            x = 230;
            y = 152;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("名称");
         }
         addChild(this.rideName);
         fb = new FLabel();
         with(fb)
         {
            x = 338;
            y = 152;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         addChild(fb);
         this.level = new FLabel();
         with(this.level)
         {
            x = 368;
            y = 152;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "11";
         }
         addChild(this.level);
         this.okBtn = new SecondButton();
         with(this.okBtn)
         {
            label = LanResManager.getLanCommonTextWords("重新进入涅槃");
            x = 260;
            y = 195;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.okBtn);
      }
      
      private function reset() : void
      {
         this.rideName.text = "";
         this.level.text = "";
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         switch(e.target)
         {
            case this.okBtn:
               FAlert.show("<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("是否重新涅槃") + "</textformat>","",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     dispatchEvent(new BaseEvent(UI_RIDE_CHONGXINNIEPAN,"",int(rideList.selectItem.label)));
                  }
               });
         }
      }
      
      private function onListClick(param1:MouseEvent = null) : void
      {
         this.reset();
         if(!this.rideList.selectItem)
         {
            return;
         }
         dispatchEvent(new BaseEvent(UI_RIDE_MOUNT_SETLECT,"",int(this.rideList.selectItem.label)));
      }
      
      public function setRidelist(param1:XML, param2:String) : void
      {
         this.reset();
         this.rideList.dataProvider = param1;
         this.title.text = LanResManager.getLanCommonTextWords("拥有坐骑：") + param2;
         if(param1.children().length() > 0)
         {
            this.rideList.setSelectItemByIndex(0);
            if(!this.rideList.selectItem)
            {
               return;
            }
         }
         this.scroll.update();
      }
      
      public function setRide(param1:String, param2:int) : void
      {
         this.rideName.text = param1;
         this.level.text = param2.toString();
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         this._avatar.scaleX = this._avatar.scaleY = 1;
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         var _loc2_:int = 365;
         var _loc3_:int = 180;
         var _loc4_:Rectangle = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
         if(_loc4_.width > _loc2_ || _loc4_.height > _loc3_)
         {
            _loc5_ = _loc2_ / _loc4_.width;
            _loc6_ = _loc3_ / _loc4_.height;
            if(_loc5_ > _loc6_)
            {
               this._avatar.scaleX = this._avatar.scaleY = _loc6_;
            }
            else
            {
               this._avatar.scaleX = this._avatar.scaleY = _loc5_;
            }
         }
         this._avatar.y = -20 + (_loc3_ - this._avatar.height) / 2;
         this._avatar.x = 150 + (_loc2_ - this._avatar.width) / 2;
      }
   }
}

