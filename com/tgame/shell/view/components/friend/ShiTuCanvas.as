package com.tgame.shell.view.components.friend
{
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.FriendPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class ShiTuCanvas extends Sprite
   {
      
      public static var isWrite:Boolean;
      
      public var _parent:DisplayObject;
      
      private var shituList:FList;
      
      private var ft:FTextArea;
      
      private var btn_fafang:SecondButton;
      
      private var btn_lingqu:SecondButton;
      
      private var btn_baishi:SecondButton;
      
      private var btn_tuichu:SecondButton;
      
      private var bgKuang:FCanvas;
      
      private var btn_ceshi:SecondButton;
      
      private var _num:int;
      
      public function ShiTuCanvas()
      {
         var lb:FLabel;
         var line:Bitmap = null;
         super();
         this.bgKuang = new FCanvas();
         this.bgKuang.skin = "box_transparence";
         this.bgKuang.width = 226;
         this.bgKuang.height = 287;
         addChild(this.bgKuang);
         lb = new FLabel();
         with(lb)
         {
            x = 10;
            y = 7;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("师徒名称");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 133;
            y = 7;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 172;
            y = 7;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("称号");
         }
         addChild(lb);
         line = StaticValue.getBitmapByClassName("ui.line");
         line.width = 220;
         addChild(line);
         line.x = 3;
         line.y = 25;
         line = new Bitmap();
         line = StaticValue.getBitmapByClassName("ui.line");
         line.width = 220;
         addChild(line);
         line.x = 3;
         line.y = 260;
         this.shituList = new FList();
         this.shituList.itemRenderer = new ShiTuListRender();
         this.shituList.skin = "list";
         this.shituList.listWidth = 220;
         this.shituList.listHeight = 215;
         addChild(this.shituList);
         this.shituList.x = 3;
         this.shituList.y = 29;
         this.shituList.addEventListener(MouseEvent.CLICK,this.onList);
         this.btn_baishi = new SecondButton();
         this.btn_baishi.label = LanResManager.getLanCommonTextWords("我要拜师");
         addChild(this.btn_baishi);
         this.btn_baishi.x = 25;
         this.btn_baishi.y = 298;
         this.btn_baishi.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.btn_tuichu = new SecondButton();
         this.btn_tuichu.label = LanResManager.getLanCommonTextWords("退出师门");
         addChild(this.btn_tuichu);
         this.btn_tuichu.x = 120;
         this.btn_tuichu.y = 298;
         this.btn_tuichu.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 4;
            y = 265;
            width = 160;
            height = 20;
            textColor = StaticValue.ORANGE;
            text = "";
         }
         addChild(this.ft);
         this.btn_fafang = new SecondButton();
         this.btn_fafang.label = LanResManager.getLanCommonTextWords("发放");
         addChild(this.btn_fafang);
         this.btn_fafang.x = 177;
         this.btn_fafang.y = 262;
         this.btn_fafang.addEventListener(MouseEvent.CLICK,this.onBtnClick);
      }
      
      private function onList(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.CLICK:
               if(param1.target is FTextArea)
               {
                  this._parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_FRIEND_MENU_SHOW,"",[int(this.shituList.selectItem.label),this.shituList.selectItem.playerName,this._num,6,param1]));
               }
         }
      }
      
      private function initUI() : void
      {
         this.ft.text = "";
         this.btn_fafang.visible = false;
      }
      
      public function set dataProvider(param1:XML) : void
      {
         this.shituList.dataProvider = param1;
         if(param1.children().length() > 0)
         {
            this.shituList.setSelectItemByIndex(0);
            this.btn_tuichu.enabled = true;
            this.btn_fafang.enabled = true;
         }
         else
         {
            this.btn_tuichu.enabled = false;
            this.btn_fafang.enabled = false;
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         ShiTuListRender.$parent = param1;
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn_fafang:
               if(this.btn_fafang.label == LanResManager.getLanCommonTextWords("领取"))
               {
                  this._parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_SHITU_LINGQU));
               }
               else
               {
                  this._parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_SHITU_FAFANG));
               }
               break;
            case this.btn_baishi:
               if(this.btn_baishi.label == LanResManager.getLanCommonTextWords("我要拜师"))
               {
                  this._parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_SHITU_BAISHI));
               }
               else
               {
                  this._parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_SHITU_SHOUTU));
               }
               break;
            case this.btn_tuichu:
               if(this.btn_tuichu.label == LanResManager.getLanCommonTextWords("退出师门"))
               {
                  this._parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_SHITU_TUICHU));
               }
               else if(this.shituList.selectItem != null)
               {
                  this._parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_SHITU_QUZHU,"",int(this.shituList.selectItem.label)));
               }
         }
      }
      
      public function setShituInfo(param1:int) : void
      {
         this.initUI();
         this._num = param1;
         if(param1 == 0)
         {
            this.btn_fafang.label = LanResManager.getLanCommonTextWords("领取");
            this.btn_baishi.label = LanResManager.getLanCommonTextWords("我要拜师");
            this.btn_baishi.x = 25;
            this.ft.text = LanResManager.getLanCommonTextWords("徒弟每天可领取次强身药剂");
            ShiTuListRender.isWrite = false;
            this.btn_fafang.visible = true;
            this.btn_tuichu.visible = true;
         }
         else
         {
            this.btn_fafang.label = LanResManager.getLanCommonTextWords("发放");
            this.btn_baishi.label = LanResManager.getLanCommonTextWords("我要收徒");
            this.btn_baishi.x = 80;
            this.btn_tuichu.visible = false;
            this.ft.text = LanResManager.getLanCommonTextWords("师傅每天可发放次强身药剂");
            ShiTuListRender.isWrite = true;
            this.btn_fafang.visible = true;
         }
      }
   }
}

