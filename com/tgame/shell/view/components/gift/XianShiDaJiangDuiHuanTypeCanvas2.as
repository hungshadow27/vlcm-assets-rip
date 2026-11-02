package com.tgame.shell.view.components.gift
{
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.XianshiDajiangDuihuanPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class XianShiDaJiangDuiHuanTypeCanvas2 extends Sprite
   {
      
      private var _parent:DisplayObject;
      
      private var line:Bitmap;
      
      private var icoImg:DisplayObject;
      
      private var icoImg1:DisplayObject;
      
      private var ft2:FTextArea;
      
      private var ft1:FTextArea;
      
      private var btn:SecondButton;
      
      private var tf:TextFormat;
      
      private var parm1:int;
      
      private var parm2:int;
      
      private var parm3:int;
      
      private var item:ItemFace;
      
      private var btnSpr:Sprite;
      
      private var bgSpr:Sprite;
      
      private var icox1:int;
      
      private var icoy1:int;
      
      public function XianShiDaJiangDuiHuanTypeCanvas2()
      {
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.line = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.bgSpr.addChild(this.line);
         this.line.x = 30;
         this.line.y = 0;
         this.icoImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xianshihuodong/img1.png",35,35);
         this.icoImg.x = this.line.x + 2;
         this.icoImg.y = this.line.y + 2;
         this.bgSpr.addChild(this.icoImg);
         this.line = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.4");
         this.bgSpr.addChild(this.line);
         this.line.x = 40;
         this.line.y = 72;
         this.line = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.bgSpr.addChild(this.line);
         this.line.x = 30;
         this.line.y = 184;
         this.icox1 = this.line.x;
         this.icoy1 = this.line.y;
         this.line = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.4");
         this.bgSpr.addChild(this.line);
         this.line.x = 145;
         this.line.y = 215;
         this.line.rotation = -90;
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            defaultTextFormat = tf;
            x = line.x;
            y = line.y - line.height - 10;
            wordWrap = true;
            width = line.width;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            htmlText = "10/100";
         }
         this.bgSpr.addChild(this.ft2);
         this.line = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.bgSpr.addChild(this.line);
         this.line.x = 295;
         this.line.y = 184;
         this.icoImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xianshihuodong/img2.png",35,35);
         this.icoImg.x = this.line.x + 2;
         this.icoImg.y = this.line.y + 2;
         this.bgSpr.addChild(this.icoImg);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 80;
            y = 0;
            wordWrap = true;
            width = 480;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ft1);
         this.btnSpr = new Sprite();
         this.btnSpr.x = 350;
         this.btnSpr.y = 100;
         this.bgSpr.addChild(this.btnSpr);
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_BTN_LINGQU,"",[this.parm1,param1.currentTarget.proto.a2,param1.currentTarget.proto.a3]));
      }
      
      public function SetInitialize(param1:int, param2:Array) : void
      {
         var i:int;
         var ft:FTextArea = null;
         var btn:SecondButton = null;
         var o:Object = null;
         var $huodongID:int = param1;
         var ar:Array = param2;
         this.parm1 = $huodongID;
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(ar[2][0]);
         this.item.x = this.icox1 + 2;
         this.item.y = this.icoy1 + 2;
         this.bgSpr.addChild(this.item);
         this.ft1.htmlText = ar[2][1];
         if(this.ft1.height > 180)
         {
            this.bgSpr.y = this.ft1.y + this.ft1.height - 150;
         }
         this.ft2.htmlText = ar[2][2];
         while(this.btnSpr.numChildren > 0)
         {
            this.btnSpr.removeChildAt(0);
         }
         i = 0;
         while(i < ar[2][3].length)
         {
            ft = new FTextArea();
            with(ft)
            {
               
               x = 0;
               y = 30 * i + 2;
               autoSize = TextFieldAutoSize.LEFT;
               textColor = StaticValue.WHITE;
               htmlText = ar[2][3][i][1];
            }
            this.btnSpr.addChild(ft);
            btn = new SecondButton();
            btn.label = ar[2][3][i][4];
            o = new Object();
            o.a2 = ar[2][3][i][0];
            o.a3 = ar[2][3][i][3];
            btn.proto = o;
            this.btnSpr.addChild(btn);
            btn.x = ft.x + ft.width + 10;
            btn.y = 30 * i;
            if(ar[2][3][i][2])
            {
               btn.enabled = true;
               btn.label = ar[2][3][i][4];
            }
            else
            {
               btn.enabled = false;
               btn.label = LanResManager.getLanCommonTextWords("已兑换");
            }
            btn.addEventListener(MouseEvent.CLICK,this.onClick);
            i++;
         }
         this.btnSpr.y = this.bgSpr.height - this.btnSpr.height;
      }
   }
}

