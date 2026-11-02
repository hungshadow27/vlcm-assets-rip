package com.tgame.shell.view.components.friend
{
   import com.fireice.list.FList;
   import com.fireice.list.FListCellRenderer;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.FriendPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class BlackCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      public var _parent:DisplayObject;
      
      private var charList:FList;
      
      private var listScroll:FVScorllBar;
      
      private var overID:int;
      
      private var overName:String;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var icoContainer:Sprite;
      
      private var addBtn:SecondButton;
      
      public function BlackCanvas()
      {
         var ft:FTextArea;
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 6;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BLUE;
         }
         this.tipCanvas.addChild(this.tip);
         this.icoContainer = new Sprite();
         this.tipCanvas.addChild(this.icoContainer);
         this.icoContainer.y = 4;
         this.icoContainer.x = 70;
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.friend.ui.2";
         this.charList = new FList();
         this.charList.skin = "list";
         this.charList.itemRenderer = new BlackListRender();
         this.charList.listWidth = 200;
         this.charList.listHeight = 281;
         addChild(this.charList);
         this.charList.x = 3;
         this.charList.y = 3;
         this.charList.addEventListener(MouseEvent.CLICK,this.onList);
         this.charList.addEventListener(MouseEvent.MOUSE_OVER,this.onList);
         this.charList.addEventListener(MouseEvent.MOUSE_OUT,this.onList);
         this.listScroll = new FVScorllBar(this.charList,281);
         addChild(this.listScroll);
         this.listScroll.x = 204;
         this.listScroll.y = 3;
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,null,null,null,null,0);
            x = 0;
            y = 290;
            width = 221;
            height = 35;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanTextWords(this,"自动过滤");
         }
         addChild(ft);
         this.addBtn = new SecondButton();
         this.addBtn.label = LanResManager.getLanTextWords(this,"添加黑名单");
         addChild(this.addBtn);
         this.addBtn.x = width - this.addBtn.width;
         this.addBtn.y = 298;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_BLACK_ADDBTN_CLICK));
      }
      
      private function onList(param1:MouseEvent) : void
      {
         var _loc2_:FListCellRenderer = null;
         var _loc3_:Object = null;
         var _loc4_:Point = null;
         switch(param1.type)
         {
            case MouseEvent.CLICK:
               if(param1.target is FTextArea)
               {
                  this._parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_FRIEND_MENU_SHOW,"",[int(this.charList.selectItem.label),this.charList.selectItem.playerName,int(this.charList.selectItem.line),3,param1]));
                  this.tipCanvas.visible = false;
               }
               break;
            case MouseEvent.MOUSE_OVER:
               this.overID = 0;
               Tools.currentStage.addChild(this.tipCanvas);
               this.tipCanvas.visible = false;
               this.charList.addEventListener(MouseEvent.MOUSE_MOVE,this.onList);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(param1.target as FTextArea)
               {
                  _loc2_ = (param1.target as FTextArea).parent as FListCellRenderer;
                  _loc3_ = _loc2_.data;
                  this.overName = _loc3_.playerName;
                  if(this.overID != int(_loc3_.label))
                  {
                     if(_loc3_.line == "0")
                     {
                        this.showTip(this.overID,LanResManager.getLanTextWords(this,"不在线"));
                     }
                     else
                     {
                        this._parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_MOUSE_OVER_TIP_SHOW,"",int(_loc3_.label)));
                     }
                     this.overID = int(_loc3_.label);
                  }
                  _loc4_ = _loc2_.parent.localToGlobal(new Point(_loc2_.x,_loc2_.y));
                  this.tipCanvas.x = _loc4_.x - this.tipCanvas.width;
                  this.tipCanvas.y = _loc4_.y;
               }
               else
               {
                  this.tipCanvas.visible = false;
               }
               break;
            case MouseEvent.MOUSE_OUT:
               this.overID = 0;
               this.charList.removeEventListener(MouseEvent.MOUSE_MOVE,this.onList);
               Tools.currentStage.removeChild(this.tipCanvas);
         }
      }
      
      public function showTip(param1:int, param2:String = "", param3:String = "") : void
      {
         var _loc4_:Sprite = null;
         var _loc5_:int = 0;
         if(this.overID != param1)
         {
            return;
         }
         this.tip.htmlText = "<textformat leading=\'6\'>" + this.overName + "<br><font color=\'" + StaticValue.WHITE_HTML + "\'>" + param2 + "</font></textformat>";
         while(this.icoContainer.numChildren > 0)
         {
            this.icoContainer.removeChildAt(0);
         }
         var _loc6_:int = param3.length;
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc4_ = StaticValue.getMCByClassName(FriendPanel.faces[int(param3.charAt(_loc5_))]);
            _loc4_.name = _loc5_.toString();
            _loc4_.buttonMode = true;
            this.icoContainer.addChild(_loc4_);
            _loc4_.x = 22 * _loc5_;
            _loc5_++;
         }
         this.icoContainer.x = this.tip.getCharBoundaries(this.overName.length - 1).x + this.tip.getCharBoundaries(this.overName.length - 1).width + 10;
         this.tipCanvas.width = this.icoContainer.x + this.icoContainer.width > this.tip.width ? this.icoContainer.x + this.icoContainer.width + 4 : this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4 > this.icoContainer.height ? this.tip.height + 12 : this.icoContainer.height + 8;
         this.tipCanvas.visible = true;
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function set dataProvider(param1:XML) : void
      {
         this.charList.dataProvider = param1;
         this.listScroll.update();
      }
   }
}

