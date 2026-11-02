package com.tgame.shell.view.components.friend
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.FriendPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class SnoopEnemyPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var id:int;
      
      private var headImg:Bitmap;
      
      private var enemyName:FLabel;
      
      private var level:FLabel;
      
      private var map:FLabel;
      
      private var point:FLabel;
      
      private var tip:FTextArea;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      public function SnoopEnemyPanel()
      {
         var img:Bitmap;
         var ft:FTextArea;
         super();
         skin = "sceondPanel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 254;
         height = 194;
         titleText = LanResManager.getLanCommonTextWords("打探玩家");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.friend.enemy.search.ui");
         addChild(img);
         img.x = 6;
         img.y = 2;
         ft = new FTextArea();
         with(ft)
         {
            x = 12;
            y = 5;
            width = 228;
            height = 35;
            wordWrap = true;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"打探玩家当前所在");
         }
         addChild(ft);
         this.headImg = new Bitmap();
         addChild(this.headImg);
         this.headImg.x = 18;
         this.headImg.y = 53;
         ft = new FTextArea();
         with(ft)
         {
            x = 55;
            y = 45;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'3\'>" + LanResManager.getLanCommonTextWords("玩家：所在地图：所在坐标：") + "</textformat>";
         }
         addChild(ft);
         this.enemyName = new FLabel();
         with(this.enemyName)
         {
            x = 117;
            y = 45;
            textColor = StaticValue.BLUE;
            text = LanResManager.getLanCommonTextWords("玩家名字六字");
         }
         addChild(this.enemyName);
         this.level = new FLabel();
         with(this.level)
         {
            x = 208;
            y = 45;
            textColor = StaticValue.WHITE;
            text = "100";
         }
         addChild(this.level);
         this.map = new FLabel();
         with(this.map)
         {
            x = 130;
            y = 63;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanTextWords(this,"新手村");
         }
         addChild(this.map);
         this.point = new FLabel();
         with(this.point)
         {
            x = 130;
            y = 80;
            textColor = StaticValue.WHITE;
            text = "50，50";
         }
         addChild(this.point);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 12;
            y = 106;
            width = 187;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            tip.text = LanResManager.getLanTextWords(this,"很抱歉，对方当前没有在线");
         }
         addChild(this.tip);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanTextWords(this,"打探");
         addChild(this.okBtn);
         this.okBtn.x = 35;
         this.okBtn.y = 140;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = width - 35 - this.cancelBtn.width;
         this.cancelBtn.y = 140;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_ENEMY_SNOOP_BTN_CLICK,"",this.id));
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setEnemy(param1:int, param2:String, param3:String) : void
      {
         this.id = param1;
         this.headImg.bitmapData = StaticValue.getBitmapByClassName(param3).bitmapData;
         this.headImg.width = this.headImg.height = 35;
         this.enemyName.text = param2;
      }
      
      public function setResult(param1:int, param2:String, param3:String, param4:String, param5:String) : void
      {
         if(param1 != this.id)
         {
            return;
         }
         this.map.text = param2;
         this.point.text = param3;
         this.tip.text = param4;
         this.level.text = "[" + param5 + "]";
      }
      
      public function reset() : void
      {
         this.tip.text = "";
         this.map.text = "";
         this.point.text = "";
         this.level.text = "";
      }
   }
}

