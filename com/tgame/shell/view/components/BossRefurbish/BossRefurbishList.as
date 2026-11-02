package com.tgame.shell.view.components.BossRefurbish
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.MainCharSeachPathManager;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.TextEvent;
   import flash.text.*;
   
   public class BossRefurbishList extends FListCellRenderer
   {
      
      public static var _parent:DisplayObject;
      
      private var tf:TextFormat;
      
      public var showBtnBoss:FSimpleButton;
      
      public var _particularBg:Sprite;
      
      private var _pip:FTextArea;
      
      private var _grade:FTextArea;
      
      private var ft:FTextArea;
      
      private var _map:FTextArea;
      
      private var _time:FTextArea;
      
      private var _say:FTextArea;
      
      private var _particularFt:FTextArea;
      
      private var _particularTxt:String;
      
      private var _npcid:int;
      
      public function BossRefurbishList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 20;
         this.tf = new TextFormat();
         this.tf.align = "left";
         this.ft = new FTextArea();
         with(this.ft)
         {
            defaultTextFormat = tf;
            x = 0;
            y = 2;
            width = 90;
            height = 20;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BLUE;
            htmlText = data.name;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            defaultTextFormat = tf;
            x = 92;
            y = 2;
            width = 40;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanTextWords(this,"级别",[data.grade]);
         }
         addChild(this.ft);
         this._map = new FTextArea();
         with(this._map)
         {
            defaultTextFormat = tf;
            x = 130;
            y = 2;
            width = 70;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            htmlText = "<u><a href=\'event:" + data.sceneId + "," + data.bossX + "," + data.bossY + ",0" + "\'>" + data.map + "</a></u>";
         }
         addChild(this._map);
         this._map.addEventListener(TextEvent.LINK,this.onMapClick);
         this.ft = new FTextArea();
         with(this.ft)
         {
            defaultTextFormat = tf;
            x = 220;
            y = 2;
            width = 82;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ft);
         if(data.fettle == 1)
         {
            this.ft.htmlText = LanResManager.getLanTextWords(this,"等待刷新");
            this.ft.textColor = StaticValue.ORANGE;
         }
         else if(data.fettle == 2)
         {
            this.ft.htmlText = LanResManager.getLanTextWords(this,"已刷新");
            this.ft.textColor = StaticValue.WHITE;
         }
         this._pip = new FTextArea();
         with(this._pip)
         {
            name = "_pip";
            defaultTextFormat = tf;
            x = 295;
            y = 2;
            width = 150;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = "<u>" + data.pip + "</u>";
         }
         addChild(this._pip);
         if(data.isOnLine == 0)
         {
            this._pip.textColor = 6052956;
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         _parent = param1;
      }
      
      private function onMapClick(param1:TextEvent) : void
      {
         MainCharSeachPathManager.mainCharWalk(param1.text);
      }
   }
}

