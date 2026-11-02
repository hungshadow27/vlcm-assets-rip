package com.tgame.shell.view.components.couple
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.LaunchProposalPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class YupeiListRender extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      private var img:Bitmap;
      
      private var OkBtn:SmallButton;
      
      private var bgImg:DisplayObject;
      
      private var item:ItemFace;
      
      public function YupeiListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var ft:FTextArea;
         _height = 80;
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot.big");
         addChild(this.img);
         this.img.x = 10;
         this.img.y = 3;
         this.bgImg = FLoader.startLoad(data.tubiaoMath,65,65);
         this.bgImg.x = 12;
         this.bgImg.y = 5;
         addChild(this.bgImg);
         ft = new FTextArea();
         with(ft)
         {
            x = 87;
            y = 20;
            width = 110;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BLUE;
            text = data.name;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 87;
            y = 43;
            width = 110;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            text = LanResManager.getLanCommonTextWords("售价：");
         }
         addChild(ft);
         this.img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(this.img);
         this.img.x = 120;
         this.img.y = 41;
         ft = new FTextArea();
         with(ft)
         {
            x = 140;
            y = 43;
            width = 110;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            text = data.price;
         }
         addChild(ft);
         this.img = StaticValue.getBitmapByClassName("ui.marriage.jade.text.nengli");
         addChild(this.img);
         this.img.x = 225;
         this.img.y = 11;
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 210;
         this.img.y = 28;
         this.item = new ItemFace(data.nengli1);
         this.item.x = 212;
         this.item.y = 30;
         addChild(this.item);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 255;
         this.img.y = 28;
         this.item = new ItemFace(data.nengli2);
         this.item.x = 257;
         this.item.y = 30;
         addChild(this.item);
         this.img = StaticValue.getBitmapByClassName("ui.marriage.jade.text.xiaoguo");
         addChild(this.img);
         this.img.x = 325;
         this.img.y = 11;
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 310;
         this.img.y = 28;
         this.item = new ItemFace(data.xiaoguo1);
         this.item.x = 312;
         this.item.y = 30;
         addChild(this.item);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 355;
         this.img.y = 28;
         this.item = new ItemFace(data.xiaoguo2);
         this.item.x = 357;
         this.item.y = 30;
         addChild(this.item);
         this.OkBtn = new SmallButton();
         this.OkBtn.label = LanResManager.getLanCommonTextWords("购买");
         addChild(this.OkBtn);
         this.OkBtn.x = 436;
         this.OkBtn.y = 40;
         this.OkBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.img = StaticValue.getBitmapByClassName("ui.line");
         addChild(this.img);
         this.img.width = 474;
         this.img.y = 77;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.OkBtn:
               $parent.dispatchEvent(new BaseEvent(LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_YUPEILISTRENDERI_OK_CLICK,"",{
                  "name":data.name,
                  "id":data.id,
                  "price":data.price,
                  "tubiaoMath":data.tubiaoMath
               }));
         }
      }
   }
}

