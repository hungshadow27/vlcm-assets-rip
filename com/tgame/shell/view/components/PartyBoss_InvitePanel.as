package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.*;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class PartyBoss_InvitePanel extends FPanel
   {
      
      public static const UI_PARTYBOSS_INVITE_CLICK:String = "UI_PARTYBOSS_INVITE_CLICK";
      
      public var $parent:DisplayObject;
      
      private var btnAccept:SecondButton;
      
      private var btnCancel:SecondButton;
      
      private var ft:FTextArea;
      
      private var ftJiNeng:FTextArea;
      
      private var ftZF:FTextArea;
      
      private var ftDesc:FTextArea;
      
      private var headImg:DisplayObject;
      
      private var _avatar:Bitmap;
      
      private var strDesc1:String = LanResManager.getLanCommonTextWords("帮派官员");
      
      private var strDesc2:String = LanResManager.getLanCommonTextWords("开启了一个帮派副本，邀请您前去参加，击杀副本中的怪物可获得大量经验，真气，除此之外还能获得帮派贡献，天赋碎片甚至珍稀天赋。点击接取任务前往帮派副本。");
      
      public function PartyBoss_InvitePanel()
      {
         super();
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/party/ui.party.boss.invite.bg.swf");
         _loc1_.x = 10;
         _loc1_.y = 1;
         addChild(_loc1_);
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 543;
         height = 310;
         this.titleText = LanResManager.getLanCommonTextWords("帮派BOSS副本邀请");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this._avatar = new Bitmap();
         addChild(this._avatar);
         this.initUI();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function initUI() : void
      {
         this.ft = new FTextArea();
         this.ft.text = LanResManager.getLanCommonTextWords("BOSS特殊技能") + "：";
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.x = 145;
         this.ft.y = 20;
         addChild(this.ft);
         this.ftJiNeng = new FTextArea();
         this.ftJiNeng.width = 350;
         this.ftJiNeng.textColor = StaticValue.GREEN;
         this.ftJiNeng.x = 145 + 20;
         this.ftJiNeng.y = 40;
         addChild(this.ftJiNeng);
         this.ft = new FTextArea();
         this.ft.htmlText = LanResManager.getLanCommonTextWords("克制阵法") + "：";
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.x = 145;
         this.ft.y = 100;
         addChild(this.ft);
         this.ftZF = new FTextArea();
         this.ftZF.width = 200;
         this.ftZF.textColor = StaticValue.RED;
         this.ftZF.x = 145 + 20;
         this.ftZF.y = 120;
         addChild(this.ftZF);
         this.ftDesc = new FTextArea();
         this.ftDesc.textColor = StaticValue.WHITE;
         this.ftDesc.width = 515;
         this.ftDesc.wordWrap = true;
         this.ftDesc.x = 20 - 3;
         this.ftDesc.y = 160;
         addChild(this.ftDesc);
         this.btnAccept = new SecondButton();
         with(this.btnAccept)
         {
            x = 150;
            y = 235 + 10;
            label = LanResManager.getLanCommonTextWords("接取任务");
            addEventListener(MouseEvent.CLICK,onAcceptClick);
         }
         addChild(this.btnAccept);
         this.btnCancel = new SecondButton();
         with(this.btnCancel)
         {
            x = 371;
            y = 235 + 10;
            label = LanResManager.getLanCommonTextWords("取消");
            addEventListener(MouseEvent.CLICK,onCancelClick);
         }
         addChild(this.btnCancel);
      }
      
      private function onAcceptClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_PARTYBOSS_INVITE_CLICK));
         this.onClose();
      }
      
      private function onCancelClick(param1:MouseEvent) : void
      {
         this.onClose();
      }
      
      public function initPanel(param1:String, param2:String, param3:String) : void
      {
         this.ftJiNeng.htmlText = param2;
         this.ftZF.text = "【" + param1 + "】";
         this.ftDesc.htmlText = this.strDesc1 + param3 + this.strDesc2;
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.scaleX = this._avatar.scaleY = 1;
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         var _loc2_:Number = 1;
         if(this._avatar.height != 110)
         {
            _loc2_ = 110 / this._avatar.height;
         }
         var _loc3_:Rectangle = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
         this._avatar.bitmapData = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         this._avatar.bitmapData.copyPixels(param1,_loc3_,new Point(0,0));
         var _loc4_:Number = 1;
         if(_loc3_.width > 115)
         {
            _loc4_ = 115 / _loc3_.width;
         }
         this._avatar.scaleX = this._avatar.scaleY = _loc2_ > _loc4_ ? _loc4_ : _loc2_;
         this._avatar.x = 72 - this._avatar.width / 2;
         this._avatar.y = 73 - this._avatar.height / 2;
      }
   }
}

