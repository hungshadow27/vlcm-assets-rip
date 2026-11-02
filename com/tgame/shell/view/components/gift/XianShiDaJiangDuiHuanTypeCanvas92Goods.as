package com.tgame.shell.view.components.gift
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.XianshiDajiangDuihuanPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.manager.TimerManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class XianShiDaJiangDuiHuanTypeCanvas92Goods extends Sprite
   {
      
      private var _parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var tubiaoBg:Bitmap;
      
      private var icox:int;
      
      private var icoy:int;
      
      private var btn:SecondButton;
      
      private var obj1:DisplayObject;
      
      private var parm1:int;
      
      private var parm2:int;
      
      private var parm3:int;
      
      private var tishi:String;
      
      private var contentSpr:Sprite;
      
      private var bo:Boolean = false;
      
      private var mianbanId:int;
      
      private var aTimer:TimerData;
      
      public function XianShiDaJiangDuiHuanTypeCanvas92Goods()
      {
         super();
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 5;
            y = 0;
            wordWrap = true;
            width = 550;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ft);
         this.contentSpr = new Sprite();
         this.contentSpr.x = 450;
         this.contentSpr.y = 0;
         addChild(this.contentSpr);
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("领取奖励");
         addChild(this.btn);
         this.btn.x = 490;
         this.btn.y = 10;
         this.btn.enabled = true;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               this._parent.dispatchEvent(new BaseEvent(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_BTN_LINGQU,"",[this.parm1,this.parm2,this.parm3,this.tishi]));
               if(this.bo)
               {
                  this._parent.dispatchEvent(new BaseEvent(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_DAKAI_MIANBAN,"",[this.mianbanId]));
               }
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function SetInitialize(param1:int, param2:Array) : void
      {
         var i:int;
         var pt:Number = NaN;
         var ptTotal:Number = NaN;
         var onUpdate:Function = null;
         var item:ItemFace = null;
         var img:Bitmap = null;
         var $huodongID:int = param1;
         var ar:Array = param2;
         onUpdate = function():void
         {
            pt += 1;
            if(pt > ptTotal)
            {
               pt = ptTotal;
               if(aTimer != null)
               {
                  TimerManager.deleteTimer(aTimer);
                  aTimer = null;
               }
            }
            var _loc1_:Function = Math.floor;
            var _loc2_:int = _loc1_(pt / 3600);
            var _loc3_:int = _loc1_(pt % 3600 / 60);
            var _loc4_:int = _loc1_(pt % 3600 % 60);
            var _loc5_:String = "";
            if(_loc2_ > 0)
            {
               _loc5_ += _loc2_ + LanResManager.getLanCommonTextWords("小时");
            }
            if(_loc3_ > 0)
            {
               _loc5_ += _loc3_ + LanResManager.getLanCommonTextWords("分");
            }
            if(_loc4_ > 0)
            {
               _loc5_ += _loc4_ + LanResManager.getLanCommonTextWords("秒");
            }
            ft.htmlText = ar[2][2].replace("hh:mm:ss",_loc5_);
         };
         this.parm1 = $huodongID;
         this.parm2 = ar[0];
         this.parm3 = ar[2][3];
         if(this.aTimer != null)
         {
            TimerManager.deleteTimer(this.aTimer);
            this.aTimer = null;
         }
         pt = Number(ar[2][6]);
         ptTotal = Number(ar[2][7]);
         this.aTimer = TimerManager.createTimer(1000,0,onUpdate);
         onUpdate();
         this.contentSpr.y = this.ft.y + this.ft.height;
         this.btn.y = this.ft.y + this.ft.height + 10;
         if(ar[2][1])
         {
            this.btn.enabled = true;
            this.btn.label = ar[2][4];
         }
         else
         {
            this.btn.enabled = false;
            this.btn.label = ar[2][4];
         }
         this.tishi = ar[2][5];
         while(this.contentSpr.numChildren > 0)
         {
            this.contentSpr.removeChildAt(0);
         }
         i = 0;
         while(i < ar[2][0].length)
         {
            img = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.contentSpr.addChild(img);
            img.x = i * -40 - 2;
            img.y = -2;
            item = new ItemFace(ar[2][0][i]);
            item.x = i * -40;
            this.contentSpr.addChild(item);
            i++;
         }
      }
      
      public function setTanchuMianban(param1:Boolean, param2:int) : void
      {
         this.bo = param1;
         this.mianbanId = param2;
      }
   }
}

