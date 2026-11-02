package com.tgame.shell.view.components.instanceportal
{
   import com.fireice.list.FList;
   import com.fireice.list.FListCellRenderer;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class InstancePortalProcessionListPanel extends FPanel
   {
      
      private var listContainer:Sprite;
      
      public var giftList:FList;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public function InstancePortalProcessionListPanel()
      {
         var v:Vector.<Bitmap>;
         var ft:FTextArea;
         var bg:Bitmap = null;
         super();
         dragAble = true;
         this.skin = "sceondPanel";
         this.showCloseButton = false;
         this.dragRestrict = false;
         dragAble = false;
         width = 226;
         height = 265;
         titleText = LanResManager.getLanCommonTextWords("队员列表");
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
         }
         this.tipCanvas.addChild(this.tip);
         bg = new Bitmap();
         bg.name = "ui.instance.listl.ui";
         addChild(bg);
         bg.x = 6;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         ft = new FTextArea();
         with(ft)
         {
            x = 14;
            y = 10;
            width = 210;
            wordWrap = true;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,0);
         }
         addChild(ft);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 7;
            y = 32;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,212,200);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new ProcessionListRender();
         this.giftList.listWidth = 212;
         this.listContainer.addChild(this.giftList);
         this.giftList.addEventListener(MouseEvent.MOUSE_OVER,this.onListMouse);
         this.giftList.addEventListener(MouseEvent.MOUSE_OUT,this.onListMouse);
      }
      
      private function onListMouse(param1:MouseEvent) : void
      {
         var _loc2_:FListCellRenderer = null;
         var _loc3_:Object = null;
         var _loc4_:Point = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               Tools.currentStage.addChild(this.tipCanvas);
               this.tipCanvas.visible = false;
               this.giftList.addEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(param1.target as TextField)
               {
                  _loc2_ = (param1.target as TextField).parent as FListCellRenderer;
                  _loc3_ = _loc2_.data;
                  this.tip.text = _loc3_.name;
                  this.tipCanvas.width = this.tip.width + 4;
                  this.tipCanvas.height = this.tip.height + 4;
                  this.tipCanvas.visible = true;
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
               this.giftList.removeEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               Tools.currentStage.removeChild(this.tipCanvas);
         }
      }
   }
}

