package com.tgame.shell.view.components.friend
{
   import com.fireice.list.FList;
   import com.fireice.list.FListCellRenderer;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
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
   import flash.text.*;
   
   public class NPCCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      public var _parent:DisplayObject;
      
      private var charList:FList;
      
      private var listScroll:FVScorllBar;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var icoContainer:Sprite;
      
      public function NPCCanvas()
      {
         var lb:FLabel;
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
         this.icoContainer.x = 70;
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.friend.ui.1";
         lb = new FLabel();
         with(lb)
         {
            x = 40;
            y = 7;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"NPC好友名称");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 162;
            y = 7;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(FriendCanvas,"友好度");
         }
         addChild(lb);
         this.charList = new FList();
         this.charList.skin = "list";
         this.charList.itemRenderer = new NPCListRender();
         this.charList.listWidth = 200;
         this.charList.listHeight = 255;
         addChild(this.charList);
         this.charList.x = 3;
         this.charList.y = 29;
         this.charList.addEventListener(MouseEvent.CLICK,this.onList);
         this.listScroll = new FVScorllBar(this.charList,255);
         addChild(this.listScroll);
         this.listScroll.x = 204;
         this.listScroll.y = 29;
         lb = new FLabel();
         with(lb)
         {
            x = 27;
            y = 299;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanTextWords(this,"NPC好友来源");
         }
         addChild(lb);
      }
      
      private function onList(param1:MouseEvent) : void
      {
         var _loc2_:Object = null;
         switch(param1.type)
         {
            case MouseEvent.CLICK:
               if(param1.target is FTextArea)
               {
                  this._parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_FRIEND_MENU_SHOW,"",[int(this.charList.selectItem.label),this.charList.selectItem.playerName,int(this.charList.selectItem.line),5,param1]));
               }
               break;
            case MouseEvent.MOUSE_OVER:
               Tools.currentStage.addChild(this.tipCanvas);
               this.tipCanvas.visible = false;
               break;
            case MouseEvent.MOUSE_MOVE:
               if(param1.target as FTextArea)
               {
                  _loc2_ = ((param1.target as FTextArea).parent as FListCellRenderer).data;
                  if(((param1.target as FTextArea).parent as FListCellRenderer).data == this.charList.selectItem)
                  {
                     this.tipCanvas.visible = false;
                     return;
                  }
                  this.showTip(_loc2_.playerName,_loc2_.moodTxt,_loc2_.moodIco.split());
               }
               else
               {
                  this.tipCanvas.visible = false;
               }
               break;
            case MouseEvent.MOUSE_OUT:
               Tools.currentStage.removeChild(this.tipCanvas);
         }
      }
      
      private function showTip(param1:String, param2:String, param3:Array) : void
      {
         this.tip.text = param1 + "\n" + param2;
         this.tipCanvas.width = 70 + this.icoContainer.width > this.tip.width ? 70 + this.icoContainer.width + 4 : this.tip.width + 4;
         this.tipCanvas.height = this.tip.height > this.icoContainer.height ? this.tip.height + 4 : this.icoContainer.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 10;
         this.tipCanvas.y = Tools.currentStage.mouseY + 20;
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

