package com.tgame.shell.view.components.ride
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.manager.NoticeManager;
   import com.tgame.shell.view.components.ride.resetSkill.RideSkillListPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.*;
   import flash.geom.Rectangle;
   
   public class FengLeiShouPanel extends FPanel
   {
      
      public static const UI_RIDE_FENGLEISHOU_DUIHUAN:String = "UI_RIDE_FENGLEISHOUDUIHUAN";
      
      public static const UI_RIDE_MOUNT_SETLECT:String = "UI_RIDE_MOUNT_SETLECT";
      
      public static const UI_NEXT_MOUNT_BTN:String = "UI_NEXT_MOUNT_BTN";
      
      private var _avatar:Bitmap;
      
      private var _mask:Shape;
      
      private var skillContainer:Sprite;
      
      private var title:FLabel;
      
      public var rideList:FList;
      
      private var scroll:FVScorllBar;
      
      private var rideName:FLabel;
      
      private var shuXingLable:FLabel;
      
      private var level:FLabel;
      
      private var okBtn:SecondButton;
      
      private var listPanel:RideSkillListPanel;
      
      private var bmp:Bitmap;
      
      private var bg9:F9GridBitmap;
      
      public var shuXingFta:FTextArea;
      
      private var goodsNeed:FTextArea;
      
      private var goodsCount:FTextArea;
      
      private var ft_Name1:FTextArea;
      
      private var ft_Value1:FTextArea;
      
      private var ft_Name2:FTextArea;
      
      private var ft_Value2:FTextArea;
      
      private var ft_Name3:FTextArea;
      
      private var ft_Value3:FTextArea;
      
      private var qingLongBtn:NewSkinButton;
      
      private var baiHuBtn:NewSkinButton;
      
      private var zhuQueBtn:NewSkinButton;
      
      private var xuanWuBtn:NewSkinButton;
      
      public var duiHuanType:int = 0;
      
      public function FengLeiShouPanel()
      {
         var container:Sprite;
         var fb:FLabel;
         var bg:DisplayObject = null;
         var fta:FTextArea = null;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 423 + 150 + 20 + 20 - 10 + 1;
         height = 433 - 200 + 30 + 100 + 100 - 10 - 10;
         titleText = LanResManager.getLanCommonTextWords("坐骑幻化");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/supermount/bg.swf");
         bg.x = 8;
         bg.y = 2;
         addChild(bg);
         container = new Sprite();
         addChild(container);
         container.x = 10;
         container.y = 22;
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
         this.rideList.listWidth = 150;
         container.addChild(this.rideList);
         this.rideList.x = 5;
         this.rideList.y = 0;
         this.rideList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.scroll = new FVScorllBar(this.rideList,142);
         container.addChild(this.scroll);
         this.scroll.x = 156;
         this.scroll.y = 0;
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
         fta = new FTextArea();
         fta.width = 140;
         fta.height = 150;
         fta.wordWrap = true;
         fta.x = 30;
         fta.y = 200;
         fta.htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("血兽等级达到200级时可使用风雷丹激活风雷兽坐骑，风雷丹可在【卧虎藏龙】功勋商店中，使用功勋购买。进阶风雷兽可继承原血兽的所有属性。") + "</font></textformat>";
         addChild(fta);
         this.qingLongBtn = new NewSkinButton();
         this.qingLongBtn.skin = "fengLeiShouQingLong_Button";
         this.qingLongBtn.x = 202;
         this.qingLongBtn.y = 10;
         addChild(this.qingLongBtn);
         this.qingLongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.baiHuBtn = new NewSkinButton();
         this.baiHuBtn.skin = "fengLeiShouBaiHu_Button";
         this.baiHuBtn.x = this.qingLongBtn.x + 95;
         this.baiHuBtn.y = 10;
         addChild(this.baiHuBtn);
         this.baiHuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zhuQueBtn = new NewSkinButton();
         this.zhuQueBtn.skin = "fengLeiShouZhuQue_Button";
         this.zhuQueBtn.x = this.baiHuBtn.x + 95;
         this.zhuQueBtn.y = 10;
         addChild(this.zhuQueBtn);
         this.zhuQueBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.xuanWuBtn = new NewSkinButton();
         this.xuanWuBtn.skin = "fengLeiShouXuanWu_Button";
         this.xuanWuBtn.x = this.zhuQueBtn.x + 95;
         this.xuanWuBtn.y = 10;
         addChild(this.xuanWuBtn);
         this.xuanWuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         fb = new FLabel();
         with(fb)
         {
            x = 198;
            y = 152;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("名称");
         }
         this.rideName = new FLabel();
         with(this.rideName)
         {
            x = 230;
            y = 152;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("名称");
         }
         fb = new FLabel();
         with(fb)
         {
            x = 338;
            y = 152;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         this.level = new FLabel();
         with(this.level)
         {
            x = 368;
            y = 152;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "11";
         }
         this.goodsNeed = new FTextArea();
         this.goodsNeed.x = 320 - 20 - 25;
         this.goodsNeed.y = 250;
         this.goodsNeed.width = 200 + 50;
         this.goodsNeed.htmlText = "<textformat leading=\'12\'><font size=\'16\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活需要风雷丹：") + "</font></textformat>";
         addChild(this.goodsNeed);
         this.goodsCount = new FTextArea();
         this.goodsCount.x = 260;
         this.goodsCount.y = 370;
         this.goodsCount.width = 155;
         this.goodsCount.htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("风雷丹总数：") + "</font></textformat>";
         addChild(this.goodsCount);
         fta = new FTextArea();
         with(fta)
         {
            x = 205;
            y = 290;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("基础属性") + "</font></textformat>";
         }
         this.ft_Name1 = new FTextArea();
         this.ft_Name1.x = 220;
         this.ft_Name1.y = 315;
         this.ft_Name1.htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击") + "<br>" + LanResManager.getLanCommonTextWords("闪避") + "<br>" + "</font></textformat>";
         this.ft_Name2 = new FTextArea();
         this.ft_Name2.x = this.ft_Name1.x + 140;
         this.ft_Name2.y = this.ft_Name1.y;
         this.ft_Name2.htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御") + "<br>" + LanResManager.getLanCommonTextWords("生命") + "<br>" + "</font></textformat>";
         this.ft_Name3 = new FTextArea();
         this.ft_Name3.x = this.ft_Name2.x + 140;
         this.ft_Name3.y = this.ft_Name1.y;
         this.ft_Name3.htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("暴击") + "<br>" + "</font></textformat>";
         this.ft_Value1 = new FTextArea();
         this.ft_Value1.x = this.ft_Name1.x + 30;
         this.ft_Value1.y = this.ft_Name1.y;
         this.ft_Value2 = new FTextArea();
         this.ft_Value2.x = this.ft_Name2.x + 30;
         this.ft_Value2.y = this.ft_Name1.y;
         this.ft_Value3 = new FTextArea();
         this.ft_Value3.x = this.ft_Name3.x + 30;
         this.ft_Value3.y = this.ft_Name1.y;
         this.okBtn = new SecondButton();
         with(this.okBtn)
         {
            label = LanResManager.getLanCommonTextWords("激活风雷兽");
            x = 420;
            y = 370;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.okBtn);
      }
      
      public function setAddValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         this.ft_Value1.htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>+" + param1 + "<br>+" + param5 + "</font></textformat>";
         this.ft_Value2.htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>+" + param2 + "<br>+" + param3 + "</font></textformat>";
         this.ft_Value3.htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>+" + param4 + "</font></textformat>";
      }
      
      private function reset() : void
      {
         this.rideName.text = "";
         this.level.text = "";
         this.ft_Value1.htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>0<br>0</font></textformat>";
         this.ft_Value2.htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>0<br>0</font></textformat>";
         this.ft_Value3.htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>0</font></textformat>";
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
               if(this.rideList == null || this.rideList.selectItem == null)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请先选择坐骑"));
                  break;
               }
               FAlert.show("<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("是否幻化风雷兽") + "</textformat>","",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     dispatchEvent(new BaseEvent(UI_RIDE_FENGLEISHOU_DUIHUAN,"",[int(rideList.selectItem.label),duiHuanType]));
                  }
               });
               break;
            case this.qingLongBtn:
               this.duiHuanType = 0;
               dispatchEvent(new BaseEvent(UI_NEXT_MOUNT_BTN,"",0));
               break;
            case this.baiHuBtn:
               this.duiHuanType = 1;
               dispatchEvent(new BaseEvent(UI_NEXT_MOUNT_BTN,"",1));
               break;
            case this.zhuQueBtn:
               this.duiHuanType = 2;
               dispatchEvent(new BaseEvent(UI_NEXT_MOUNT_BTN,"",2));
               break;
            case this.xuanWuBtn:
               this.duiHuanType = 3;
               dispatchEvent(new BaseEvent(UI_NEXT_MOUNT_BTN,"",3));
         }
      }
      
      private function onListClick(param1:MouseEvent = null) : void
      {
         this.reset();
         if(this.rideList == null || !this.rideList.selectItem)
         {
            return;
         }
         dispatchEvent(new BaseEvent(UI_RIDE_MOUNT_SETLECT,"",int(this.rideList.selectItem.nextId)));
      }
      
      public function setRidelist(param1:XML, param2:String) : void
      {
         this.reset();
         this.rideList.dataProvider = param1;
         if(param1.children().length() > 0)
         {
            this.rideList.setSelectItemByIndex(0);
            if(!this.rideList.selectItem)
            {
               return;
            }
            dispatchEvent(new BaseEvent(UI_RIDE_MOUNT_SETLECT,"",int(this.rideList.selectItem.nextId)));
         }
         this.scroll.update();
      }
      
      public function setRide(param1:String, param2:int) : void
      {
         this.rideName.text = param1;
         this.level.text = "" + param2;
      }
      
      public function setGoods(param1:String, param2:int, param3:int) : void
      {
         this.goodsCount.htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + LanResManager.getLanCommonTextWords("总数：") + param3 + "</font></textformat>";
         this.goodsNeed.htmlText = "<textformat leading=\'12\'><font size=\'16\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活需要") + "：" + param2 + "</font></textformat>";
      }
      
      public function setDuiHuanType(param1:int) : void
      {
         this.duiHuanType = param1;
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
         this._avatar.y = -20 + (_loc3_ - this._avatar.height) / 2 + 80;
         this._avatar.x = 150 + (_loc2_ - this._avatar.width) / 2 + 20;
      }
   }
}

