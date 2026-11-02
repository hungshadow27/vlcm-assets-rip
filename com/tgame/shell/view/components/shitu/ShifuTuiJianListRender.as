package com.tgame.shell.view.components.shitu
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.FriendPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ShifuTuiJianListRender extends FListCellRenderer
   {
      
      public static var panelNo:int;
      
      public static var $parent:DisplayObject;
      
      private var headImg:Bitmap;
      
      private var headBg:Bitmap;
      
      private var ft:FTextArea;
      
      private var btn_check:SmallButton;
      
      private var line:Bitmap;
      
      public function ShifuTuiJianListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 53;
         this.headBg = StaticValue.getBitmapByClassName("ui.shitu.touxiang.kuang");
         addChild(this.headBg);
         this.headBg.y = 3;
         this.headBg.x = 2;
         this.headImg = new Bitmap();
         this.headImg.bitmapData = StaticValue.getBitmapByClassName(data.res).bitmapData;
         this.headImg.width = this.headImg.height = 40;
         addChild(this.headImg);
         this.headImg.x = 5;
         this.headImg.y = 6;
         this.ft = new FTextArea();
         with(this.ft)
         {
            autoSize = TextFieldAutoSize.LEFT;
            x = 50;
            y = 15;
            textColor = StaticValue.ORANGE;
            width = 130;
            height = 40;
            htmlText = data.playerName + "<br>" + data.lv + LanResManager.getLanCommonTextWords("级") + data.party;
         }
         addChild(this.ft);
         this.btn_check = new SmallButton();
         this.btn_check.label = LanResManager.getLanCommonTextWords("查看");
         addChild(this.btn_check);
         this.btn_check.x = 220;
         this.btn_check.y = 27;
         this.btn_check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.line = StaticValue.getBitmapByClassName("ui.line");
         this.line.width = 227;
         addChild(this.line);
         this.line.x = 8;
         this.line.y = 52;
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         if(panelNo == 1)
         {
            $parent.dispatchEvent(new BaseEvent(FriendPanel.UI_SHITUTUIJIAN_CHECK,"",int(data.label)));
         }
         else
         {
            $parent.dispatchEvent(new BaseEvent(FriendPanel.UI_TUDITUIJIAN_CHECK,"",int(data.label)));
         }
      }
   }
}

