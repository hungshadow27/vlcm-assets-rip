package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.ride.RideListRender;
   import com.tgame.shell.view.components.ride.resetSkill.RideSkillListPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.*;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.*;
   
   public class RideYinCangShuXingJiHuoPanel extends FPanel
   {
      
      public static const UI_RIDE_SKILL_RESET_SETLECT:String = "UI_RIDE_SKILL_RESET_SETLECT";
      
      public static const UI_RIDE_YINCANG_SHUXING_JIHUO:String = "UI_RIDE_YINCANG_SHUXING_JIHUO";
      
      private var _avatar:Bitmap;
      
      private var _mask:Shape;
      
      private var dreamBar:DreamBar;
      
      private var equipContainer:Sprite;
      
      private var title:FLabel;
      
      public var rideList:FList;
      
      private var scroll:FVScorllBar;
      
      private var dreamValue:FTextArea;
      
      private var rideName:FLabel;
      
      private var level:FLabel;
      
      private var skillDesc:FTextArea;
      
      private var okBtn:SecondButton;
      
      private var listPanel:RideSkillListPanel;
      
      private var headContainer:Sprite;
      
      private var headImg:Bitmap;
      
      private var headTipCanvas:FCanvas;
      
      private var solt:Bitmap;
      
      private var intYinCangShuXingJiHuo:int = 0;
      
      private var txtYinCangShuxingJihuo:FTextArea;
      
      private var anju:int = 0;
      
      private var jiangsheng:int = 0;
      
      private var jiaodeng:int = 0;
      
      private var tieti:int = 0;
      
      public function RideYinCangShuXingJiHuoPanel()
      {
         var bg:DisplayObject;
         var container:Sprite;
         var fb:FLabel;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 423;
         height = 244;
         titleText = LanResManager.getLanCommonTextWords("坐骑隐藏属性激活");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/yincang.shuxing.jihuo.swf");
         bg.x = 10;
         bg.y = 22 - 22;
         addChild(bg);
         switch(OtherConst.mount_add_count)
         {
            case 0:
               break;
            case 1:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 102 + 175;
               this.solt.y = 65 + 23 - 22;
               addChild(this.solt);
               break;
            case 2:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175 + 10;
               this.solt.y = 65 + 23 - 22;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 175 - 10;
               this.solt.y = 65 + 23 - 22;
               addChild(this.solt);
               break;
            case 3:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175;
               this.solt.y = 65 + 23 - 22;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 102 + 175;
               this.solt.y = 65 + 23 - 22;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 175;
               this.solt.y = 65 + 23 - 22;
               addChild(this.solt);
               break;
            case 4:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175;
               this.solt.y = 65 + 23 - 22;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 102 + 175;
               this.solt.y = 65 + 23 - 22;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 175;
               this.solt.y = 65 + 23 - 22;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175;
               this.solt.y = 25 + 23 - 22;
               addChild(this.solt);
               break;
            case 5:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175;
               this.solt.y = 65 + 23 - 22;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 102 + 175;
               this.solt.y = 65 + 23 - 22;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 175;
               this.solt.y = 65 + 23 - 22;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175;
               this.solt.y = 25 + 23 - 22;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 175;
               this.solt.y = 25 + 23 - 22;
               addChild(this.solt);
         }
         container = new Sprite();
         addChild(container);
         container.x = 10;
         container.y = 22 - 22;
         this._avatar = new Bitmap();
         this.title = new FLabel();
         this.title.textColor = 16777215;
         this.title.selectable = false;
         container.addChild(this.title);
         this.title.x = 40;
         this.title.y = 6;
         this.title.text = LanResManager.getLanCommonTextWords("携带数量 0/0");
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
         this.equipContainer = new Sprite();
         container.addChild(this.equipContainer);
         this.equipContainer.x = 175;
         this.equipContainer.y = 23;
         with(this.equipContainer.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,220,80);
            endFill();
         }
         this.dreamBar = new DreamBar();
         container.addChild(this.dreamBar);
         this.dreamBar.y = 105;
         this.dreamBar.x = 286 - this.dreamBar.width / 2;
         fb = new FLabel();
         fb = new FLabel();
         with(fb)
         {
            x = 198;
            y = 152 - 22;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("名称");
         }
         addChild(fb);
         this.rideName = new FLabel();
         with(this.rideName)
         {
            x = 230;
            y = 152 - 22;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("名称");
         }
         addChild(this.rideName);
         fb = new FLabel();
         with(fb)
         {
            x = 338;
            y = 152 - 22;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         addChild(fb);
         this.level = new FLabel();
         with(this.level)
         {
            x = 368;
            y = 152 - 22;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "11";
         }
         addChild(this.level);
         this.skillDesc = new FTextArea();
         with(this.skillDesc)
         {
            x = 12;
            y = 178 - 21;
            width = 400;
            height = 64;
            wordWrap = false;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'8\'>" + LanResManager.getLanCommonTextWords("逆天属性！有几率秒无视对方攻击并反弹伤害（冷却时间分钟）") + "</textformat>";
         }
         addChild(this.skillDesc);
         this.okBtn = new SecondButton();
         with(this.okBtn)
         {
            label = LanResManager.getLanCommonTextWords("激活");
            x = 200;
            y = 198 - 22;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.okBtn);
         this.headContainer = new Sprite();
         this.headContainer.x = 309 - 45 + 15;
         this.headContainer.y = 25 + 23 - 22;
         addChild(this.headContainer);
         this.headContainer.addEventListener(MouseEvent.MOUSE_OVER,this.onHeadMouseTip);
         this.headContainer.addEventListener(MouseEvent.MOUSE_OUT,this.onHeadMouseTip);
         this.headImg = new Bitmap();
         this.headTipCanvas = new FCanvas();
         this.headTipCanvas.skin = "menuBg";
         this.headTipCanvas.addChild(this._avatar);
         this.txtYinCangShuxingJihuo = new FTextArea();
         with(this.txtYinCangShuxingJihuo)
         {
            x = headTipCanvas.x + 7;
            y = headTipCanvas.height + 100;
            autoSize = TextFieldAutoSize.LEFT;
            defaultTextFormat = StaticValue.format;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            visible = false;
            htmlText = "<textformat leading=\'8\'>" + LanResManager.getLanCommonTextWords("【逆天属性】有几率3秒无视对方攻击并") + "<br>" + LanResManager.getLanCommonTextWords("100%反弹伤害（冷却时间10分钟）") + "</textformat>";
         }
      }
      
      private function reset() : void
      {
         while(this.equipContainer.numChildren)
         {
            this.equipContainer.removeChildAt(0);
         }
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
         switch(param1.target)
         {
            case this.okBtn:
               dispatchEvent(new BaseEvent(UI_RIDE_YINCANG_SHUXING_JIHUO));
         }
      }
      
      private function onListClick(param1:MouseEvent = null) : void
      {
         this.reset();
         if(!this.rideList.selectItem)
         {
            return;
         }
         dispatchEvent(new BaseEvent(UI_RIDE_SKILL_RESET_SETLECT,"",int(this.rideList.selectItem.label)));
      }
      
      public function setRidelist(param1:XML, param2:String) : void
      {
         this.reset();
         this.rideList.dataProvider = param1;
         this.title.text = LanResManager.getLanCommonTextWords("携带数量") + param2;
         if(param1.children().length() > 0)
         {
            this.rideList.setSelectItemByIndex(0);
            if(!this.rideList.selectItem)
            {
               return;
            }
            dispatchEvent(new BaseEvent(UI_RIDE_SKILL_RESET_SETLECT,"",int(this.rideList.selectItem.label)));
         }
         this.scroll.update();
      }
      
      public function setRide(param1:String, param2:int) : void
      {
         this.rideName.text = param1;
         this.level.text = param2.toString();
      }
      
      public function setEquip(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Goods = null;
         var _loc5_:ItemFace = null;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         this.anju = 0;
         this.jiangsheng = 0;
         this.jiaodeng = 0;
         this.tieti = 0;
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = param1[_loc2_] as Goods;
            _loc5_ = new ItemFace(_loc4_);
            _loc5_.showRedMask();
            _loc5_.showStrengthenLv = true;
            this.equipContainer.addChild(_loc5_);
            switch(_loc4_.position)
            {
               case ItemPositionRange.POSTION_HOURSE_ANJU:
                  _loc5_.x = 0;
                  _loc5_.y = 2;
                  if(_loc4_.id == 370150)
                  {
                     this.anju = 1;
                  }
                  else if(_loc4_.id == 372028)
                  {
                     this.anju = 2;
                  }
                  else
                  {
                     this.anju = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_JIANGSHENG:
                  _loc5_.x = 0;
                  _loc5_.y = 47;
                  if(_loc4_.id == 370151)
                  {
                     this.jiangsheng = 1;
                  }
                  else if(_loc4_.id == 372029)
                  {
                     this.jiangsheng = 2;
                  }
                  else
                  {
                     this.jiangsheng = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_TIJU:
                  _loc5_.x = 186;
                  _loc5_.y = 2;
                  if(_loc4_.id == 370152)
                  {
                     this.jiaodeng = 1;
                  }
                  else if(_loc4_.id == 372030)
                  {
                     this.jiaodeng = 2;
                  }
                  else
                  {
                     this.jiaodeng = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_TITIE:
                  _loc5_.x = 186;
                  _loc5_.y = 47;
                  if(_loc4_.id == 370153)
                  {
                     this.tieti = 1;
                  }
                  else if(_loc4_.id == 372031)
                  {
                     this.tieti = 2;
                  }
                  else
                  {
                     this.tieti = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW1:
                  if(OtherConst.mount_add_count == 2)
                  {
                     _loc5_.x = 47 + 10;
                     _loc5_.y = 45;
                  }
                  else
                  {
                     _loc5_.x = 94;
                     _loc5_.y = 45;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW2:
                  if(OtherConst.mount_add_count == 2)
                  {
                     _loc5_.x = 140 - 10;
                     _loc5_.y = 45;
                  }
                  else
                  {
                     _loc5_.x = 47;
                     _loc5_.y = 45;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW3:
                  _loc5_.x = 140;
                  _loc5_.y = 45;
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW4:
                  _loc5_.x = 47;
                  _loc5_.y = 5;
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW5:
                  _loc5_.x = 140;
                  _loc5_.y = 5;
            }
            _loc2_++;
         }
      }
      
      public function setAvatar(param1:BitmapData, param2:int) : void
      {
         while(this.headContainer.numChildren > 0)
         {
            this.headContainer.removeChildAt(0);
         }
         this.avatar = param1;
         if(param2 == 0)
         {
            return;
         }
         this.headImg = ResPathManager.getSmallICO(param2);
         this.headContainer.addChild(this.headImg);
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         this._avatar.scaleX = this._avatar.scaleY = 1;
         this._avatar.bitmapData = param1;
         var _loc2_:Rectangle = new Rectangle();
         if(!param1)
         {
            return;
         }
         if(this._avatar.width >= 512 && this._avatar.height >= 209)
         {
            _loc2_ = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
            if(_loc2_.width > 203)
            {
               this._avatar.scaleX = this._avatar.scaleY = 203 / _loc2_.width;
            }
            this._avatar.x = 290 - this._avatar.width / 2 - 270 + 80;
            this._avatar.y = 63 - this._avatar.height / 2 + 20;
         }
         else
         {
            _loc3_ = 1;
            if(this._avatar.height != 84)
            {
               _loc3_ = 84 / this._avatar.height;
            }
            _loc2_ = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
            this._avatar.bitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,0);
            this._avatar.bitmapData.copyPixels(param1,_loc2_,new Point(0,0));
            _loc4_ = 1;
            if(_loc2_.width > 148)
            {
               _loc4_ = 148 / _loc2_.width;
            }
            this._avatar.scaleX = this._avatar.scaleY = _loc3_ > _loc4_ ? _loc4_ : _loc3_;
            this._avatar.x = 286 - this._avatar.width / 2 - 270 + 100;
            this._avatar.y = 63 - this._avatar.height / 2 + 20;
         }
      }
      
      public function setDreamBarPercentage(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:int, param8:int, param9:int, param10:int) : void
      {
         this.dreamBar.setValue(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.dreamBar.setHeianGuangming(this.anju,this.jiangsheng,this.jiaodeng,this.tieti);
      }
      
      private function onHeadMouseTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.headContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onHeadMouseTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this._avatar == null)
               {
                  return;
               }
               if(this.headTipCanvas.getChildByName("avatar") == null)
               {
                  this.headTipCanvas.addChild(this._avatar);
               }
               Tools.currentStage.addChild(this.headTipCanvas);
               this.headTipCanvas.width = 240;
               this.headTipCanvas.height = 170;
               this.headTipCanvas.x = Tools.currentStage.mouseX + 15;
               this.headTipCanvas.y = Tools.currentStage.mouseY + 25;
               this.headTipCanvas.addChild(this.txtYinCangShuxingJihuo);
               this.txtYinCangShuxingJihuo.visible = this.intYinCangShuXingJiHuo > 0 ? true : false;
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.headTipCanvas.parent != null)
               {
                  this.headTipCanvas.parent.removeChild(this.headTipCanvas);
               }
               this.headContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onHeadMouseTip);
         }
      }
      
      public function setYinCangShuXingJiHuo(param1:int) : void
      {
         this.intYinCangShuXingJiHuo = param1;
      }
   }
}

