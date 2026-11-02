package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.radioBox.FRadioBox;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.ride.RideListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RideQianNengDanPanel extends FPanel
   {
      
      public static const UI_RIDE_QIANNENGDAN_RIDE_SELECT:String = "UI_RIDE_QIANNENGDAN_RIDE_SELECT";
      
      public static const UI_RIDE_QIANNENGDAN_RIDE_QIANLI_SELECT:String = "UI_RIDE_QIANNENGDAN_RIDE_QIANLI_SELECT";
      
      public static const UI_RIDE_QIANNENGDAN_RIDE_OK:String = "UI_RIDE_QIANNENGDAN_RIDE_OK";
      
      private var _avatar:Bitmap;
      
      private var _mask:Shape;
      
      private var dreamBar:DreamBar;
      
      private var equipContainer:Sprite;
      
      private var skillContainer:Sprite;
      
      private var title:FLabel;
      
      public var rideList:FList;
      
      private var scroll:FVScorllBar;
      
      private var dreamValue:FTextArea;
      
      private var rideName:FLabel;
      
      private var level:FLabel;
      
      private var attackBar:ColorBar;
      
      private var recoveryBar:ColorBar;
      
      private var lightBar:ColorBar;
      
      private var healthBar:ColorBar;
      
      private var colorBar:ColorBar;
      
      private var addTitle:FLabel;
      
      private var valueContainer:Sprite;
      
      private var valueContainer1:Sprite;
      
      private var radioBox1:FRadioBox;
      
      private var radioBox2:FRadioBox;
      
      private var radioBox3:FRadioBox;
      
      private var radioBox4:FRadioBox;
      
      private var okBtn:SecondButton;
      
      private var valueTotal:int;
      
      private var headContainer:Sprite;
      
      private var headImg:Bitmap;
      
      private var headTipCanvas:FCanvas;
      
      private var solt:Bitmap;
      
      private var anju:int = 0;
      
      private var jiangsheng:int = 0;
      
      private var jiaodeng:int = 0;
      
      private var tieti:int = 0;
      
      public function RideQianNengDanPanel()
      {
         var img:Bitmap;
         var container:Sprite;
         var v:Vector.<Bitmap>;
         var fb:FLabel;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 423;
         height = 433;
         titleText = LanResManager.getLanCommonTextWords("坐骑潜能丹");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         addChild(img);
         img.name = "ui.ride.qianNengDan.ui";
         img.x = 10;
         img.y = 22;
         switch(OtherConst.mount_add_count)
         {
            case 0:
               break;
            case 1:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 102 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               break;
            case 2:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175 + 10;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 175 - 10;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               break;
            case 3:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 102 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               break;
            case 4:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 102 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175;
               this.solt.y = 25 + 23;
               addChild(this.solt);
               break;
            case 5:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 102 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175;
               this.solt.y = 25 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 175;
               this.solt.y = 25 + 23;
               addChild(this.solt);
         }
         container = new Sprite();
         addChild(container);
         container.x = 10;
         container.y = 22;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         img = StaticValue.getBitmapByClassName("ui.ride.value.title");
         addChild(img);
         img.x = 29;
         img.y = 194;
         img = StaticValue.getBitmapByClassName("ui.ride.value.title");
         addChild(img);
         img.x = 29;
         img.y = 311;
         this._avatar = new Bitmap();
         this.title = new FLabel();
         this.title.textColor = 16777215;
         this.title.selectable = false;
         container.addChild(this.title);
         this.title.x = 40;
         this.title.y = 6;
         this.title.text = LanResManager.getLanTextWords(this,0);
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
         with(fb)
         {
            x = 20;
            y = 4;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         fb.text = LanResManager.getLanTextWords(this,1);
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
         fb = new FLabel();
         with(fb)
         {
            x = 20;
            y = 176;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         fb.text = LanResManager.getLanTextWords(this,2);
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 20;
            y = 292;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         fb.text = LanResManager.getLanTextWords(this,3);
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 20;
            y = 363;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
         }
         fb.text = LanResManager.getLanTextWords(this,4);
         addChild(fb);
         this.attackBar = new ColorBar(5,156,5);
         addChild(this.attackBar);
         this.attackBar.x = 108;
         this.attackBar.y = 219;
         this.recoveryBar = new ColorBar(5,156,5);
         addChild(this.recoveryBar);
         this.recoveryBar.x = 108;
         this.recoveryBar.y = 237;
         this.lightBar = new ColorBar(5,156,5);
         addChild(this.lightBar);
         this.lightBar.x = 108;
         this.lightBar.y = 255;
         this.healthBar = new ColorBar(5,156,5);
         addChild(this.healthBar);
         this.healthBar.x = 108;
         this.healthBar.y = 273;
         this.colorBar = new ColorBar(5,156,5);
         addChild(this.colorBar);
         this.colorBar.x = 108;
         this.colorBar.y = 335;
         this.radioBox1 = new FRadioBox();
         addChild(this.radioBox1);
         this.radioBox1.selectState = true;
         this.radioBox1.border = true;
         this.radioBox1.textColor = StaticValue.GREEN;
         this.radioBox1.text = LanResManager.getLanTextWords(this,"进攻潜力");
         this.radioBox1.x = 29;
         this.radioBox1.y = 213;
         this.radioBox1.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.radioBox2 = new FRadioBox();
         addChild(this.radioBox2);
         this.radioBox2.border = true;
         this.radioBox2.textColor = StaticValue.GREEN;
         this.radioBox2.text = LanResManager.getLanTextWords(this,"防御潜力");
         this.radioBox2.x = 29;
         this.radioBox2.y = 231;
         this.radioBox2.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.radioBox3 = new FRadioBox();
         addChild(this.radioBox3);
         this.radioBox3.border = true;
         this.radioBox3.textColor = StaticValue.GREEN;
         this.radioBox3.text = LanResManager.getLanTextWords(this,"轻身潜力");
         this.radioBox3.x = 29;
         this.radioBox3.y = 250;
         this.radioBox3.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.radioBox4 = new FRadioBox();
         addChild(this.radioBox4);
         this.radioBox4.border = true;
         this.radioBox4.textColor = StaticValue.GREEN;
         this.radioBox4.text = LanResManager.getLanTextWords(this,"健体潜力");
         this.radioBox4.x = 29;
         this.radioBox4.y = 268;
         this.radioBox4.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.addTitle = new FLabel();
         with(this.addTitle)
         {
            x = 48;
            y = 328;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"攻击潜力");
         }
         addChild(this.addTitle);
         this.valueContainer = new Sprite();
         addChild(this.valueContainer);
         this.valueContainer.x = 122;
         this.valueContainer.y = 196;
         this.valueContainer1 = new Sprite();
         addChild(this.valueContainer1);
         this.valueContainer1.x = 122;
         this.valueContainer1.y = 314;
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanTextWords(this,"增加潜能");
         addChild(this.okBtn);
         this.okBtn.x = 328;
         this.okBtn.y = 360;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.headContainer = new Sprite();
         this.headContainer.x = 309 - 45 + 15;
         this.headContainer.y = 25 + 23;
         addChild(this.headContainer);
         this.headContainer.addEventListener(MouseEvent.MOUSE_OVER,this.onHeadMouseTip);
         this.headContainer.addEventListener(MouseEvent.MOUSE_OUT,this.onHeadMouseTip);
         this.headImg = new Bitmap();
         this.headTipCanvas = new FCanvas();
         this.headTipCanvas.skin = "menuBg";
         this.headTipCanvas.addChild(this._avatar);
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.radioBox1:
               this.radioBox2.selectState = this.radioBox3.selectState = this.radioBox4.selectState = false;
               this.addTitle.text = this.radioBox1.text;
               dispatchEvent(new BaseEvent(UI_RIDE_QIANNENGDAN_RIDE_QIANLI_SELECT,"",1));
               break;
            case this.radioBox2:
               this.radioBox1.selectState = this.radioBox3.selectState = this.radioBox4.selectState = false;
               this.addTitle.text = this.radioBox2.text;
               dispatchEvent(new BaseEvent(UI_RIDE_QIANNENGDAN_RIDE_QIANLI_SELECT,"",2));
               break;
            case this.radioBox3:
               this.radioBox2.selectState = this.radioBox1.selectState = this.radioBox4.selectState = false;
               this.addTitle.text = this.radioBox3.text;
               dispatchEvent(new BaseEvent(UI_RIDE_QIANNENGDAN_RIDE_QIANLI_SELECT,"",4));
               break;
            case this.radioBox4:
               this.radioBox2.selectState = this.radioBox3.selectState = this.radioBox1.selectState = false;
               this.addTitle.text = this.radioBox4.text;
               dispatchEvent(new BaseEvent(UI_RIDE_QIANNENGDAN_RIDE_QIANLI_SELECT,"",3));
         }
      }
      
      private function onCheck1() : void
      {
         if(this.radioBox1.selectState)
         {
            this.addTitle.text = this.radioBox1.text;
            dispatchEvent(new BaseEvent(UI_RIDE_QIANNENGDAN_RIDE_QIANLI_SELECT,"",1));
         }
         if(this.radioBox2.selectState)
         {
            this.addTitle.text = this.radioBox2.text;
            dispatchEvent(new BaseEvent(UI_RIDE_QIANNENGDAN_RIDE_QIANLI_SELECT,"",2));
         }
         if(this.radioBox3.selectState)
         {
            this.addTitle.text = this.radioBox3.text;
            dispatchEvent(new BaseEvent(UI_RIDE_QIANNENGDAN_RIDE_QIANLI_SELECT,"",4));
         }
         if(this.radioBox4.selectState)
         {
            this.addTitle.text = this.radioBox4.text;
            dispatchEvent(new BaseEvent(UI_RIDE_QIANNENGDAN_RIDE_QIANLI_SELECT,"",3));
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
         this.radioBox1.selectState = true;
         this.radioBox2.selectState = this.radioBox3.selectState = this.radioBox4.selectState = false;
         this.addTitle.text = this.radioBox1.text;
         this._avatar.bitmapData = null;
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
         dispatchEvent(new BaseEvent(UI_RIDE_QIANNENGDAN_RIDE_OK));
      }
      
      private function onListClick(param1:MouseEvent = null) : void
      {
         this.reset();
         if(!this.rideList.selectItem)
         {
            return;
         }
         dispatchEvent(new BaseEvent(UI_RIDE_QIANNENGDAN_RIDE_SELECT,"",this.rideList.selectItem));
      }
      
      public function setRidelist(param1:XML, param2:String) : void
      {
         this.reset();
         this.rideList.dataProvider = param1;
         this.title.text = LanResManager.getLanTextWords(this,"携带数量 ") + param2;
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
      
      public function setAttribute(param1:Number, param2:Number, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:int) : void
      {
         var _loc17_:int = 0;
         var _loc19_:Bitmap = null;
         this.attackBar.setValue(param3,param4,param11);
         this.recoveryBar.setValue(param5,param6,param12);
         this.lightBar.setValue(param7,param8,param13);
         this.healthBar.setValue(param9,param10,param14);
         while(this.valueContainer.numChildren > 0)
         {
            this.valueContainer.removeChildAt(0);
         }
         while(this.valueContainer1.numChildren > 0)
         {
            this.valueContainer1.removeChildAt(0);
         }
         this.valueTotal = param9 + param7 + param5 + param3;
         var _loc15_:String = this.valueTotal.toString();
         var _loc16_:Array = _loc15_.split("");
         var _loc18_:int = int(_loc16_.length);
         _loc17_ = 0;
         while(_loc17_ < _loc18_)
         {
            _loc19_ = StaticValue.getBitmapByClassName("ui.ride.value." + _loc16_[_loc17_]);
            this.valueContainer.addChild(_loc19_);
            _loc19_.x = _loc17_ * 7;
            _loc19_ = StaticValue.getBitmapByClassName("ui.ride.value." + _loc16_[_loc17_]);
            this.valueContainer1.addChild(_loc19_);
            _loc19_.x = _loc17_ * 7;
            _loc17_++;
         }
         _loc17_ = param11 + param12 + param13 + param14;
         if(_loc17_ != 0)
         {
            _loc19_ = StaticValue.getBitmapByClassName("ui.ride.value.add");
            this.valueContainer.addChild(_loc19_);
            _loc19_.x = this.valueContainer.width + 7;
            _loc19_ = StaticValue.getBitmapByClassName("ui.ride.value.add");
            this.valueContainer1.addChild(_loc19_);
            _loc19_.x = this.valueContainer1.width + 7;
            _loc15_ = _loc17_.toString();
            _loc16_ = _loc15_.split("");
            _loc18_ = int(_loc16_.length);
            _loc17_ = 0;
            while(_loc17_ < _loc18_)
            {
               _loc19_ = StaticValue.getBitmapByClassName("ui.ride.value." + _loc16_[_loc17_]);
               this.valueContainer.addChild(_loc19_);
               _loc19_.x = this.valueContainer.width;
               _loc19_ = StaticValue.getBitmapByClassName("ui.ride.value." + _loc16_[_loc17_]);
               this.valueContainer1.addChild(_loc19_);
               _loc19_.x = this.valueContainer1.width;
               _loc17_++;
            }
         }
         this.onCheck1();
      }
      
      public function setAddValue(param1:int, param2:int) : void
      {
         var _loc5_:int = 0;
         var _loc7_:Bitmap = null;
         if(this.radioBox1.selectState)
         {
            this.colorBar.setValue(this.attackBar.currentValue,this.attackBar.maxValue,param1);
         }
         if(this.radioBox2.selectState)
         {
            this.colorBar.setValue(this.recoveryBar.currentValue,this.recoveryBar.maxValue,param1);
         }
         if(this.radioBox3.selectState)
         {
            this.colorBar.setValue(this.lightBar.currentValue,this.lightBar.maxValue,param1);
         }
         if(this.radioBox4.selectState)
         {
            this.colorBar.setValue(this.healthBar.currentValue,this.healthBar.maxValue,param1);
         }
         if(param1 == 0)
         {
            return;
         }
         while(this.valueContainer1.numChildren > 0)
         {
            this.valueContainer1.removeChildAt(0);
         }
         var _loc3_:String = this.valueTotal.toString();
         var _loc4_:Array = _loc3_.split("");
         var _loc6_:int = int(_loc4_.length);
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = StaticValue.getBitmapByClassName("ui.ride.value." + _loc4_[_loc5_]);
            this.valueContainer1.addChild(_loc7_);
            _loc7_.x = _loc5_ * 7;
            _loc5_++;
         }
         _loc7_ = StaticValue.getBitmapByClassName("ui.ride.value.add");
         this.valueContainer1.addChild(_loc7_);
         _loc7_.x = this.valueContainer1.width + 7;
         _loc3_ = param2.toString();
         _loc4_ = _loc3_.split("");
         _loc6_ = int(_loc4_.length);
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = StaticValue.getBitmapByClassName("ui.ride.value." + _loc4_[_loc5_]);
            this.valueContainer1.addChild(_loc7_);
            _loc7_.x = this.valueContainer1.width;
            _loc5_++;
         }
      }
      
      public function setSelectRideByID(param1:int) : void
      {
         this.rideList.setSelectItemByLabel(param1.toString());
         if(this.rideList.selectItem)
         {
            dispatchEvent(new BaseEvent(UI_RIDE_QIANNENGDAN_RIDE_SELECT,"",this.rideList.selectItem));
            this.onCheck1();
         }
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

