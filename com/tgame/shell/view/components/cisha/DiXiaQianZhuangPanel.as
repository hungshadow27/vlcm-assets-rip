package com.tgame.shell.view.components.cisha
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class DiXiaQianZhuangPanel extends FPanel
   {
      
      public static const UI_DIXIAQIANZHUANG_PANEL_DUIHUAN:String = "UI_DIXIAQIANZHUANG_PANEL_DUIHUAN";
      
      private var container:Sprite;
      
      private var fc_left:FCanvas;
      
      private var fc_right:FCanvas;
      
      private var bit:Bitmap;
      
      private var ft_up:FTextArea;
      
      private var ft_down:FTextArea;
      
      private var btn:SecondButton;
      
      private var line:Bitmap;
      
      private var scroll:FVScorllBar;
      
      public function DiXiaQianZhuangPanel()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 655 + 16;
         height = 453;
         titleText = LanResManager.getLanCommonTextWords("地下钱庄");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.container = new Sprite();
         addChild(this.container);
         with(this.container.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,645,315);
            endFill();
         }
         this.container.x = 3;
         this.container.y = 3;
         this.scroll = new FVScorllBar(this.container,373);
         addChild(this.scroll);
         this.scroll.x = 645 - 1;
         this.scroll.y = 2;
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init(param1:Array) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:DisplayObject = null;
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         _loc3_ = 0;
         if(param1.length % 2 == 0)
         {
            _loc3_ = param1.length / 2;
         }
         else
         {
            _loc3_ = int(param1.length / 2) + 1;
         }
         this.fc_left = new FCanvas();
         this.fc_left.x = 12 - 1;
         this.fc_left.y = 1;
         this.fc_left.width = 312;
         this.fc_left.height = 77 * _loc3_ - 20 + 7;
         this.fc_left.skin = "box_transparence";
         this.container.addChild(this.fc_left);
         this.fc_right = new FCanvas();
         this.fc_right.x = 319 + 3 + 2;
         this.fc_right.y = 1;
         this.fc_right.width = 315;
         this.fc_right.height = this.fc_left.height;
         this.fc_right.skin = "box_transparence";
         this.container.addChild(this.fc_right);
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            _loc2_ = new Object();
            _loc2_ = param1[_loc4_] as Object;
            this.bit = StaticValue.getBitmapByClassName("ui.mall.goods.slot");
            this.container.addChild(this.bit);
            this.bit.x = _loc4_ % 2 * 320 + 14;
            this.bit.y = int(_loc4_ / 2) * 75 + 4 - int(_loc4_ / 2) * 1;
            _loc5_ = new Goods(_loc2_.goodid);
            _loc6_ = FLoader.startLoad(_loc5_.getBigICOPath(),65,65);
            addChild(_loc6_);
            _loc6_.x = _loc4_ % 2 * 320 + 14 + 4 - 2;
            _loc6_.y = int(_loc4_ / 2) * 75 + 4 - int(_loc4_ / 2) * 1 + 4 - 2;
            this.container.addChild(_loc6_);
            this.ft_up = new FTextArea();
            this.ft_up.x = _loc4_ % 2 * 315 + 95;
            this.ft_up.y = int(_loc4_ / 2) * 65 + 25 + int(_loc4_ / 2) * 6;
            this.ft_up.width = 80;
            this.ft_up.autoSize = TextFieldAutoSize.LEFT;
            this.ft_up.textColor = StaticValue.ORANGE;
            this.ft_up.filters = StaticValue.filter;
            this.ft_up.htmlText = _loc2_.jp + LanResManager.getLanCommonTextWords("金票");
            this.container.addChild(this.ft_up);
            this.ft_down = new FTextArea();
            this.ft_down.x = _loc4_ % 2 * 315 + 95;
            this.ft_down.y = int(_loc4_ / 2) * 70 + 45 + int(_loc4_ / 2) * 2;
            this.ft_down.width = 140;
            this.ft_down.autoSize = TextFieldAutoSize.LEFT;
            this.ft_down.textColor = StaticValue.GREEN;
            this.ft_down.filters = StaticValue.filter;
            this.ft_down.htmlText = LanResManager.getLanCommonTextWords("需要：") + _loc2_.yz + LanResManager.getLanCommonTextWords("碎银子");
            this.container.addChild(this.ft_down);
            this.btn = new SecondButton();
            this.btn.x = _loc4_ % 2 * 330 + 235;
            this.btn.y = int(_loc4_ / 2) * 68 + 45 + int(_loc4_ / 2) * 6;
            this.btn.label = LanResManager.getLanCommonTextWords("兑换");
            this.container.addChild(this.btn);
            this.btn.name = _loc2_.goodid + "," + _loc2_.id;
            this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
            this.line = new Bitmap();
            this.line = StaticValue.getBitmapByClassName("ui.line");
            this.line.x = _loc4_ % 2 * 313 + 17;
            this.line.y = int(_loc4_ / 2) * 74;
            this.line.width = 305;
            this.container.addChild(this.line);
            _loc4_++;
         }
         this.scroll.update();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.target.name;
         dispatchEvent(new BaseEvent(UI_DIXIAQIANZHUANG_PANEL_DUIHUAN,"",_loc2_));
      }
      
      public function setArr(param1:Array) : void
      {
         this.init(param1);
      }
   }
}

