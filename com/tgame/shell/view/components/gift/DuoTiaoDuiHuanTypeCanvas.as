package com.tgame.shell.view.components.gift
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.XianshiDajiangDuihuanPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class DuoTiaoDuiHuanTypeCanvas extends Sprite
   {
      
      private var _parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var btn:SecondButton;
      
      private var parm1:int;
      
      private var parm2:int;
      
      private var parm3:int;
      
      private var contentSpr:Sprite;
      
      public function DuoTiaoDuiHuanTypeCanvas()
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
         this.contentSpr = new Sprite();
         this.contentSpr.x = 5;
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
               this._parent.dispatchEvent(new BaseEvent(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_BTN_LINGQU,"",[this.parm1,this.parm2,this.parm3,""]));
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function SetInitialize(param1:int, param2:Array) : void
      {
         var i:int;
         var item:ItemFace = null;
         var img:Bitmap = null;
         var goodsArr:Array = null;
         var j:int = 0;
         var $huodongID:int = param1;
         var ar:Array = param2;
         this.parm1 = $huodongID;
         this.parm2 = ar[0];
         this.parm3 = ar[2][3];
         while(this.contentSpr.numChildren > 0)
         {
            this.contentSpr.removeChildAt(0);
         }
         i = 0;
         while(i < ar[2][0].length)
         {
            this.ft1 = new FTextArea();
            with(this.ft1)
            {
               
               x = 5;
               y = i * 100;
               wordWrap = true;
               width = 550;
               autoSize = TextFieldAutoSize.LEFT;
               htmlText = ar[2][0][i].miaoshu;
            }
            this.contentSpr.addChild(this.ft1);
            goodsArr = ar[2][0][i].goods;
            j = 0;
            while(j < goodsArr.length)
            {
               img = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.contentSpr.addChild(img);
               img.x = 445 + j * -40 - 2;
               if(i == 0)
               {
                  img.y = this.ft1.y + this.ft1.height - 20;
               }
               else
               {
                  img.y = this.ft1.y;
               }
               item = new ItemFace(new Goods(goodsArr[j]));
               item.x = 445 + j * -40;
               if(i == 0)
               {
                  item.y = this.ft1.y + this.ft1.height - 20 + 2;
               }
               else
               {
                  item.y = this.ft1.y + 2;
               }
               this.contentSpr.addChild(item);
               j++;
            }
            i++;
         }
         this.contentSpr.y = this.ft.y + this.ft.height;
         this.btn.y = this.ft.y + this.ft.height + 30;
         this.btn.enabled = true;
         this.btn.label = ar[2][2];
      }
   }
}

