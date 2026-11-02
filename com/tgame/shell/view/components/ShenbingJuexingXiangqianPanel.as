package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.BaseItem;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ShenbingJuexingXiangqianPanel extends FPanel
   {
      
      public static const UI_PAGE_BTN_2_CLICK:String = "UI_PAGE_BTN_2_CLICK";
      
      public static const UI_START_LAST_BTN_2_CLICK:String = "UI_START_LAST_BTN_2_CLICK";
      
      public static const UI_SHENBINGXIANGQIAN_DRAG:String = "UI_SHENBINGXIANGQIAN_DRAG";
      
      public static const UI_SHENBINGXIANGQIAN_JIESHOU_DRAG:String = "UI_SHENBINGXIANGQIAN_JIESHOU_DRAG";
      
      private var preBtn:SmallButton;
      
      private var pageCount:FLabel;
      
      private var nextBtn:SmallButton;
      
      private var startBtn:SmallButton;
      
      private var lastBtn:SmallButton;
      
      private var spContainer:Sprite;
      
      private var fengkuang:Sprite;
      
      private var xqSprite:Sprite;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      public function ShenbingJuexingXiangqianPanel()
      {
         var bg:DisplayObject = null;
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 640 - 88;
         height = 348;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         titleText = LanResManager.getLanCommonTextWords("神兵觉醒镶嵌");
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shenbingjuexing/bg.swf");
         bg.x = 10;
         bg.y = 2;
         addChild(bg);
         this.startBtn = new SmallButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("首页");
         addChild(this.startBtn);
         this.startBtn.x = 145 + 80 - 88 + 45;
         this.startBtn.y = 282;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.preBtn = new SmallButton();
         this.preBtn.label = LanResManager.getLanCommonTextWords("上一页");
         addChild(this.preBtn);
         this.preBtn.x = 180 + 80 - 88 + 45;
         this.preBtn.y = 282;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pageCount = new FLabel();
         with(this.pageCount)
         {
            x = 230 + 80 - 88 + 45;
            y = 282;
            textColor = StaticValue.WHITE;
            text = "1/1";
         }
         addChild(this.pageCount);
         this.nextBtn = new SmallButton();
         this.nextBtn.label = LanResManager.getLanCommonTextWords("下一页");
         addChild(this.nextBtn);
         this.nextBtn.x = 254 + 80 - 88 + 45;
         this.nextBtn.y = 282;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lastBtn = new SmallButton();
         this.lastBtn.label = LanResManager.getLanCommonTextWords("尾页");
         addChild(this.lastBtn);
         this.lastBtn.x = 302 + 80 - 88 + 45;
         this.lastBtn.y = 282;
         this.lastBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fengkuang = new Sprite();
         this.fengkuang.x = 25;
         this.fengkuang.y = 16;
         addChild(this.fengkuang);
         with(this.fengkuang.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,509,66);
            endFill();
         }
         this.xqSprite = new Sprite();
         this.xqSprite.x = 24;
         this.xqSprite.y = 16;
         addChild(this.xqSprite);
         with(this.xqSprite.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,509,66);
            endFill();
         }
         this.xqSprite.addEventListener(MouseEvent.MOUSE_UP,this.showMenu);
         this.spContainer = new Sprite();
         this.spContainer.x = 24;
         this.spContainer.y = 93 + 15;
         addChild(this.spContainer);
         with(this.spContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,511,162);
            endFill();
         }
         this.spContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown2);
         this.spContainer.addEventListener(MouseEvent.MOUSE_UP,this.showMenu2);
         this.setFengKuang(0);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.preBtn:
               this.dispatchEvent(new BaseEvent(UI_PAGE_BTN_2_CLICK,"",1));
               break;
            case this.nextBtn:
               this.dispatchEvent(new BaseEvent(UI_PAGE_BTN_2_CLICK,"",2));
               break;
            case this.startBtn:
               this.dispatchEvent(new BaseEvent(UI_START_LAST_BTN_2_CLICK,"",1));
               break;
            case this.lastBtn:
               this.dispatchEvent(new BaseEvent(UI_START_LAST_BTN_2_CLICK,"",2));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function showMenu(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.xqSprite.mouseY > 0 && this.xqSprite.mouseY < 73)
         {
            if(this.xqSprite.mouseX > 0 && this.xqSprite.mouseX < 88)
            {
               _loc2_ = 1;
            }
            else if(this.xqSprite.mouseX > 88 && this.xqSprite.mouseX < 176)
            {
               _loc2_ = 2;
            }
            else if(this.xqSprite.mouseX > 176 && this.xqSprite.mouseX < 264)
            {
               _loc2_ = 3;
            }
            else if(this.xqSprite.mouseX > 264 && this.xqSprite.mouseX < 352)
            {
               _loc2_ = 4;
            }
            else if(this.xqSprite.mouseX > 352 && this.xqSprite.mouseX < 440)
            {
               _loc2_ = 5;
            }
            else if(this.xqSprite.mouseX > 440 && this.xqSprite.mouseX < 528)
            {
               _loc2_ = 6;
            }
         }
         if(_loc2_ == 0)
         {
            return;
         }
         dispatchEvent(new BaseEvent(UI_SHENBINGXIANGQIAN_JIESHOU_DRAG,"",[param1,_loc2_]));
      }
      
      private function onMouseDown2(param1:MouseEvent) : void
      {
         this.spContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onSkillMouseMove(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.spContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            dispatchEvent(new BaseEvent(UI_SHENBINGXIANGQIAN_DRAG,"",this.currItem));
            this.spContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function showMenu2(param1:MouseEvent) : void
      {
         this.spContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function setPageCount(param1:int, param2:int) : void
      {
         this.pageCount.text = param1 + "/" + param2;
         if(param1 == 1 && param2 == 1)
         {
            this.preBtn.enabled = this.nextBtn.enabled = false;
            this.startBtn.enabled = this.lastBtn.enabled = false;
         }
         else
         {
            if(param1 == 1)
            {
               this.preBtn.enabled = false;
               this.startBtn.enabled = false;
            }
            else
            {
               this.preBtn.enabled = true;
               this.startBtn.enabled = true;
            }
            if(param1 == param2)
            {
               this.nextBtn.enabled = false;
               this.lastBtn.enabled = false;
            }
            else
            {
               this.nextBtn.enabled = true;
               this.lastBtn.enabled = true;
            }
         }
      }
      
      public function setFengKuang(param1:int = 0) : void
      {
         var _loc2_:DisplayObject = null;
         while(this.fengkuang.numChildren > 0)
         {
            this.fengkuang.removeChildAt(0);
         }
         var _loc3_:int = 0;
         while(_loc3_ < 6 - param1)
         {
            _loc2_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shenbingjuexing/feng.swf");
            _loc2_.x = _loc3_ * -88 + 439;
            _loc2_.y = 0;
            this.fengkuang.addChild(_loc2_);
            _loc3_++;
         }
      }
      
      public function setXunzhangKeXiangqian(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         while(this.spContainer.numChildren > 0)
         {
            _loc2_ = this.spContainer.getChildAt(0) as ItemFace;
            this.spContainer.removeChildAt(0);
            _loc2_.destroy();
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ = new ItemFace(param1[_loc3_],65,65);
            _loc2_.setShowCount(false);
            _loc2_.x = _loc3_ % 6 * 88;
            _loc2_.y = int(_loc3_ / 6) * 88;
            _loc2_.filters = Tools.blackWhiteFilter;
            this.spContainer.addChild(_loc2_);
            _loc3_++;
         }
      }
      
      public function setXunzhangXiangqian(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:int = 0;
         var _loc5_:BaseItem = null;
         var _loc6_:int = 0;
         while(this.xqSprite.numChildren > 0)
         {
            _loc2_ = this.xqSprite.getChildAt(0) as ItemFace;
            this.xqSprite.removeChildAt(0);
            _loc2_.destroy();
         }
         var _loc4_:int = int(param1.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param1[_loc3_];
            _loc6_ = _loc5_.position;
            _loc2_ = new ItemFace(_loc5_,65,65);
            _loc2_.showRedMask();
            _loc2_.setShowCount(false);
            switch(_loc6_)
            {
               case 1:
                  _loc2_.x = 0;
                  _loc2_.y = 0;
                  break;
               case 2:
                  _loc2_.x = 88;
                  _loc2_.y = 0;
                  break;
               case 3:
                  _loc2_.x = 88 * 2;
                  _loc2_.y = 0;
                  break;
               case 4:
                  _loc2_.x = 88 * 3;
                  _loc2_.y = 0;
                  break;
               case 5:
                  _loc2_.x = 88 * 4;
                  _loc2_.y = 0;
                  break;
               case 6:
                  _loc2_.x = 88 * 5;
                  _loc2_.y = 0;
            }
            this.xqSprite.addChild(_loc2_);
            _loc3_++;
         }
      }
   }
}

