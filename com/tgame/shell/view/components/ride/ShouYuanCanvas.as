package com.tgame.shell.view.components.ride
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.RideFeedPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ShouYuanCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      public var pointMcArr:Array;
      
      public var skillMcArr:Array;
      
      public var bgMcArr:Array;
      
      public var container:Sprite;
      
      public var dataArr:Array;
      
      public var pointPanel:ShouYuanPointPanel;
      
      public var xiuLianBtn:SecondButton;
      
      public var nowZhenQi:int;
      
      public var index:int;
      
      public var id:int;
      
      public var now:int;
      
      public var max:int;
      
      public var curObj:Object;
      
      public var bgMc:MovieClip;
      
      public var skillSpr:Sprite;
      
      public var slot:Bitmap;
      
      public var bgSpr:Sprite;
      
      private var nameText:FTextArea;
      
      private var itemMc:MovieClip;
      
      public function ShouYuanCanvas()
      {
         var text:FTextArea;
         var box:FCanvas = null;
         this.pointMcArr = [];
         this.skillMcArr = [];
         this.bgMcArr = [];
         this.dataArr = [];
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         box = new FCanvas();
         addChild(box);
         box.skin = "box_transparence";
         box.width = 260;
         box.height = 86;
         box.x = 70;
         box.y = 279;
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.container = new Sprite();
         addChild(this.container);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "yijinjingBtn";
         addChild(this.previousButton);
         this.previousButton.scaleX = -1;
         this.previousButton.x = 30;
         this.previousButton.y = 235;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "yijinjingBtn";
         addChild(this.nextButton);
         this.nextButton.x = 300;
         this.nextButton.y = 235;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         text = new FTextArea();
         with(text)
         {
            x = 72;
            y = 295;
            width = 265;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            wordWrap = true;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("传说神兽的真身要经历不断的蜕变，使用兽元筑基，可以增加蜕变的几率，加强神兽的神识。");
         }
         addChild(text);
         text = new FTextArea();
         with(text)
         {
            x = 72;
            y = 330;
            width = 265;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            wordWrap = true;
            text = LanResManager.getLanCommonTextWords("注：只有拥有技字的兽元才可以进行武学修炼，使用修炼可以修改当前武学的类型和层数。");
         }
         addChild(text);
         this.nameText = new FTextArea();
         this.nameText.visible = false;
         with(this.nameText)
         {
            x = 2;
            y = 282;
            width = 80;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            wordWrap = true;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("兽元");
         }
         addChild(this.nameText);
         this.slot = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.slot.visible = false;
         addChild(this.slot);
         this.slot.x = 12;
         this.slot.y = 300;
         this.skillSpr = new Sprite();
         this.skillSpr.x = 14;
         this.skillSpr.y = 302;
         this.skillSpr.visible = false;
         addChild(this.skillSpr);
         this.xiuLianBtn = new SecondButton();
         this.xiuLianBtn.label = LanResManager.getLanCommonTextWords("修炼");
         addChild(this.xiuLianBtn);
         this.xiuLianBtn.x = 9;
         this.xiuLianBtn.y = 340;
         this.xiuLianBtn.visible = false;
         this.xiuLianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pointPanel = new ShouYuanPointPanel();
      }
      
      public function setBg() : void
      {
         var loadUrl:String = null;
         if(this.bgMc != null && this.bgMc.parent != null)
         {
            this.bgMc.stop();
            this.bgMc.parent.removeChild(this.bgMc);
         }
         while(this.bgSpr.numChildren != 0)
         {
            this.bgSpr.removeChildAt(0);
         }
         if(this.bgMcArr[this.now] != null)
         {
            this.bgMc = this.bgMcArr[this.now];
            this.bgSpr.addChild(this.bgMc);
            this.bgMc.gotoAndStop(this.index);
         }
         else
         {
            loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/mount/" + this.now + ".swf";
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               bgMc = _loc2_.content as MovieClip;
               if(bgMc)
               {
                  bgMcArr[now] = bgMc;
                  bgMc.gotoAndStop(index);
                  bgSpr.addChild(bgMc);
               }
            },null,false,loadUrl);
         }
      }
      
      public function setPoint(param1:Array) : void
      {
         var _loc4_:DisplayObject = null;
         var _loc5_:Object = null;
         var _loc6_:DisplayObject = null;
         while(this.container.numChildren > 0)
         {
            _loc4_ = this.container.removeChildAt(0);
            _loc4_.filters = [];
            if(_loc4_.name.indexOf("Point:") != -1)
            {
               this.pointMcArr.push(_loc4_);
            }
            else if(_loc4_.name.indexOf("Skill:") != -1)
            {
               this.skillMcArr.push(_loc4_);
            }
            if(_loc4_.hasEventListener(MouseEvent.CLICK))
            {
               _loc4_.removeEventListener(MouseEvent.CLICK,this.onPointClick);
            }
         }
         var _loc2_:int = int(param1.length);
         this.index = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = param1[_loc3_];
            if(_loc5_.id < this.id)
            {
               ++this.index;
            }
            if(_loc5_.type == 0)
            {
               if(this.pointMcArr.length > 0)
               {
                  _loc6_ = this.pointMcArr.pop();
               }
               else
               {
                  _loc6_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/mount/point.swf");
               }
               _loc6_.name = "Point:" + _loc3_;
            }
            else
            {
               if(this.skillMcArr.length > 0)
               {
                  _loc6_ = this.skillMcArr.pop();
               }
               else
               {
                  _loc6_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/mount/skill.swf");
               }
               _loc6_.name = "Skill:" + _loc3_;
            }
            this.container.addChild(_loc6_);
            _loc6_.x = _loc5_.x - 13;
            _loc6_.y = _loc5_.y - 13;
            if(_loc5_.id < this.id)
            {
               _loc6_.filters = [];
            }
            else
            {
               _loc6_.filters = StaticValue.blackWhiteFilter;
            }
            if(!_loc6_.hasEventListener(MouseEvent.MOUSE_OVER))
            {
               _loc6_.addEventListener(MouseEvent.MOUSE_OVER,this.onPointTip);
            }
            if(!_loc6_.hasEventListener(MouseEvent.MOUSE_OUT))
            {
               _loc6_.addEventListener(MouseEvent.MOUSE_OUT,this.onPointTip);
            }
            if(!_loc6_.hasEventListener(MouseEvent.CLICK))
            {
               _loc6_.addEventListener(MouseEvent.CLICK,this.onPointClick);
            }
            _loc3_++;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this.$parent.dispatchEvent(new BaseEvent(RideFeedPanel.UI_RIDE_SHOUYUAN_PRE_NEXT,"",this.now - 1));
               break;
            case this.nextButton:
               this.$parent.dispatchEvent(new BaseEvent(RideFeedPanel.UI_RIDE_SHOUYUAN_PRE_NEXT,"",this.now + 1));
               break;
            case this.xiuLianBtn:
               this.$parent.dispatchEvent(new BaseEvent(RideFeedPanel.UI_RIDE_SHOUYUAN_XIULIAN,"",[this.curObj.id,this.curObj.skill]));
         }
      }
      
      private function onPointClick(param1:MouseEvent) : void
      {
         var _loc4_:String = null;
         var _loc5_:ItemFace = null;
         var _loc2_:String = (param1.target as DisplayObject).name.split(":")[1];
         var _loc3_:int = parseInt(_loc2_);
         this.showItem(false);
         if(this.dataArr[_loc3_].id == this.id)
         {
            this.curObj = this.dataArr[_loc3_];
            POPWindowManager.showWindow(this.pointPanel);
            this.pointPanel.setId(this.dataArr[_loc3_].id);
            this.pointPanel.setItem(new Goods(40290));
            this.pointPanel.setPoint(this.dataArr[_loc3_].name);
            if(this.curObj.type == 0)
            {
               _loc4_ = LanResManager.getLanCommonTextWords("攻击") + ":" + this.curObj.gongji + "    " + LanResManager.getLanCommonTextWords("防御") + ":" + this.curObj.fangyu + "    " + LanResManager.getLanCommonTextWords("生命") + ":" + this.curObj.shengming + "<br>" + LanResManager.getLanCommonTextWords("暴击") + ":" + this.curObj.baoji + "  " + LanResManager.getLanCommonTextWords("闪避") + ":" + this.curObj.shanbi + "  " + LanResManager.getLanCommonTextWords("内力") + ":" + this.curObj.neili + "  " + LanResManager.getLanCommonTextWords("体力") + ":" + this.curObj.tili;
            }
            else
            {
               _loc4_ = LanResManager.getLanCommonTextWords("解封兽元武功点。");
            }
            this.pointPanel.setPrize(_loc4_);
            this.pointPanel.setExpandGas(this.dataArr[_loc3_].zhenqi,this.nowZhenQi);
            this.pointPanel.setProbability(this.dataArr[_loc3_].lv / 100);
         }
         else
         {
            if(this.dataArr[_loc3_].id > this.id)
            {
               return;
            }
            this.curObj = this.dataArr[_loc3_];
            if(this.curObj.type == 1)
            {
               this.nameText.htmlText = this.curObj.name;
               this.showItem(true);
               while(this.skillSpr.numChildren != 0)
               {
                  this.skillSpr.removeChildAt(0);
               }
               if(this.curObj.skill != 0)
               {
                  _loc5_ = new ItemFace(new Goods(this.curObj.skill));
                  this.skillSpr.addChild(_loc5_);
               }
            }
            else
            {
               this.showItem(false);
            }
         }
      }
      
      public function showItem(param1:Boolean) : void
      {
         this.nameText.visible = param1;
         this.slot.visible = param1;
         this.skillSpr.visible = param1;
         this.xiuLianBtn.visible = param1;
      }
      
      private function onPointTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               (param1.target as DisplayObject).addEventListener(MouseEvent.MOUSE_MOVE,this.onPointTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = (param1.target as DisplayObject).name.split(":")[1];
               _loc3_ = parseInt(_loc2_);
               _loc4_ = LanResManager.getLanCommonTextWords("兽元名称：") + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + this.dataArr[_loc3_].name + "</font><br>" + LanResManager.getLanCommonTextWords("兽元属性：") + "<br>";
               _loc4_ = _loc4_ + ("<font color=\'" + StaticValue.GREEN_HTML + "\'>");
               if(this.dataArr[_loc3_].type == 0)
               {
                  _loc4_ += this.dataArr[_loc3_].gongji > 0 ? LanResManager.getLanCommonTextWords("攻击") + ":" + this.dataArr[_loc3_].gongji + "<br>" : "";
                  _loc4_ = _loc4_ + (this.dataArr[_loc3_].fangyu > 0 ? LanResManager.getLanCommonTextWords("防御") + ":" + this.dataArr[_loc3_].fangyu + "<br>" : "");
                  _loc4_ = _loc4_ + (this.dataArr[_loc3_].baoji > 0 ? LanResManager.getLanCommonTextWords("暴击") + ":" + this.dataArr[_loc3_].baoji + "<br>" : "");
                  _loc4_ = _loc4_ + (this.dataArr[_loc3_].shanbi > 0 ? LanResManager.getLanCommonTextWords("闪避") + ":" + this.dataArr[_loc3_].shanbi + "<br>" : "");
                  _loc4_ = _loc4_ + (this.dataArr[_loc3_].shengming > 0 ? LanResManager.getLanCommonTextWords("生命") + ":" + this.dataArr[_loc3_].shengming + "<br>" : "");
                  _loc4_ = _loc4_ + (this.dataArr[_loc3_].neili > 0 ? LanResManager.getLanCommonTextWords("内力") + ":" + this.dataArr[_loc3_].neili + "<br>" : "");
                  _loc4_ = _loc4_ + (this.dataArr[_loc3_].tili > 0 ? LanResManager.getLanCommonTextWords("体力") + ":" + this.dataArr[_loc3_].tili + "<br>" : "");
               }
               else
               {
                  _loc4_ += LanResManager.getLanCommonTextWords("兽元武功");
               }
               _loc4_ += "</font>";
               this.showTip(_loc4_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               (param1.target as DisplayObject).addEventListener(MouseEvent.MOUSE_MOVE,this.onPointTip);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
      
      public function setData(param1:int, param2:int, param3:int, param4:Array, param5:int) : void
      {
         this.now = param1;
         this.max = param2;
         this.id = param3;
         this.dataArr = param4;
         this.nowZhenQi = param5;
         this.showItem(false);
         this.setBtn();
         this.setPoint(param4);
         this.setBg();
      }
      
      public function showShouYuanTuPo(param1:Boolean) : void
      {
         if(!param1)
         {
            POPWindowManager.closeWindow();
         }
      }
      
      public function selectShouYuan(param1:int) : void
      {
         var obj:Object = null;
         var item:ItemFace = null;
         var loadUrl:String = null;
         var id:int = param1;
         for each(obj in this.dataArr)
         {
            if(obj.id == id)
            {
               this.curObj = obj;
               if(this.curObj.type == 1)
               {
                  this.nameText.htmlText = this.curObj.name;
                  this.showItem(true);
                  while(this.skillSpr.numChildren != 0)
                  {
                     this.skillSpr.removeChildAt(0);
                  }
                  if(this.curObj.skill != 0)
                  {
                     item = new ItemFace(new Goods(this.curObj.skill));
                     this.skillSpr.addChild(item);
                  }
                  if(this.itemMc != null && this.itemMc.parent != null)
                  {
                     this.itemMc.stop();
                     this.itemMc.parent.removeChild(this.itemMc);
                  }
                  if(this.itemMc != null)
                  {
                     this.skillSpr.addChild(this.itemMc);
                     this.itemMc.gotoAndPlay(0);
                  }
                  else
                  {
                     loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/mount/item.swf";
                     LoaderManager.lazyLoad(function(param1:Event):void
                     {
                        var _loc2_:LoadingItem = param1.target as LoadingItem;
                        itemMc = _loc2_.content as MovieClip;
                        if(itemMc)
                        {
                           itemMc.gotoAndPlay(0);
                           skillSpr.addChild(itemMc);
                           itemMc.x = -33;
                           itemMc.y = -33;
                        }
                     },null,false,loadUrl);
                  }
               }
               return;
            }
         }
      }
      
      public function setBtn() : void
      {
         if(this.now < this.max)
         {
            this.nextButton.enabled = true;
         }
         else
         {
            this.nextButton.enabled = false;
         }
         if(this.now > 1)
         {
            this.previousButton.enabled = true;
         }
         else
         {
            this.previousButton.enabled = false;
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.pointPanel.$parent = param1;
      }
   }
}

