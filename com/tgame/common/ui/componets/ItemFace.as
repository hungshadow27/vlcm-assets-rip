package com.tgame.common.ui.componets
{
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.*;
   import com.zcp.common.cd.CDFace;
   import com.zcp.common.cd.IItem;
   import com.zcp.common.cd.IItemFace;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.CDFaceManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   import flash.utils.getTimer;
   import flashx.textLayout.formats.TextAlign;
   
   public class ItemFace extends Sprite implements IItemFace
   {
      
      public static const MOUSE_OVER:String = "ItemMOUSE_OVER";
      
      public static const MOUSE_OUT:String = "ItemMOUSE_OUT";
      
      private var _baseItem:BaseItem;
      
      private var _bmp:Bitmap;
      
      private var _cdFace:CDFace;
      
      private var countTip:FLabel;
      
      private var fram:Shape;
      
      private var _mask:Shape;
      
      private var light:DisplayObject;
      
      private var select:MovieClip;
      
      private var diamond:Sprite;
      
      private var zanwen:Sprite;
      
      private var kungFuContainer:Sprite;
      
      private var kungFuFram:Bitmap;
      
      private var gfitMask:Bitmap;
      
      private var bgBitmap:Bitmap;
      
      private var _mcSpr:Sprite;
      
      private var _mcSprName:String;
      
      private var _mcSuo:Bitmap;
      
      private var _mcNameFta:FTextArea;
      
      private var _hotGoods:DisplayObject;
      
      public var ICO_WIDTH:int = 35;
      
      public var ICO_HEIGHT:int = 35;
      
      private var countdownTime:Number = 99;
      
      private var displayField:FTextArea;
      
      private var textFormat:TextFormat;
      
      private var startTime:int;
      
      private var endTime:int;
      
      private var isRunning:Boolean = false;
      
      public function ItemFace(param1:BaseItem, param2:Number = 35, param3:Number = 35)
      {
         var bf:Buff = null;
         var $baseItem:BaseItem = param1;
         var $width:Number = param2;
         var $height:Number = param3;
         this.ICO_WIDTH = $width;
         this.ICO_HEIGHT = $height;
         this._baseItem = $baseItem;
         mouseChildren = false;
         super();
         if(this._baseItem is McBaseItem)
         {
            this._mcSpr = (this._baseItem as McBaseItem).getMc((this._baseItem as McBaseItem).id,this.setMcNameZhuangtai);
            this._mcSpr.graphics.beginFill(16711680,0);
            this._mcSpr.graphics.drawRect(0,0,60,60);
            addChild(this._mcSpr);
         }
         else
         {
            if(this.ICO_WIDTH == 65 && this.ICO_HEIGHT == 65)
            {
               this._bmp = this._baseItem.getSmallICO(this.ICO_WIDTH,this.ICO_HEIGHT);
               addChild(this._bmp);
            }
            else
            {
               this._bmp = this._baseItem.getSmallICO(this.ICO_WIDTH,this.ICO_HEIGHT);
               addChild(this._bmp);
            }
            this.fram = new Shape();
            with(this.fram.graphics)
            {
               
               lineStyle(2,StaticValue.WHITE);
               beginFill(0,0);
               drawRect(-1,-1,ICO_WIDTH + 2,ICO_HEIGHT + 2);
               endFill();
            }
            addChild(this.fram);
            this.fram.visible = false;
            this.showLight = true;
            this.countTip = new FLabel();
            with(this.countTip)
            {
               
               selectable = false;
               autoSize = TextFieldAutoSize.RIGHT;
               textColor = 16777215;
               filters = StaticValue.filter;
               if(_baseItem is Goods)
               {
                  text = _baseItem.count == 0 ? "" : _baseItem.count;
                  if((_baseItem as Goods).isJiPin == 1)
                  {
                     showNonsuch();
                  }
               }
               if(_baseItem is Skill)
               {
                  if((_baseItem as Skill).isOther == 1 || (_baseItem as Skill).res.wugong_type == 5 || (_baseItem as Skill).res.wugong_type == 6 || Boolean(OtherConst.isDanTianSkill(_baseItem.id)))
                  {
                     visible = false;
                     if(_baseItem is MountSkill)
                     {
                        text = (_baseItem as MountSkill).lv;
                     }
                  }
                  else if((_baseItem as Skill).levelAppend > 0)
                  {
                     text = (_baseItem as Skill).level + "+" + (_baseItem as Skill).levelAppend;
                  }
                  else if(_baseItem is MountSkill)
                  {
                     text = (_baseItem as MountSkill).lv;
                  }
                  else
                  {
                     text = (_baseItem as Skill).level;
                  }
               }
               x = ICO_WIDTH - countTip.width;
               y = ICO_HEIGHT - countTip.height;
            }
            addChild(this.countTip);
            if(this._baseItem is Buff)
            {
               bf = this._baseItem as Buff;
               this.countdownTime = Math.ceil(bf.currentCDTotal / 1000);
               if(this.countdownTime > 0 && this.countdownTime <= 99)
               {
                  this.CountdownTimer();
               }
            }
         }
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
      
      public function removeListener() : void
      {
         removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
      
      public function showGiftSelect(param1:Boolean) : void
      {
         if(param1)
         {
            if(!this.gfitMask)
            {
               this.gfitMask = StaticValue.getBitmapByClassName("ui.item.gift.mask");
            }
            addChild(this.gfitMask);
            this.gfitMask.x = (this.ICO_WIDTH - this.gfitMask.width) / 2;
            this.gfitMask.y = (this.ICO_HEIGHT - this.gfitMask.height) / 2;
         }
         else if(Boolean(this.gfitMask) && Boolean(this.gfitMask.parent))
         {
            this.gfitMask.parent.removeChild(this.gfitMask);
         }
      }
      
      public function showRedMask() : void
      {
         var goods:Goods = null;
         var subtractionSsign:Bitmap = null;
         var lock:Bitmap = null;
         if(this._baseItem is Goods)
         {
            goods = this._baseItem as Goods;
            if(goods.res.kind == GoodsKind.K2 && goods.curr_durability == 0)
            {
               goods.enabled = false;
            }
            else
            {
               goods.enabled = true;
            }
            if(goods.res.limit_grade > GameInstance.mainCharData.attributeInfo.lv || goods.res.popsinger > 0 && goods.res.popsinger != GameInstance.mainCharData.attributeInfo.partyID)
            {
               subtractionSsign = StaticValue.getBitmapByClassName("ui.item.ico.subtractionSsign");
               addChild(subtractionSsign);
               subtractionSsign.x = 2;
               subtractionSsign.y = this.ICO_HEIGHT - subtractionSsign.height - 2;
            }
            else if(goods.bind == 1)
            {
               lock = StaticValue.getBitmapByClassName("ui.item.ico.lock");
               addChild(lock);
               lock.x = 2;
               lock.y = this.ICO_HEIGHT - lock.height - 2;
            }
         }
         if(!this._baseItem.enabled)
         {
            this._mask = new Shape();
            addChildAt(this._mask,numChildren - 1);
            with(this._mask)
            {
               
               graphics.beginFill(StaticValue.RED,0.5);
               graphics.drawRect(0,0,ICO_WIDTH,ICO_HEIGHT);
               graphics.endFill();
            }
         }
      }
      
      public function showNonsuch() : void
      {
         var _loc1_:Bitmap = StaticValue.getBitmapByClassName("ui.squirrel.nonsuch");
         addChild(_loc1_);
         _loc1_.x = 0;
         _loc1_.y = 0;
      }
      
      public function getItem() : IItem
      {
         return this._baseItem;
      }
      
      public function getCDFace() : CDFace
      {
         if(this._cdFace == null)
         {
            this._cdFace = new CDFace(this.ICO_WIDTH,this.ICO_HEIGHT);
            this.addChild(this._cdFace);
         }
         return this._cdFace;
      }
      
      public function get itemBD() : BitmapData
      {
         if(this._bmp == null)
         {
            this._bmp = new Bitmap();
            this._bmp.bitmapData = new BitmapData(this._mcSpr.width,this._mcSpr.height,true,0);
            this._bmp.bitmapData.draw(this._mcSpr);
         }
         return this._bmp.bitmapData;
      }
      
      public function getBaseItem() : BaseItem
      {
         return this._baseItem;
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         GameInstance.stage.dispatchEvent(new BaseEvent(ItemFace.MOUSE_OVER,"",[param1.target,param1]));
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         GameInstance.stage.dispatchEvent(new BaseEvent(ItemFace.MOUSE_OUT,"",[param1.target,param1]));
      }
      
      public function set showFram(param1:Boolean) : void
      {
         this.fram.visible = param1;
      }
      
      public function set count(param1:int) : void
      {
         this.countTip.text = param1.toString();
         this.countTip.y -= 10;
      }
      
      public function setShowCount(param1:Boolean, param2:Number = 16777215) : void
      {
         this.countTip.visible = param1;
         this.countTip.textColor = param2;
      }
      
      public function showShortCutTip(param1:int, param2:Boolean = false) : void
      {
         var value:int = param1;
         var isAssistant:Boolean = param2;
         var lb:FLabel = new FLabel();
         with(lb)
         {
            selectable = false;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = (isAssistant == true ? "Ctrl+" : "") + value.toString();
         }
         addChild(lb);
      }
      
      public function set showLight(param1:Boolean) : void
      {
         var _loc2_:Shape = null;
         if(param1 && this._baseItem is Goods)
         {
            switch((this._baseItem as Goods).quality)
            {
               case 2:
                  this.light = StaticValue.getBitmapByClassName("ui.item.blue");
                  addChild(this.light);
                  break;
               case 3:
                  this.light = StaticValue.getBitmapByClassName("ui.item.green");
                  addChild(this.light);
                  break;
               case 4:
                  this.light = StaticValue.getMCByClassName("ui.item.light3");
                  addChild(this.light);
                  break;
               case 5:
                  this.light = StaticValue.getMCByClassName("ui.item.light4");
                  _loc2_ = new Shape();
                  _loc2_.graphics.beginFill(0,1);
                  _loc2_.graphics.drawRect(0,0,35,35);
                  _loc2_.graphics.endFill();
                  addChild(_loc2_);
                  this.light.alpha = 0.8;
                  this.light.mask = _loc2_;
                  addChild(this.light);
                  break;
               case 6:
                  if(this.light != null && this.light.parent != null)
                  {
                     this.light.parent.removeChild(this.light);
                  }
                  this.light = StaticValue.getMCByClassName("ui.item.shishi.mc");
                  _loc2_ = new Shape();
                  _loc2_.graphics.beginFill(0,1);
                  _loc2_.graphics.drawRect(0,0,35,35);
                  _loc2_.graphics.endFill();
                  addChild(_loc2_);
                  this.light.alpha = 0.8;
                  this.light.mask = _loc2_;
                  addChild(this.light);
            }
         }
         else if(Boolean(this.light) && Boolean(this.light.parent))
         {
            this.light.parent.removeChild(this.light);
         }
      }
      
      public function set Select(param1:Boolean) : void
      {
         if(!this.select)
         {
            this.select = StaticValue.getMCByClassName("ui.skill.default") as MovieClip;
            addChild(this.select);
         }
         this.select.visible = param1;
      }
      
      public function get Select() : Boolean
      {
         if(this.select)
         {
            return this.select.visible;
         }
         return false;
      }
      
      public function set isHotGoods(param1:Boolean) : void
      {
         if(param1 && this._baseItem is Goods)
         {
            this._hotGoods = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/mc/item_hot.swf");
            addChild(this._hotGoods);
         }
         else if(Boolean(this._hotGoods) && Boolean(this._hotGoods.parent))
         {
            this._hotGoods.parent.removeChild(this._hotGoods);
            this._hotGoods = null;
         }
      }
      
      public function set showStrengthenLv(param1:Boolean) : void
      {
         var diamondBg:Bitmap;
         var fb:FTextArea = null;
         var value:Boolean = param1;
         if((this._baseItem as Goods).strengthen_grade == 0)
         {
            return;
         }
         if(!this.diamond)
         {
            this.diamond = new Sprite();
            addChild(this.diamond);
            this.diamond.x = -4;
            this.diamond.y = this.ICO_HEIGHT - 12;
         }
         else
         {
            while(this.diamond.numChildren > 0)
            {
               this.diamond.removeChildAt(0);
            }
         }
         if(!value)
         {
            this.diamond.visible = false;
            return;
         }
         diamondBg = StaticValue.getBitmapByClassName("ui.equip.diamond.bg");
         this.diamond.addChild(diamondBg);
         if((this._baseItem as Goods).isFullStar == 1 && Boolean((this._baseItem as Goods).isBaoshiTOP))
         {
            diamondBg = StaticValue.getBitmapByClassName("ui.equip.ico.diamond.gold");
            this.diamond.addChild(diamondBg);
         }
         else if((this._baseItem as Goods).isFullStar == 1)
         {
            diamondBg = StaticValue.getBitmapByClassName("ui.equip.ico.diamond");
            this.diamond.addChild(diamondBg);
         }
         else
         {
            fb = new FTextArea();
            with(fb)
            {
               
               x = 0;
               y = 0;
               width = 16;
               height = 15;
               textColor = StaticValue.BlUE20;
               defaultTextFormat = new TextFormat(null,10,null,null,null,null,null,null,"center");
               text = (_baseItem as Goods).strengthen_grade;
            }
            this.diamond.addChild(fb);
         }
         this.diamond.visible = true;
      }
      
      public function showKungFuTag() : void
      {
         var _loc1_:Bitmap = null;
         var _loc2_:MovieClip = null;
         if(this._baseItem is Skill)
         {
            this.kungFuContainer = new Sprite();
            addChild(this.kungFuContainer);
            if((this._baseItem as Skill).isLearn == 0)
            {
               this._bmp.filters = Tools.blackWhiteFilter;
               if((this._baseItem as Skill).isStudy == 1)
               {
                  _loc2_ = StaticValue.getMCByClassName("ui.kungfu.ico.mc1") as MovieClip;
                  addChild(_loc2_);
                  _loc2_.x = -8;
                  _loc2_.y = -8;
               }
            }
            else if((this._baseItem as Skill).isLevelUp == 1)
            {
               _loc1_ = StaticValue.getBitmapByClassName("ui.kungfu.ico.add");
               addChild(_loc1_);
            }
         }
      }
      
      public function set showKungFuFram(param1:Boolean) : void
      {
         if(!this.kungFuFram)
         {
            this.kungFuFram = StaticValue.getBitmapByClassName("ui.skill.select");
            addChild(this.kungFuFram);
            this.kungFuFram.x = -7;
            this.kungFuFram.y = -7;
         }
         this.kungFuFram.visible = param1;
      }
      
      public function destroy() : void
      {
         if(this._mcSpr != null)
         {
            this.shanchuMcShiyong(this._baseItem as McBaseItem,this._mcSprName);
            while(this._mcSpr.numChildren > 0)
            {
               this._mcSpr.graphics.clear();
               this._mcSpr.removeChildAt(0);
            }
         }
         CDFaceManager.removeItemFace(this);
         this._baseItem = null;
         this._bmp = null;
         this._cdFace = null;
         this._mcSpr = null;
         if(this.light != null && this.light.parent != null)
         {
            if(this.light is MovieClip)
            {
               (this.light as MovieClip).stop();
            }
            this.light.parent.removeChild(this.light);
            this.light = null;
         }
         if(Boolean(this._hotGoods) && Boolean(this._hotGoods.parent))
         {
            this._hotGoods.parent.removeChild(this._hotGoods);
            this._hotGoods = null;
         }
         this.stopCountdown();
      }
      
      public function setBitmap(param1:String) : void
      {
         this.bgBitmap = StaticValue.getBitmapByClassName(param1);
         this.bgBitmap.x = this._bmp.x - 2;
         this.bgBitmap.y = this._bmp.x - 2;
         this.addChild(this.bgBitmap);
         this.swapChildren(this._bmp,this.bgBitmap);
      }
      
      public function setMcName(param1:Boolean, param2:Boolean = true) : void
      {
         var _loc3_:McBaseItem = null;
         var _loc4_:int = 0;
         if(param1)
         {
            _loc3_ = this._baseItem as McBaseItem;
            this._mcNameFta = new FTextArea();
            this._mcNameFta.filters = StaticValue.filter;
            this._mcNameFta.autoSize = TextFieldAutoSize.LEFT;
            this._mcNameFta.defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
            if(_loc3_.quality == 1)
            {
               _loc4_ = 7631983;
            }
            else if(_loc3_.quality == 2)
            {
               _loc4_ = StaticValue.WHITE;
            }
            else if(_loc3_.quality == 3)
            {
               _loc4_ = 4228061;
            }
            else if(_loc3_.quality == 4)
            {
               _loc4_ = 3000434;
            }
            else if(_loc3_.quality == 5)
            {
               _loc4_ = 15938527;
            }
            else if(_loc3_.quality == 6)
            {
               _loc4_ = 16643364;
            }
            this._mcNameFta.textColor = _loc4_;
            if(param2)
            {
               this._mcNameFta.htmlText = "<textformat leading=\'0\'>" + _loc3_.name + "<br>" + "Lv." + _loc3_.dengji + "</textformat>";
            }
            else
            {
               this._mcNameFta.htmlText = "<textformat leading=\'0\'>" + _loc3_.name + "</textformat>";
            }
            this._mcNameFta.x = (60 - this._mcNameFta.width) / 2;
            this._mcNameFta.y = (60 - this._mcNameFta.height) / 2 + 22;
            addChild(this._mcNameFta);
         }
         else if(this._mcNameFta != null && this._mcNameFta.parent != null)
         {
            this._mcNameFta.parent.removeChild(this._mcNameFta);
         }
      }
      
      public function setMcSuo(param1:Boolean) : void
      {
         if(param1)
         {
            this._mcSuo = StaticValue.getBitmapByClassName("ui.zhanhundai.daoju.suo.bg");
            this._mcSuo.x = 38;
            this._mcSuo.y = 30;
            addChildAt(this._mcSuo,1);
         }
         else if(this._mcSuo != null && this._mcSuo.parent != null)
         {
            this._mcSuo.parent.removeChild(this._mcSuo);
            this._mcSuo = null;
         }
      }
      
      public function setMcNameZhuangtai(param1:String) : void
      {
         this._mcSprName = param1;
      }
      
      public function shanchuMcShiyong(param1:McBaseItem, param2:String) : void
      {
         param1.shanchuMcShiyong(param1.daojuId,param2);
      }
      
      public function CountdownTimer() : void
      {
         this.initializeDisplay();
         this.startCountdown();
      }
      
      private function initializeDisplay() : void
      {
         this.displayField = new FTextArea();
         this.displayField.filters = StaticValue.filter;
         this.displayField.width = 35;
         this.displayField.height = 20;
         this.displayField.mouseEnabled = mouseChildren = false;
         this.textFormat = new TextFormat();
         this.textFormat.color = StaticValue.WHITE;
         this.textFormat.size = 11;
         this.textFormat.align = TextAlign.RIGHT;
         this.displayField.defaultTextFormat = this.textFormat;
         addChild(this.displayField);
         this.displayField.y = 18;
         this.updateDisplay(this.countdownTime);
      }
      
      private function startCountdown() : void
      {
         this.startTime = getTimer();
         this.endTime = this.startTime + this.countdownTime * 1000;
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         this.isRunning = true;
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:int = getTimer();
         var _loc3_:Number = (this.endTime - _loc2_) / 1000;
         if(_loc3_ <= 0)
         {
            _loc3_ = 0;
            this.stopCountdown();
         }
         this.updateDisplay(_loc3_);
      }
      
      public function stopCountdown() : void
      {
         if(this.isRunning)
         {
            removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
            this.isRunning = false;
         }
      }
      
      private function updateDisplay(param1:Number) : void
      {
         var _loc2_:int = Math.floor(param1);
         var _loc3_:int = Math.floor((param1 - _loc2_) * 100);
         this.displayField.text = this.formatTime(_loc2_,_loc3_);
      }
      
      private function formatTime(param1:int, param2:int) : String
      {
         var _loc3_:String = param1 < 10 ? "0" + param1 : param1.toString();
         var _loc4_:String = param2 < 10 ? "0" + param2 : param2.toString();
         return _loc3_ + "." + _loc4_ + "s";
      }
   }
}

