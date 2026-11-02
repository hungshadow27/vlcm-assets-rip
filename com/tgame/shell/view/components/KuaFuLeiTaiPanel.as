package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.list.FListCellRenderer;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.NewButton;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.kuafuleitai.KuaFuleitaiDefaultCanvas;
   import com.tgame.shell.view.components.kuafuleitai.LeitaiItemListRenderer;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.text.TextFieldAutoSize;
   import flash.utils.Timer;
   
   public class KuaFuLeiTaiPanel extends FPanel
   {
      
      public static const LEITAIBUTTON_CLICK:String = "LEITAIBUTTON_CLICK";
      
      public static const JINRULEITAI:String = "JINRULEITAI";
      
      public static const KUAFUBAOGUO:String = "KUAFUBAOGUO";
      
      private var tipRightCanvas:FCanvas;
      
      private var tipRight:FTextArea;
      
      private var leftbuttonContainer:Sprite;
      
      private var rightContainer:Sprite;
      
      private var leitaiList:FList;
      
      private var scroll:FVScorllBar;
      
      private var jinruBtn:SecondButton;
      
      private var kuaisujinruBtn:SecondButton;
      
      private var kuafubaoguoBtn:SecondButton;
      
      private var timeText:FTextArea;
      
      private var defaultCanvas:KuaFuleitaiDefaultCanvas;
      
      private var _timer:Timer;
      
      private var fc1:FCanvas;
      
      private var fc2:FCanvas;
      
      private var prebtn:NewButton;
      
      public function KuaFuLeiTaiPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 346;
         height = 372;
         this.titleText = LanResManager.getLanCommonTextWords("跨服擂台");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tipRightCanvas = new FCanvas();
         this.tipRightCanvas.skin = "backGroud";
         this.tipRight = new FTextArea();
         this.tipRight.x = 2;
         this.tipRight.y = 2;
         this.tipRight.autoSize = TextFieldAutoSize.LEFT;
         this.tipRight.textColor = StaticValue.WHITE;
         this.tipRight.filters = StaticValue.filter;
         this.tipRight.text = LanResManager.getLanCommonTextWords("选择一个房间，点击下方的进入按钮，进入擂台。");
         this.tipRightCanvas.addChild(this.tipRight);
         this.fc1 = new FCanvas();
         this.fc1.width = 252;
         this.fc1.height = 326;
         this.fc1.x = 86;
         this.fc1.y = 2;
         this.fc1.skin = "box";
         addChild(this.fc1);
         this.fc2 = new FCanvas();
         this.fc2.width = 248;
         this.fc2.height = 265;
         this.fc2.skin = "box_transparence";
         this.fc2.x = 2;
         this.fc2.y = 30;
         this.rightContainer = new Sprite();
         this.rightContainer.x = 86;
         this.rightContainer.y = 2;
         this.rightContainer.addChild(this.fc2);
         this.defaultCanvas = new KuaFuleitaiDefaultCanvas();
         this.defaultCanvas.x = 87;
         this.defaultCanvas.y = 2;
         addChild(this.defaultCanvas);
         this.leftbuttonContainer = new Sprite();
         this.leftbuttonContainer.x = 10;
         this.leftbuttonContainer.y = 2;
         this.addChild(this.leftbuttonContainer);
         this.timeText = new FTextArea();
         this.timeText.x = 42;
         this.timeText.y = 8;
         this.timeText.width = 170;
         this.timeText.height = 22;
         this.timeText.textColor = StaticValue.GREEN;
         this.timeText.text = LanResManager.getLanCommonTextWords("下一场比赛开始倒计时:0秒");
         this.rightContainer.addChild(this.timeText);
         this.leitaiList = new FList();
         this.leitaiList.doubleClickEnabled = true;
         this.leitaiList.skin = "list";
         this.leitaiList.listWidth = 200;
         this.leitaiList.listHeight = 260;
         this.leitaiList.itemRenderer = new LeitaiItemListRenderer();
         this.rightContainer.addChild(this.leitaiList);
         this.leitaiList.x = 24;
         this.leitaiList.y = 32;
         this.leitaiList.addEventListener(MouseEvent.MOUSE_OVER,this.onListMouse);
         this.leitaiList.addEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
         this.leitaiList.addEventListener(MouseEvent.MOUSE_OUT,this.onListMouse);
         this.scroll = new FVScorllBar(this.leitaiList,260);
         this.rightContainer.addChild(this.scroll);
         this.scroll.x = 231;
         this.scroll.y = 32;
         this.jinruBtn = new SecondButton();
         this.jinruBtn.label = LanResManager.getLanCommonTextWords("进入");
         this.jinruBtn.align = "center";
         this.jinruBtn.height = 22;
         this.jinruBtn.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.jinruBtn.y = 298;
         this.jinruBtn.x = 8;
         this.rightContainer.addChild(this.jinruBtn);
         this.kuaisujinruBtn = new SecondButton();
         this.kuaisujinruBtn.label = LanResManager.getLanCommonTextWords("快速进入");
         this.kuaisujinruBtn.align = "center";
         this.kuaisujinruBtn.height = 22;
         this.kuaisujinruBtn.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.kuaisujinruBtn.y = 298;
         this.kuaisujinruBtn.x = 77;
         this.rightContainer.addChild(this.kuaisujinruBtn);
         this.kuafubaoguoBtn = new SecondButton();
         this.kuafubaoguoBtn.label = LanResManager.getLanCommonTextWords("跨服包裹");
         this.kuafubaoguoBtn.align = "center";
         this.kuafubaoguoBtn.height = 22;
         this.kuafubaoguoBtn.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.kuafubaoguoBtn.y = 298;
         this.kuafubaoguoBtn.x = 171;
         this.rightContainer.addChild(this.kuafubaoguoBtn);
      }
      
      private function onListMouse(param1:MouseEvent) : void
      {
         var _loc2_:FListCellRenderer = null;
         var _loc3_:Point = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               Tools.currentStage.addChild(this.tipRightCanvas);
               this.tipRightCanvas.visible = false;
               this.leitaiList.addEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(param1.target as FListCellRenderer)
               {
                  _loc2_ = param1.target as FListCellRenderer;
                  this.tipRightCanvas.width = this.tipRight.width + 4;
                  this.tipRightCanvas.height = this.tipRight.height + 4;
                  _loc3_ = _loc2_.parent.localToGlobal(new Point(_loc2_.x,_loc2_.y));
                  this.tipRightCanvas.x = _loc3_.x + _loc2_.width;
                  this.tipRightCanvas.y = _loc3_.y;
                  this.tipRightCanvas.visible = true;
               }
               else
               {
                  this.tipRightCanvas.visible = false;
               }
               break;
            case MouseEvent.MOUSE_OUT:
               this.leitaiList.removeEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               Tools.currentStage.removeChild(this.tipRightCanvas);
         }
      }
      
      private function onButtonClick(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc2_:SecondButton = param1.target as SecondButton;
         switch(_loc2_.label)
         {
            case LanResManager.getLanCommonTextWords("进入"):
               _loc3_ = 0;
               _loc4_ = this.leitaiList.selectItem;
               if(_loc4_ != null)
               {
                  _loc3_ = int(_loc4_.id);
                  dispatchEvent(new BaseEvent(JINRULEITAI,"",_loc3_));
               }
               break;
            case LanResManager.getLanCommonTextWords("快速进入"):
               dispatchEvent(new BaseEvent(JINRULEITAI,"","0"));
               break;
            case LanResManager.getLanCommonTextWords("跨服包裹"):
               dispatchEvent(new BaseEvent(KUAFUBAOGUO));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setLeiTaiData(param1:XML) : void
      {
         this.leitaiList.dataProvider = param1;
         this.showList(true);
         this.scroll.update();
         this.setBtnState(this.prebtn);
      }
      
      public function setDaojishi(param1:int) : void
      {
         if(this._timer == null)
         {
            this._timer = new Timer(1000,0);
         }
         if(this._timer.running)
         {
            this._timer.reset();
         }
         this._timer.repeatCount = param1;
         this._timer.delay = 1000;
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this._timer.start();
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
         this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this.timeText.text = LanResManager.getLanCommonTextWords("比赛传入截止倒计时") + ":" + (this._timer.repeatCount - this._timer.currentCount).toString() + LanResManager.getLanCommonTextWords("秒");
      }
      
      public function setShijianduan(param1:Number, param2:Number) : void
      {
         var _loc3_:Date = new Date();
         _loc3_.setTime(param1);
         var _loc4_:Date = new Date();
         _loc4_.setTime(param2);
         var _loc5_:String = (_loc3_.getHours() < 10 ? "0" + _loc3_.getHours().toString() : _loc3_.getHours().toString()) + ":" + (_loc3_.getMinutes() < 10 ? "0" + _loc3_.getMinutes().toString() : _loc3_.getMinutes().toString());
         var _loc6_:String = (_loc4_.getHours() < 10 ? "0" + _loc4_.getHours().toString() : _loc4_.getHours().toString()) + ":" + (_loc4_.getMinutes() < 10 ? "0" + _loc4_.getMinutes().toString() : _loc4_.getMinutes().toString());
         this.timeText.text = LanResManager.getLanCommonTextWords("比赛传入时间") + ":" + _loc5_ + "-" + _loc6_;
      }
      
      private function showList(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.contains(this.defaultCanvas))
            {
               removeChild(this.defaultCanvas);
            }
            if(!this.contains(this.rightContainer))
            {
               addChild(this.rightContainer);
            }
         }
         else
         {
            if(this.contains(this.rightContainer))
            {
               removeChild(this.rightContainer);
            }
            if(!this.contains(this.defaultCanvas))
            {
               addChild(this.defaultCanvas);
            }
         }
      }
      
      public function resetUI() : void
      {
         if(this.contains(this.rightContainer))
         {
            removeChild(this.rightContainer);
         }
         if(!this.contains(this.defaultCanvas))
         {
            addChild(this.defaultCanvas);
         }
      }
      
      public function setLeftButtons(param1:Array) : void
      {
         var _loc3_:Object = null;
         var _loc4_:NewButton = null;
         if(null != this.leftbuttonContainer && this.contains(this.leftbuttonContainer))
         {
            this.removeChild(this.leftbuttonContainer);
         }
         this.leftbuttonContainer = new Sprite();
         addChild(this.leftbuttonContainer);
         this.leftbuttonContainer.x = 10;
         this.leftbuttonContainer.y = 2;
         var _loc2_:int = 0;
         for each(_loc3_ in param1)
         {
            _loc4_ = new NewButton();
            _loc4_.name = _loc3_.id;
            _loc4_.label = _loc3_.name;
            _loc4_.y = _loc2_ * 20;
            _loc4_.width = 76;
            _loc4_.align = "center";
            _loc4_.height = 22;
            _loc4_.addEventListener(MouseEvent.CLICK,this.onLeftBtnClick,false,0,true);
            _loc4_.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + _loc3_.miaoshu + "</font>";
            this.leftbuttonContainer.addChild(_loc4_);
            _loc2_++;
         }
         this.showList(false);
      }
      
      private function onLeftBtnClick(param1:MouseEvent) : void
      {
         var _loc2_:NewButton = param1.target as NewButton;
         if(_loc2_.name != "" && _loc2_.label != "")
         {
            this.prebtn = _loc2_;
            dispatchEvent(new BaseEvent(LEITAIBUTTON_CLICK,"",_loc2_.name));
         }
      }
      
      private function setBtnState(param1:NewButton) : void
      {
         var _loc3_:NewButton = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.leftbuttonContainer.numChildren)
         {
            _loc3_ = this.leftbuttonContainer.getChildAt(_loc2_) as NewButton;
            if(_loc3_ != null)
            {
               if(param1 != null && _loc3_ == param1)
               {
                  _loc3_.skin = "selectButton";
               }
               else
               {
                  _loc3_.skin = "newButton";
               }
            }
            _loc2_++;
         }
      }
   }
}

