package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.ride.Ride;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RideAttributePanel extends FPanel
   {
      
      private var _avatar:Bitmap;
      
      private var _mask:Shape;
      
      private var dreamBar:DreamBar;
      
      private var addValue:FTextArea;
      
      private var dreamValue:FTextArea;
      
      private var rideBaseAttribute:FTextArea;
      
      private var expBar:ColorBar;
      
      private var attackBar:ColorBar;
      
      private var recoveryBar:ColorBar;
      
      private var lightBar:ColorBar;
      
      private var healthBar:ColorBar;
      
      private var skillContainer:Sprite;
      
      private var equipContainer:Sprite;
      
      private var valueContainer:Sprite;
      
      public var ride:Ride;
      
      private var SiShouAddValue:FTextArea;
      
      private var tip1:FTextArea;
      
      private var tip:FTextArea;
      
      private var headContainer:Sprite;
      
      private var headImg:Bitmap;
      
      private var headTipCanvas:FCanvas;
      
      private var solt:Bitmap;
      
      private var anju:int = 0;
      
      private var jiangsheng:int = 0;
      
      private var jiaodeng:int = 0;
      
      private var tieti:int = 0;
      
      public function RideAttributePanel()
      {
         var v:Vector.<Bitmap>;
         var lb:FLabel;
         var img:Bitmap = null;
         this.tip1 = new FTextArea();
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 367;
         height = 345;
         titleText = LanResManager.getLanCommonTextWords("坐骑属性");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.ride.attribute.show.ui";
         addChild(img);
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         DynamicManageImages = v;
         switch(OtherConst.mount_add_count)
         {
            case 0:
               break;
            case 1:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 102 + 18 - 15 - 10 + 4 - 1;
               this.solt.y = 25 + 40;
               addChild(this.solt);
               break;
            case 2:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 54 + 18;
               this.solt.y = 25 + 40;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 18 - 15 - 15 + 2 - 10;
               this.solt.y = 25 + 40;
               addChild(this.solt);
               break;
            case 3:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 18 - 15 - 3 + 2;
               this.solt.y = 25 + 40;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 102 + 18 - 15 - 10 + 4 - 1;
               this.solt.y = 25 + 40;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 18 - 15 - 15 + 2;
               this.solt.y = 25 + 40;
               addChild(this.solt);
               break;
            case 4:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 18 - 15 - 3 + 2;
               this.solt.y = 25 + 40;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 102 + 18 - 15 - 10 + 4 - 1;
               this.solt.y = 25 + 40;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 18 - 15 - 15 + 2;
               this.solt.y = 25 + 40;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 18 - 15 - 3 + 2;
               this.solt.y = 23;
               addChild(this.solt);
               break;
            case 5:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 18 - 15 - 3 + 2;
               this.solt.y = 25 + 40;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 102 + 18 - 15 - 10 + 4 - 1;
               this.solt.y = 25 + 40;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 18 - 15 - 15 + 2;
               this.solt.y = 25 + 40;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 18 - 15 - 3 + 2;
               this.solt.y = 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 18 - 15 - 15 + 2;
               this.solt.y = 23;
               addChild(this.solt);
         }
         this._avatar = new Bitmap();
         with(this.tip1)
         {
            width = 80;
            height = 175;
            x = 15;
            y = 131;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'3\'>" + LanResManager.getLanTextWords(this,"增加生命增加内力增加体力增加攻击增加防御增加暴击增加闪避增加",[StaticValue.ORANGE_HTML]) + "</textformat>";
         }
         addChild(this.tip1);
         this.addValue = new FTextArea();
         with(this.addValue)
         {
            width = 80;
            height = 165;
            x = 115;
            y = 131;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'3\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + "99999<br>" + "99999<br>" + "99999<br>" + "99999<br>" + "99999<br>" + "99999<br>" + "99999<br>" + "99999<br>" + "99999" + "</font></textformat>";
         }
         addChild(this.addValue);
         this.dreamValue = new FTextArea();
         with(this.dreamValue)
         {
            width = 80;
            height = 165;
            x = 128;
            y = 131;
            textColor = StaticValue.GREEN_HTML;
            filters = StaticValue.filter;
         }
         addChild(this.dreamValue);
         this.SiShouAddValue = new FTextArea();
         with(this.SiShouAddValue)
         {
            width = 80;
            height = 165;
            x = 120;
            y = 131;
            filters = StaticValue.filter;
         }
         addChild(this.SiShouAddValue);
         this.tip = new FTextArea();
         with(this.tip)
         {
            width = 40;
            height = 100;
            x = 228;
            y = 10;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanTextWords(this,"属性名") + "</font></textformat>";
         }
         addChild(this.tip);
         this.rideBaseAttribute = new FTextArea();
         with(this.rideBaseAttribute)
         {
            width = 100;
            height = 100;
            x = 270;
            y = 10;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,2) + "</font></textformat>";
         }
         addChild(this.rideBaseAttribute);
         lb = new FLabel();
         with(lb)
         {
            x = 172;
            y = 120;
            filters = StaticValue.filter;
            textColor = StaticValue.BlUE20;
            text = LanResManager.getLanCommonTextWords("经验");
         }
         addChild(lb);
         img = StaticValue.getBitmapByClassName("ui.ride.value.title");
         addChild(img);
         img.x = 172;
         img.y = 141;
         this.valueContainer = new Sprite();
         addChild(this.valueContainer);
         this.valueContainer.x = 264;
         this.valueContainer.y = 143;
         this.tip = new FTextArea();
         with(this.tip)
         {
            width = 215;
            height = 128;
            x = 172;
            y = 139;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0.1\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + "<br>" + LanResManager.getLanTextWords(this,3) + "</font></textformat>";
         }
         addChild(this.tip);
         this.expBar = new ColorBar(5,112,5);
         addChild(this.expBar);
         this.expBar.x = 233;
         this.expBar.y = 126;
         this.attackBar = new ColorBar(5,112,5);
         addChild(this.attackBar);
         this.attackBar.x = 233;
         this.attackBar.y = 159;
         this.recoveryBar = new ColorBar(5,112,5);
         addChild(this.recoveryBar);
         this.recoveryBar.x = 233;
         this.recoveryBar.y = 174;
         this.lightBar = new ColorBar(5,112,5);
         addChild(this.lightBar);
         this.lightBar.x = 233;
         this.lightBar.y = 189;
         this.healthBar = new ColorBar(5,112,5);
         addChild(this.healthBar);
         this.healthBar.x = 233;
         this.healthBar.y = 204;
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 18;
         this.equipContainer.y = 25;
         this.skillContainer = new Sprite();
         addChild(this.skillContainer);
         this.skillContainer.x = 177;
         this.skillContainer.y = 220;
         this.dreamBar = new DreamBar();
         addChild(this.dreamBar);
         this.dreamBar.y = 105;
         this.dreamBar.x = 82;
         this.headContainer = new Sprite();
         this.headContainer.x = 18 + 90 - 10 + 2;
         this.headContainer.y = 25 + 1;
         addChild(this.headContainer);
         this.headContainer.addEventListener(MouseEvent.MOUSE_OVER,this.onHeadMouseTip);
         this.headContainer.addEventListener(MouseEvent.MOUSE_OUT,this.onHeadMouseTip);
         this.headImg = new Bitmap();
         this.headTipCanvas = new FCanvas();
         this.headTipCanvas.skin = "menuBg";
         this.headTipCanvas.addChild(this._avatar);
      }
      
      private function setEquip(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:ItemFace = null;
         var _loc5_:Goods = null;
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
            _loc5_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc5_);
            _loc4_.showStrengthenLv = true;
            this.equipContainer.addChild(_loc4_);
            switch(_loc5_.position)
            {
               case ItemPositionRange.POSTION_HOURSE_ANJU:
                  _loc4_.x = 0;
                  _loc4_.y = 2 - 2;
                  if(_loc5_.id == 370150)
                  {
                     this.anju = 1;
                  }
                  else if(_loc5_.id == 372028)
                  {
                     this.anju = 2;
                  }
                  else
                  {
                     this.anju = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_JIANGSHENG:
                  _loc4_.x = 0;
                  _loc4_.y = 47 - 2;
                  if(_loc5_.id == 370151)
                  {
                     this.jiangsheng = 1;
                  }
                  else if(_loc5_.id == 372029)
                  {
                     this.jiangsheng = 2;
                  }
                  else
                  {
                     this.jiangsheng = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_TIJU:
                  _loc4_.x = 186 - 23;
                  _loc4_.y = 2 - 2;
                  if(_loc5_.id == 370152)
                  {
                     this.jiaodeng = 1;
                  }
                  else if(_loc5_.id == 372030)
                  {
                     this.jiaodeng = 2;
                  }
                  else
                  {
                     this.jiaodeng = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_TITIE:
                  _loc4_.x = 186 - 23;
                  _loc4_.y = 47 - 2;
                  if(_loc5_.id == 370153)
                  {
                     this.tieti = 1;
                  }
                  else if(_loc5_.id == 372031)
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
                     _loc4_.x = 47 + 10 - 1;
                     _loc4_.y = 45 - 3;
                  }
                  else
                  {
                     _loc4_.x = 94 - 16 + 4;
                     _loc4_.y = 45 - 3;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW2:
                  if(OtherConst.mount_add_count == 2)
                  {
                     _loc4_.x = 140 - 23 - 5;
                     _loc4_.y = 45 - 3;
                  }
                  else
                  {
                     _loc4_.x = 47 - 5 - 2 + 1;
                     _loc4_.y = 45 - 3;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW3:
                  _loc4_.x = 140 - 23 + 3 + 2;
                  _loc4_.y = 45 - 3;
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW4:
                  _loc4_.x = 47 - 5 - 2 + 1;
                  _loc4_.y = 0;
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW5:
                  _loc4_.x = 140 - 23 + 3 + 2;
                  _loc4_.y = 0;
            }
            _loc2_++;
         }
      }
      
      private function setSkill(param1:Object) : void
      {
         var _loc3_:Skill = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:ItemFace = null;
         while(this.skillContainer.numChildren > 0)
         {
            this.skillContainer.removeChildAt(0);
         }
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            _loc2_.push(_loc3_);
         }
         if(_loc2_.length > 8)
         {
            _loc2_ = _loc2_.slice(0,8);
         }
         var _loc6_:int = int(_loc2_.length);
         _loc4_ = 0;
         loop2:
         while(_loc4_ < 2)
         {
            _loc5_ = 0;
            while(_loc5_ < 4)
            {
               if(_loc4_ * 4 + _loc5_ == _loc6_)
               {
                  break loop2;
               }
               _loc7_ = new ItemFace(_loc2_[_loc4_ * 4 + _loc5_] as BaseItem);
               this.skillContainer.addChild(_loc7_);
               _loc7_.x = _loc5_ * 45;
               _loc7_.y = _loc4_ * 40;
               _loc5_++;
            }
            _loc4_++;
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setRide(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:*, param8:*, param9:Number, param10:Number, param11:Number, param12:Number, param13:Number, param14:Number, param15:Number, param16:int, param17:int, param18:Number, param19:Number, param20:int, param21:int, param22:int, param23:int, param24:int, param25:int, param26:int, param27:int, param28:Array, param29:Object, param30:int, param31:int, param32:int, param33:int) : void
      {
         var _loc36_:int = 0;
         var _loc38_:Bitmap = null;
         this.rideBaseAttribute.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + param2 + "<br>" + param3 + "<br>" + param4 + LanResManager.getLanCommonTextWords("级") + "<br>" + param5 + "<br>" + param7 + "/" + param8 + "</font></textformat>";
         this.addValue.htmlText = "<textformat leading=\'3\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + Math.floor(param9) + "<br>" + Math.floor(param10) + "<br>" + Math.floor(param11) + "<br>" + Math.floor(param12) + "<br>" + Math.floor(param13) + "<br>" + Math.floor(param14) + "<br>" + Math.floor(param15) + "<br>" + Math.floor(param16) + "<br>" + Math.floor(param17) + "</font></textformat>";
         this.expBar.setValue(Math.floor(param18),Math.floor(param19));
         this.attackBar.setValue(Math.floor(param20),Math.floor(param21),Math.floor(param30));
         this.recoveryBar.setValue(Math.floor(param22),Math.floor(param23),Math.floor(param31));
         this.lightBar.setValue(Math.floor(param24),Math.floor(param25),Math.floor(param32));
         this.healthBar.setValue(Math.floor(param26),Math.floor(param27),Math.floor(param33));
         this.setEquip(param28);
         this.setSkill(param29);
         while(this.valueContainer.numChildren > 0)
         {
            this.valueContainer.removeChildAt(0);
         }
         var _loc34_:String = (param26 + param24 + param22 + param20).toString();
         var _loc35_:Array = _loc34_.split("");
         var _loc37_:int = int(_loc35_.length);
         _loc36_ = 0;
         while(_loc36_ < _loc37_)
         {
            _loc38_ = StaticValue.getBitmapByClassName("ui.ride.value." + _loc35_[_loc36_]);
            this.valueContainer.addChild(_loc38_);
            _loc38_.x = _loc36_ * 7;
            _loc36_++;
         }
         _loc36_ = param30 + param31 + param32 + param33;
         if(_loc36_ == 0)
         {
            return;
         }
         _loc38_ = StaticValue.getBitmapByClassName("ui.ride.value.add");
         this.valueContainer.addChild(_loc38_);
         _loc38_.x = this.valueContainer.width + 7;
         _loc34_ = _loc36_.toString();
         _loc35_ = _loc34_.split("");
         _loc37_ = int(_loc35_.length);
         _loc36_ = 0;
         while(_loc36_ < _loc37_)
         {
            _loc38_ = StaticValue.getBitmapByClassName("ui.ride.value." + _loc35_[_loc36_]);
            this.valueContainer.addChild(_loc38_);
            _loc38_.x = this.valueContainer.width;
            _loc36_++;
         }
      }
      
      public function setAvatar(param1:BitmapData, param2:int) : void
      {
         while(this.headContainer.numChildren > 0)
         {
            this.headContainer.removeChildAt(0);
         }
         this.avatar = param1;
         this.headImg = ResPathManager.getSmallICO(param2);
         this.headContainer.addChild(this.headImg);
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.scaleX = this._avatar.scaleY = 1;
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         var _loc2_:Number = 1;
         var _loc3_:Number = 1;
         var _loc4_:Rectangle = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
         this._avatar.bitmapData = new BitmapData(_loc4_.width,_loc4_.height,true,0);
         this._avatar.bitmapData.copyPixels(param1,_loc4_,new Point(0,0));
         if(this._avatar.height > 84)
         {
            _loc2_ = 84 / this._avatar.height;
         }
         if(_loc4_.width > 125)
         {
            _loc3_ = 125 / _loc4_.width;
         }
         this._avatar.scaleX = this._avatar.scaleY = _loc2_ > _loc3_ ? _loc3_ : _loc2_;
         this._avatar.x = 117.5 - this._avatar.width / 2;
         this._avatar.y = 63 - this._avatar.height / 2;
      }
      
      public function setDreamBarPercentage(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:int, param8:int, param9:int, param10:int) : void
      {
         this.dreamBar.setValue(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.dreamBar.setHeianGuangming(this.anju,this.jiangsheng,this.jiaodeng,this.tieti);
      }
      
      public function setDreamValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         this.dreamValue.htmlText = "<textformat leading=\'3\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + "+" + Math.floor(param1) + "<br>" + "+" + Math.floor(param2) + "<br>" + "+" + Math.floor(param3) + "<br>" + "+" + Math.floor(param4) + "<br>" + "+" + Math.floor(param5) + "<br>" + "+" + Math.floor(param6) + "<br>" + "+" + Math.floor(param7) + "<br>" + "+" + Math.floor(param8) + "<br>" + "+" + Math.floor(param9) + "</font></textformat>";
         this.tip1.x = 15;
         this.addValue.x = 95;
         this.dreamValue.x = 130;
      }
      
      public function setSiShengShouValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         this.SiShouAddValue.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.RED_HTML + "\'>" + "+" + Math.floor(param1) + "<br>" + "+" + Math.floor(param2) + "<br>" + "+" + Math.floor(param3) + "<br>" + "+" + Math.floor(param4) + "<br>" + "+" + Math.floor(param5) + "<br>" + "+" + Math.floor(param6) + "<br>" + "+" + Math.floor(param7) + "<br>" + "+" + Math.floor(param8) + "<br>" + "+" + Math.floor(param9) + "</font></textformat>";
         this.tip1.x = 10;
         this.addValue.x = 70;
         this.dreamValue.x = 92;
         this.SiShouAddValue.x = 135;
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
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.headTipCanvas.parent != null)
               {
                  this.headTipCanvas.parent.removeChild(this.headTipCanvas);
               }
               this.headContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onHeadMouseTip);
         }
      }
   }
}

